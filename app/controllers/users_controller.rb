class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def show
		
		# redirect_to '/users'
	end
end
