class UsersController < ApplicationController

	def show
		
		@user = User.includes(:blogs).find(params[:id])

		
	end

end
