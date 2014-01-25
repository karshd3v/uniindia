class ImagesController < ApplicationController
  def new
  	@image = Image.new
  end

  def create
  	@image = Image.new(params.require(:image).permit(:pic))
  	if @image.save
  		redirect_to root_path, notice: "Image created"
  	else
  		redirect_to root_path, alert: @image.errors.full_messages
  	end
  end
end
