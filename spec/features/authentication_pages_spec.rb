require 'spec_helper'

describe "Authentication" do

  subject { page }
  
  describe "signin Page" do
    before { visit signin_path }
      
    it { should have_selector('h1', text: 'Sign in') }
  end
  
  describe "signin" do
    before { visit signin_path }
    
    describe "sign in with invalid information" do
      before {click_button "sign in" }
      it { should have_selector('div.alert.alert-error', text: 'Invalid' )}    
      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "navbar with valid information" do 
      let(:user) {FactoryGirl.create(:user)}
      before do 
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password 
        click_button "sign in" 
      end

      it { should have_link('Profile',    href: user_path(user))}
      it { should have_link('Logout',    href: signout_path)}
      it { should_not have_link('Profile',    href: signin_path)}
    
      describe "followed by signout" do
        before { click_link "Logout" }
        it { should have_link('Login') }
      end
    end


  end
end
