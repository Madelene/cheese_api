class User < ActiveRecord::Base
	has_many :usercheeses
	has_many :cheeses, :through => :usercheeses
	
	validates :username, presence: true
	validates :password, presence: true, 
						 uniqueness: true,
						 confirmation: true,
             			 length: {within: 1..8}

	user = User.new

	User.includes(:cheeses)

end
