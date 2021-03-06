class SessionsController < ApplicationController
def new
  end
  
  def create

   @user = User.find_by_uname(params[:uname])
  
    if @user && User.find_by_password(params[:password])
        log_in @user

        redirect_to @user
    else
        flash.now[:error] = 'Invalid email/password combination'
        render "new"
    end  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to new_session_path
  end
end
