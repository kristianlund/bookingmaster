class SalesPersonController < ApplicationController
  before_filter :authenticate_user

  def index
    #name = @current_user.name.delete("^a-zA-Z ")
    if SalesPerson.all.empty?
      init = InitMeetingTypes.new
      init.init_all
    #  @sales_person = SalesPerson.where(:name => name).first
    #else
    #  @sales_person = SalesPerson.new
    #  @sales_person.name = name
    #  @sales_person.score = {sale: 0, booked: 0, conducted: 0}
    #  @sales_person.week_scores = Hash.new
    #  @sales_person.week_sales_score = Hash.new
    #  @sales_person.week_booked_score = Hash.new
    #  @sales_person.week_conducted_score = Hash.new
    #  @sales_person.save
    end
    #@meetings = Meeting.where(:sales_person_id => @sales_person.id)
    @meetings = Meeting.where()
  end

  def get_scores
    @sales_persons = SalesPerson.where()
    @meeting_weeks = GlobalInfo.where(:uid => 1).first.meeting_weeks
    render 'score_table'
  end

  def get_scores_this_week
    @sales_persons = SalesPerson.where()
    @sales_persons.each do |sales_person|
      sales_person.meetings
    end
  end
end