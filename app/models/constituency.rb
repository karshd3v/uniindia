class Constituency < ActiveRecord::Base
	has_many :requests
	has_many :users
	has_one :mla
end
