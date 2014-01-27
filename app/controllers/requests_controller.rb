class RequestsController < ApplicationController
	before_filter :authenticate_user!, except: [:show,:archive]
	before_filter :authenticate_mla!, only: [:archive]
	require 'json'

	def index
	end
	def show
    	@request 	= 	Request.find(params[:id])
    	@comment	=	Comment.new
    	@comments 	=	@request.comments.all
	end

	def new
		@request =	Request.new
	end

	def create
		@request = Request.new(request_params)

		respond_to do |format|
	      if @request.save
	      	current_user.requests << @request
	        format.html { redirect_to @request, notice: 'request was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @request }
	      else
	        format.html do 
	        	flash[:alert] ||= []
	        	@request.errors.full_messages.each do |message|
	        		flash[:alert] << message
	        	end
	        	redirect_to :back
	        end
	        format.json { render json: @request.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def vote
		@request 		= 	Request.find(params[:id])
		user 			=	current_user
		vote 			=	Vote.new
		vote.request 	=	@request
		vote.user 		=	user
		unless user == @request.user
			if vote.save
				render text: "You have voted for this request"
			else
				render text: "#{vote.errors[:vote].first}"
			end
		else
			render text: "Sorry you are not auhtorised to votes"
		end
	end

	def interest
		@request 			= 	Request.find(params[:id])
		user 				=	current_user
		interest 			=	Interest.new
		interest.request 	=	@request
		interest.user 		=	user
		unless user == @request.user
			if interest.save
				render text: "You have added this to your interest list. Congrats! Try to solve it asap."
			else
				render text: "#{interest.errors[:interest].first}"
			end
		else
			render text: "Sorry you are not auhtorised to do this"
		end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:title, :description,:tags,:image,:category_id,:constituency_id)
    end
end
