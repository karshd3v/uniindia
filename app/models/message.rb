class Message < ActiveRecord::Base
	validates :message_text, :presence => true

	belongs_to :user

	belongs_to :conversation
end