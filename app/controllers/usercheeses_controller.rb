class UsercheesesController < ApplicationController
	expose(:user_id)							{ params[:user_id] }
	expose(:cheese_id)						{ params[:cheese_id] }


	def add_cheese_to_user
		if user_id.present? && cheese_id.present?
			give_user_cheese = Usercheese.create(usercheese_params)
		end

		if give_user_cheese 
			render json: { message: "You now have some cheese" }, status: 200
		else
			render json: { message: "Still hungry for cheese!" }, status: 200
		end
	end

	private

	def usercheese_params
		params.require(:usercheese).permit(:user_id, :cheese_id)
	end
end
