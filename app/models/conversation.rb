class Conversation < ActiveRecord::Base
	validates :name, :presence => true
	
	belongs_to :setter, class_name: 'User', foreign_key: 'setter_id'
	belongs_to :getter, class_name: 'User', foreign_key: 'getter_id'

	def with_the_user(current_user_id)
		if self.setter_id == current_user_id
			return self.getter
		else
			return self.setter
		end
	end
	has_many :messages
end