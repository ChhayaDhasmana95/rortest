class User < ApplicationRecord
	has_many :friendships
	has_many :friends,through: :friendships
	validates :email,:uname, uniqueness:true
	#validates :password,inclusion: { in: %w( & * $ %) }
    end

