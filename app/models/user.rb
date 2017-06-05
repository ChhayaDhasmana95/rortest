class User < ApplicationRecord
	
  has_many :friend_requests, dependent: :destroy
  has_many :pending_requests, through: :friend_requests,source: :friend
  

	has_many :friendships,-> {where(accepted:false) }
	has_many :friends,through: :friendships,source: :user
  has_many :inverse_friendships,-> {where(accepted:false) }, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

	validates :email,:uname, uniqueness:true, :on=> :create
 
	#validates :password,inclusion: { in: %w( & * $ %) }
    
end


