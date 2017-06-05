class PasswordResetController < ApplicationController
  def index
    
  end
  def new
    #user=User.find_by(:email)
  end

  
  def create
    
  	@user = User.find_by(email: params[:email])
    
  	if @user
       @xyz= @user.update(password: params[:new_password])
       
       redirect_to new_session_path  
      
   else
    redirect_to password_reset_new_path
     
    
    end
  end 

  
end
