class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		
	end
	def create
		@user = User.create(users_params)
		flash[:errors] = @user.errors.full_messages

		if @user.valid?
		 flash[:success] = "You have added a new user!"
		end

		# @errors = User.errors.full_messages
		redirect_to '/users/new'
	end

	private
	def users_params
		params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation)	
	end
end
