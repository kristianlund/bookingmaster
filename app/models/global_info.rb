class GlobalInfo
  include Mongoid::Document

  field :uid,           type: Integer
  field :meeting_weeks,  type: Array

  key :uid
end