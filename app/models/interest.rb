class Interest < ActiveRecord::Base
	belongs_to :user
	belongs_to :request
	
	before_save :validate_interest?

	def validate_interest?
		user 		=	 self.user
		request		=	 self.request
		if Interest.find_by_user_id(user.id) and Interest.find_by_request_id(request.id)
			self.errors[:interest]	<< "You have already added it your interests"
			return false
		else
			return true
		end
	end
end