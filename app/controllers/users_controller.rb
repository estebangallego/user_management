class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		# new view
	end

	def show
		@user = User.find(params[:id])
	end
	def delete
		User.destroy(params[:id])
		redirect_to '/users'
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

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(users_params)
		

		if @user.valid?
			flash[:success] = "You have edited an user"
			redirect_to '/users'
		else
			flash[:errors] = @user.errors.full_messages
			render :edit
		end
		

		# puts "Hi" + params[:user]
  		 # if @user.update_attributes(users_params)
	    #   redirect_to 'users'
	    # else
	    #   redirect_to 'users'
	    # end
	end

	private
	def users_params
		params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation)	
	end
end
