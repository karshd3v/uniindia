class ProfileController < ApplicationController
	before_filter :authenticate_user!, only: [:edit,:analytics]
	before_action :set_user, only: [:edit, :update]
	def index
		@user		=	User.find_by_username(params[:user_name])
		if @user
			@requests 	=	@user.requests.all
			render "profile/index"
		else
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	def edit
	end

	def update
	    respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to setting_url, notice: 'User was successfully updated.' }
	        format.json { head :no_content }
	      else
	      	format.html do 
		        flash[:alert] ||= []
		        	@user.errors.full_messages.each do |message|
		        		flash[:alert] << message
		        	end
	        	redirect_to setting_url
	        end
	        format.json { render json: @post.errors, status: :unprocessable_entity }
	      end
	    end
  end

	def analytics
		
	end
	private
		def set_user
			@user 	=	current_user
		end
	    def user_params
	      params.require(:user).permit(:first_name, :last_name,:phone_number, :address,:profile_pic,:constituency_id)
	    end

end
