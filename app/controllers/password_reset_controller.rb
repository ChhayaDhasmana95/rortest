class PasswordResetController < ApplicationController
  def new
    #user=User.find_by(:email)
  end
  
  def create
    
  	@user = User.find_by(email: params[:email].downcase)
  	if @user
     @user.create_reset_digest
     @user.send_password_reset_email
     redirect_to root_url
    else
	 render 'new'
    end
  end 
  def edit
  end
end
