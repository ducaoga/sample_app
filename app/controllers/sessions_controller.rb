class SessionsController < ApplicationController
  def new
  end

  def create
  	#calling the record from the db
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#redirect to the paage 
  		log_in user
  		redirect_to user
  	else
  		#include error message
  		#if rendering same page like get ra di post. flash.now coz no request 
  		flash.now[:danger] = 'Invalid email/password combination!'
  		#gets the view file soooo /session/new.html.erb
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end
end
