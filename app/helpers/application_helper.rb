module ApplicationHelper
def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end

  def load_friend_requests
    @friend_requests ||= current_user.friend_requests.all
  end
end
