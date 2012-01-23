# encoding: utf-8
class MeetingController < ApplicationController
  before_filter :authenticate_user

  def new
    @sales_persons = SalesPerson.where()
    @meeting_types = MeetingType.where()
  end

  def add_meeting
    sales_person = SalesPerson.where(:name => params[:sales_person]).first
    person_hash = params[:person]
    meeting_time = DateTime.new(person_hash['meeting_time(1i)'].to_i, person_hash['meeting_time(2i)'].to_i, person_hash['meeting_time(3i)'].to_i, person_hash['meeting_time(4i)'].to_i, person_hash['meeting_time(5i)'].to_i)

    meeting = Meeting.new
    meeting.customer = params[:customer].force_encoding("utf-8")
    meeting.customer_contact = params[:customer_contact].force_encoding("utf-8")
    meeting.type = params[:meeting_type].force_encoding("utf-8")
    meeting.additional_people = [params[:additional_people].force_encoding("utf-8")]
    meeting.meeting_time = meeting_time
    meeting.conducted = false
    meeting.sales_person = sales_person
    meeting.lead_type = params[:lead_type].force_encoding("utf-8")
    meeting.description = params[:description].force_encoding("utf-8")
    meeting.score = get_score(params[:meeting_type]).to_i
    meeting.save

    update_score(params[:sales_person], params[:meeting_type], params[:lead_type])
    redirect_to '/'
  end

  def remove_meeting
    Meeting.where(:_id => params[:id]).delete_all
    redirect_to :back
  end

  def get_score(type)
    MeetingType.where(:name => type).first.value
  end

  def update_score(name, type, lead_type)
    sales_person = SalesPerson.where(:name => name).first
    value = MeetingType.where(:name => type).first.value
    year_week = DateTime.now.strftime("%Y%V")
    update_global(year_week)

    week_scores = sales_person.week_scores
    update_scores(week_scores, year_week, value)
    sales_person.week_scores = week_scores

    if lead_type.eql?("Salg")
      week_scores = sales_person.week_sales_score
      update_scores(week_scores, year_week, value)
      sales_person.week_sales_score = week_scores

    elsif lead_type.eql?("Booking av møte")
      week_scores = sales_person.week_booked_score
      update_scores(week_scores, year_week, value)
      sales_person.week_booked_score = week_scores

    elsif lead_type.eql?("Avholdt møte")
      week_scores = sales_person.week_conducted_score
      update_scores(week_scores, year_week, value)
      sales_person.week_conducted_score = week_scores
    end


    sales_person.score[translate_lead_type(lead_type)] += value
    sales_person.save
  end

  def update_global(year_week)
    global_info = GlobalInfo.where().first
    unless global_info.meeting_weeks.include?(year_week)
      global_info.meeting_weeks += [year_week]
      global_info.save
    end
  end

  def translate_lead_type(lead_type)
    if lead_type.eql?("Booking av møte")
      return "booked"
    elsif lead_type.eql?("Avholdt møte")
      return "conducted"
    end
    "sale"
  end

  def update_scores(week_scores, year_week, value)
    if week_scores[year_week].nil?
      week_scores[year_week] = value
    else
      week_scores[year_week] += value
    end
    week_scores
  end
end