class Cheese < ActiveRecord::Base
	belongs_to :user

	cheese = Cheese.new
	
end
