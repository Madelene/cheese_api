class CheesesController < ApplicationController
	protect_from_forgery

	expose(:name)		{ params[:name] }

	
end
