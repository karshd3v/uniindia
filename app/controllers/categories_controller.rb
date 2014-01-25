class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  

  def show
  	@category 	=	Category.find(params[:id])
  	@requests 	=	@category.requests.all
  end
end
