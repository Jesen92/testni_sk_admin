class HomeController < ApplicationController
	before_filter :authenticate_user!
  def show
  	@obavijesti = Message.last(5)
  end
end
