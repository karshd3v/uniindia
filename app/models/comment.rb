class Comment < ActiveRecord::Base
	belongs_to :request
	belongs_to :commentee, polymorphic: true

	validates :comment_text, :presence => true
	# validates :user_type, :presence => true

end