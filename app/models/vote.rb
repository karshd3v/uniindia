class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :request

	before_save :validate_vote?

	def validate_vote?
		user 		=	 self.user
		request		=	 self.request
		if Vote.find_by_user_id(user.id) and Vote.find_by_request_id(request.id)
			self.errors[:vote]	<< "Sorry you can't vote more than once"
			return false
		else
			return true
		end
	end
end