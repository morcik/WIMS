require 'spec_helper'

describe "Authentication" do

  subject { page }
  
  describe "signin Page" do
    before { visit signin_path }
      
    it { should have_selector('h1', text: 'Sign in') }
  end
  
  describe "signin" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before {click_button "sign in" }
      it { should have_selector('div.alert.alert-error', text: 'Invalid' )}
    end

    describe "with valid information" do 
      let(:user) {FactoryGirl.create(:user)}
      before do 
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password 
        click_button "sign in" 
      end

      it { should have_link('Profile',    href: user_path(user))}
      it { should have_link('Sign out',    href: signout_path)}
      it { should_not have_link('Profile',    href: signin_path)}
    end
  end
end
