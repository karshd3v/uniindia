class ProfileController < ApplicationController
	def index
		@user	=	User.find_by_username(params[:user_name])
		if @user
			render "profile/index"
		else
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end
end
