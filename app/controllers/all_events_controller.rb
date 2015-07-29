class AllEventsController < ApplicationController
		before_filter :authenticate_user!
  def show
  	@page_title = "Sva Predavanja"
  end
end
