class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :is_admin

  def is_admin
    if result = Editor.find_by(id: session[:user_id])
      return result.is_admin
    end
    return false
  end

  protected
  def authorize
  	unless Editor.find_by(id: session[:user_id])
  		#redirect_to login_url, notice: "Please log in" end
      flash[:danger] = "Please log in"
      redirect_to login_url
  	end
  end

end
