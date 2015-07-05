class SessionsController < ApplicationController
  def new
  end

  def create
  	user = Editor.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
      session[:user_name] = user.name
  		#redirect_to admin_url
  		redirect_to articles_path
  	else
      flash.now[:danger] = 'Invalid user/password combination'
      render 'new'
  		#redirect_to login_url, alert: "Invalid user/password combination" 
  	end
  end

  def destroy
  	session[:user_id] = nil
    session[:user_name] = nil
  	#redirect_to store_url, notice: "Logged out"
  end
end
