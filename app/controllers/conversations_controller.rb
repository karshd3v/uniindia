class ConversationsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@my_conversations 		=	current_user.set_conversations
		@other_conversations 	=	current_user.get_conversations
	end

	def show
		@conversation 	=	Conversation.find(params[:id])
	end

	def create
		title 			= 	params["title"]
		message			=	params["message"]
		username 		=	params["username"]
		user 			=	User.find_by_username(username)

		unless title.empty? || message.empty? || username.empty?
			conversation 	=	Conversation.new
			conversation.name = title
			conversation.setter = current_user
			conversation.getter = user
			new_message 	=	Message.new
			new_message.message_text 	=	message
			new_message.user = current_user
			new_message.user_type = true
			conversation.messages << new_message
			if conversation.save
				redirect_to :back, notice: "Your conversation has begun check your inbox"
			else
				redirect_to :back, alert: "There is some problem"
			end

		else
			redirect_to :back, alert: "Sorry please complete the form properly"
		end
	end

	def message
		conversation 			=	Conversation.find(params[:id])
		message 				=	params["message"]

		unless message.empty?
			new_message 				=	Message.new
			new_message.user 			=	current_user
			new_message.conversation 	=	conversation
			new_message.message_text	=	message
			new_message.user_type	= true if current_user == conversation.setter
			if new_message.save
				redirect_to conversation, notice: "Your message has been sent"
			else
				redirect_to :back, alert: "There is some problem"
			end
		else
			redirect_to :back, alert: "Sorry please complete the form properly"
		end
	end
end