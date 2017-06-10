class User < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :friendships
   has_many :friends, :through => :friendships

	validates :email,:uname, uniqueness:true, :on=> :create
 
	#validates :password,inclusion: { in: %w( & * $ %) }
     has_many :requested_friendships, -> { where(status: "pending")}, :class_name => "Friendship",:foreign_key => "friend_id"
   has_many :requested_friends, :through => :requested_friendships, :source => :user


   has_many :pending_friendships, -> { where(status: "requested")}, :class_name => "Friendship",:foreign_key => "friend_id"
   has_many :pending_friends, :through => :pending_friendships, :source => :user


   has_many :accepted_friendships, -> { where(status: "accepted")}, :class_name => "Friendship",:foreign_key => "friend_id"
   has_many :accepted_friends, :through => :accepted_friendships, :source => :user

   has_many :conversations
   has_many :exchanges, :through => :conversations

end


