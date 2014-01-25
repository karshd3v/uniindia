class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:victim,:volunteer]
  
  def home
  	@requests 	    =	Request.all
    @categories     = Category.all
  end

  def about
  end

  def contact
  end

  def victim
  	@requests	 =	current_user.requests.all
  end

  def volunteer
    @requests  = []

    current_user.interests.all.each do |interest|
      @requests << interest.request
    end
    @requests
  end

  def constituency
    @constituency = Constituency.find(params[:constituency])
  end
end
