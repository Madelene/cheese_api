class Usercheese < ActiveRecord::Base
	belongs_to :user 
	belongs_to :cheese 
end
