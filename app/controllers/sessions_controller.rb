class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      
      sign_in user
      flash[:success] = "Logged in as #{current_user.name}"
      redirect_to user
    else
      flash.now[:error] = "Invalid authentication!"
      render 'new'
    end
  end
  
  def destroy
    sign_out
    flash[:success] = "Logged out"
    redirect_to root_url
  end
end
