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
  @all_users = User.where.not(id: @user.id ) - @user.friends

    @accepted_friends = @user.accepted_friends
    @pending_friends = @user.pending_friends 
    @requested_friends = @user.requested_friends  

end

def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.signup_confirmation(@user).deliver_now
      session[:user_id] = @user.id
      flash[:success] = "Thank you for signing up! You are now logged in."
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
  	params.require(:user).permit(:first_name,:last_name,:image,:uname,:email,:password)
  end
  
end