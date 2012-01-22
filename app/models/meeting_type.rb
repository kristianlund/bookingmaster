class MeetingType
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :meeting

  field :name,    type: String
  field :value,   type: Integer

  key :name
end