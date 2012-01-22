class User
  include Adauth::UserModel
  include Mongoid::Document
  include Mongoid::Timestamps

  field :login,           type: String
  field :group_strings,   type: String
  field :ou_strings,      type: String
  field :name,            type: String

  def find_by_login(login)
    false
  end
end