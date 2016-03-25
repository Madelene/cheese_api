class CheesesController < ApplicationController
	protect_from_forgery

	expose(:id)			{ params[:id] }
	# expose(:name)		{ params[:name] }

	def list_cheeses
		cheese = Cheese.all

		if cheese
			render json: { cheeses: cheese }, status: 200
		else
			render json: { message: "Sorry. No cheeses exist yet" }, status: 200
		end

	end

	def get_by_user
		# cheese = []
		# cheeses_in_array = Cheese.find_by(id: id)
		cheese_list = User.find(id).cheeses.pluck(:name) 
		

		if cheese_list.empty?
			# (cheeses_in_array)
			render json: { message: "This user apparently does not like cheese" }, status: 200
		else
			render json: { cheese: cheese_list }, status: 200	
		end
	end

	private

	def cheese_params
		params.require(:cheese).permit(:name)
	end
end
