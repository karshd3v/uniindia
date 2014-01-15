class PagesController < ApplicationController
  def home
  	@requests 	=	Request.all
  end

  def about
  end

  def contact
  end

  def victim
  	@requests	=	current_user.requests.all
  end
end
