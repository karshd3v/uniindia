class RequestsController < ApplicationController
	require 'json'

	def index
	end
	def show
    	@request = 	Request.find(params[:id])
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
	        format.html { render action: 'new' }
	        format.json { render json: @request.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def vote
		request = Request.find(params[:id])
		request.votes = request.votes + 1;
		request.save
		render json: request.votes
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:title, :description,:tags)
    end
end
