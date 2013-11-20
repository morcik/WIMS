class User 
  include Mongoid::Document
  
  field :name
  field :email
  field :password
  field :password_confirmation

  before_save {self.email = email.downcase}
  validate :name, presence: true 
  validate :email, presence: true, uniqueness: {case_sensitive: false}  
  validate :password, length: {minimum: 6}
  #has_secure_password
end
