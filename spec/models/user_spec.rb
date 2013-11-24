require 'spec_helper'

describe User do
  before {@user = User.new(name: "Hello Kitty", email:"hello@kitty.com", password:"password", password_confirmation:"password")}
  
  subject {@user}

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:remember_token)}
  it {should respond_to(:authenticate)}
  it {should be_valid}

  describe "remember token" do
    before {@user.save}
    its(:remember_token) {should_not be_blank}
  end


  describe "when name is blank" do
  	before { @user.name =" "}
  	it { should_not be_valid }
  end

  describe "when email is blank" do
    before { @user.email =" "}
    it { should_not be_valid }
  end  
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
  
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation="mismatch"}
    it { should_not be_valid }
  end  

  describe "when password is blank" do
    before do
     @user.password =" "
     @user.password_confirmation=" "
    end
    it { should_not be_valid }
  end
  
  
end
