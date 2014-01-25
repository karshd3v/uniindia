class ArchiveController < ApplicationController
  before_filter :authenticate_mla!
  def index
  	constituency 	=	current_mla.constituency
  	@requests 		=	constituency.requests.archive
  end

  def show
  	@request 		=	Request.archive.find(params[:id])
    @comments 		=	@request.comments.all
  end

  def delete
  	@request 		  	=	Request.find(params[:id])
		if current_mla.constituency == @request.constituency
			@request.is_archive 	=	true
			if @request.save
				render json: ["message" => "This request has been unarchived!", "redirect" => "/requests/archive"]
			else
				render text: @request.errors.full_messages.first
			end
		else
			render text: "Sorry you does not belong to this constituency!"
		end
  end

  def unarchive
  	@request 		  	=	Request.archive.find(params[:id])
		if current_mla.constituency == @request.constituency
			@request.is_archive 	=	false
			if @request.save
				render json: ["message" => "This request has been unarchived!", "redirect" => "/requests/#{@request.id}"]
			else
				render text: @request.errors.full_messages.first
			end
		else
			render text: "Sorry you does not belong to this constituency!"
		end
  end

end