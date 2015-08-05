class HomeController < ApplicationController
	before_filter :authenticate_user!
  def show
  	@obavijesti = Message.first(5)
  end
end
