require 'mongo_mapper'
class User 
  include MongoMapper::Document
  
  key :name
  key :email
  key :password

  before_save {self.email = email.downcase}
  validate :name, presence: true 
  validate :email, presence: true, uniqueness: {case_sensitive: false}  
  validate :password, length: {minimum: 6}
  #has_secure_password
end
