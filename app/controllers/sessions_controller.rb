class SessionsController < ApplicationController
  def new
  end

  def create
  	#calling the record from the db
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Account not activated!"
        message += " P l e a s e check your e m a i l to active YoUr AcCoUnT!"
        flash[:warning] = message
        redirect_to root_url
      end
  	else
  		#include error message
  		#if rendering same page like get ra di post. flash.now coz no request 
  		flash.now[:danger] = 'Invalid email/password combination!'
  		#gets the view file soooo /session/new.html.erb
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
