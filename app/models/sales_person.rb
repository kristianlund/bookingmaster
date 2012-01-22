class SalesPerson
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :meeting

  field :name,                  type: String
  field :score,                 type: Hash
  field :week_scores,           type: Hash
  field :week_sales_score,      type: Hash
  field :week_booked_score,     type: Hash
  field :week_conducted_score,  type: Hash

  key :name
end