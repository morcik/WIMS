class User 
  include Mongoid::Document
  include ActiveModel::SecurePassword 
  field :name
  field :email
  field :password_digest
  field :remember_token
  
  before_create :create_remember_token
  before_save {self.email = email.downcase}
  validates :name, presence: true 
  validates :email, presence: true, uniqueness: {case_sensitive: false}  
  validates :password, length: {minimum: 6}, confirmation: true
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end  
end
