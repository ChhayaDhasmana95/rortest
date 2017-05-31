class User < ApplicationRecord
	has_many :friendships
	has_many :friends,through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

	validates :email,:uname, uniqueness:true

	#validates :password,inclusion: { in: %w( & * $ %) }
    #attr_accessor :reset_token
    #before_create :create_reset_digest


=begin
def create_reset_digest
  self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
end

def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
end

def downcase_email
      self.email = email.downcase
end
=end
end
