require 'spec_helper'

describe User do
  before {@user = User.new(name: "Hello Kitty", email:"hello@kitty.com")}
  
  subject {@user}

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should be_valid}

  describe "when name is blank" do
  	before { @user.name =" "}
  	it { should_not be_valid }
  end

  describe "when email is blank" do
  	before { @user.email =" "}
  	it { should_not be_valid }
  end

  describe "when email is not unique" do 
  	before do
  	 dupped_user = @user.dup
     dupped_user.email = @user.email.upcase
     dupped_user.save
   end

   it {should_not be_valid}
  end
end
