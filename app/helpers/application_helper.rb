module ApplicationHelper
	def get_categories_options
		categories = Category.all
		categories_options = []
		categories.each do |category|
			categories_options << [category.name,category.id]
		end

		categories_options
	end
	def get_constituencies_options
		constituencies = Constituency.all
		constituencies_options = []
		constituencies.each do |constituency|
			constituencies_options << [constituency.name,constituency.id]
		end

		constituencies_options
	end
end
