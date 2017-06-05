class UsersController < ApplicationController
def new
	@user=User.new
end

def friend
	@users=User.all
end

def index
	@users=User.all
end

def show
	@user=User.find(params[:id])
end

def create
    @user = User.new(user_params)

    if @user.save

      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to @user
    else
      render 'new'
    end
  end
  def destroy
  	 @user=User.find(params[friend.id])
  	 @user.destroy
  end
  
  private
  def user_params
  	params.require(:user).permit(:first_name,:last_name,:uname,:email,:password)
  end
  def verify_owner
    @user ||= User.find(params[:id])
    redirect_to root_url unless owner?(@user)
  end
end