class Friendship < ApplicationRecord
belongs_to :user
belongs_to :friend,classname:"User"
end
