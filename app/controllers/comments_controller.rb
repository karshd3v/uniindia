class CommentsController < ApplicationController
  
  def create
		@comment 	= 	Comment.new(comment_params)
		@request 	=	Request.find(params[:request_id])
		if user_signed_in?
			if current_user == @request.user
				@comment.user_type = "victim"
			else
				@comment.user_type = "volunteer"
			end
			@comment.commentee	=	current_user
		end
		if mla_signed_in?
			@comment.user_type = "mla"
			@comment.commentee	=	current_mla
		end
	    
	    @comment.request 	=	@request
		respond_to do |format|
	      if @comment.save	      	
	        format.html { redirect_to @request, notice: 'comment was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @request }
	      else
	      	format.html do 
		        flash[:alert] ||= []
		        	@comment.errors.full_messages.each do |message|
		        		flash[:alert] << message
		        	end
	        	redirect_to :back
	        end
	        format.json { render json: @request.errors, status: :unprocessable_entity }
	      end
    	end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment_text)
    end
end
