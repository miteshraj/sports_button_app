class UsersController < ApplicationController
	def create
	  user = User.new(
	    email: params[:email],
	    password: params[:password],
	    favorite_team: params[:favorite_team]
	  )
	  if user.save
	    render json: {message: 'User created successfully'}, status: :created
	  else
	    render json: {errors: user.errors.full_messages}, status: :bad_request
	  end
	end

	def index
		response = User.all
		render json: {response: response}
	end

	def show
		#response = User.find_by(id: params[:id])
		render json: {response: response}
	end
end
