class InitMeetingTypes

  def init_types
    meeting = MeetingType.new
    meeting.name = "Java"
    meeting.value = 1
    meeting.save

    meeting = MeetingType.new
    meeting.name = ".net"
    meeting.value = 1
    meeting.save

    meeting = MeetingType.new
    meeting.name = "Epi"
    meeting.value = 1
    meeting.save

    meeting = MeetingType.new
    meeting.name = "BI"
    meeting.value = 2
    meeting.save

    meeting = MeetingType.new
    meeting.name = "Sharepoint"
    meeting.value = 3
    meeting.save

    meeting = MeetingType.new
    meeting.name = "Annet"
    meeting.value = 1
    meeting.save

  end

  def init_global
    global = GlobalInfo.new
    global.uid = 1
    global.meeting_weeks = []
    global.save
  end

  def init_person(person_name)
    sales_person = SalesPerson.new
    sales_person.name = person_name
    sales_person.score = {sale: 0, booked: 0, conducted: 0}
    sales_person.week_scores = Hash.new
    sales_person.week_sales_score = Hash.new
    sales_person.week_booked_score = Hash.new
    sales_person.week_conducted_score = Hash.new
    sales_person.save
  end

  def init_all
    sales_persons = ["Tom", "Line", "Tore", "Katrine", "Anders", "Niko", "Thordur", "Monica", "Vivian"]
    sales_persons.each do |person|
      init_person(person)
    end
    init_types
    init_global
  end
end