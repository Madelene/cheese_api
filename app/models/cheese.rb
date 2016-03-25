class Cheese < ActiveRecord::Base
	has_many :usercheeses
	has_many :users, :through => :usercheeses


	Cheese.all.each do | cheese |
		puts "This is my favorite cheese: " + cheese.name
	end
	
end
