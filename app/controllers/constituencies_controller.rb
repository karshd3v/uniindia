class ConstituenciesController < ApplicationController
	
  def show
  	@constituency 	=	Constituency.find(params[:id])
  	@mla 			=	@constituency.mla
  	@requests 		=	@constituency.requests.all
  end
end
