class FriendshipsController < ApplicationController
def index
	@frienship=Friendship.all
end
def create
    @friendship = @user.friendships.build(:friend_id => params[friend.id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to friendship_path
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end
  def friend
  	@users=User.all
  	
  end
  
  def destroy
    @friendship = user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to user
  end
end
