class User < ActiveRecord::Base
	validates :username, presence: true
	validates :password, presence: true, 
						 uniqueness: true,
						 confirmation: true,
             			 length: {within: 1..8}

	user = User.new
	
end
