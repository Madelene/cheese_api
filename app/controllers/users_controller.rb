class UsersController < ApplicationController
	protect_from_forgery

	expose(:id)								{ params[:id] }
	expose(:username)					{ params[:username] }
	expose(:password)					{ params[:password] }
	expose(:current_user)			{ User.find_by username: username }

	def get
		user = User.find_by(id: id)

		if user
			render json: { users: user }, status: 200
		else
			render json: { message: "There is no user to be found" }, status: 200
		end
	end

	def login
		user = User.find_by(username: username)

		if user 
			if user.password == password
				render json: { users: current_user }, status: 200
				else
				render json: { message: "Your password is incorrect. Please try again" }, status: 200
			end
		else
			render json: { message: "User does not exist" }, status: 200
		end
	end

	def create
		new_user = User.create(user_params)

			if new_user.password == nil
			  render json: { message: "You need to create a valid password" }, status: 200
		  else
			  render json: { message: "You're good to go!" }, status: 200
		  end
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end
end
