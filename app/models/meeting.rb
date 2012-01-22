class Meeting
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :sales_person

  field :score,               type: Integer
  field :type,                type: String
  field :additional_people,   type: Array
  field :customer,            type: String
  field :conducted,           type: Boolean
  field :meeting_time,        type: DateTime
  field :customer_contact,    type: String
  field :description,         type: String
  field :lead_type,           type: String
  field :score,               type: Integer

end