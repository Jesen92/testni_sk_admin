class PodaciController < ApplicationController
  def show
  	@user = User.all 
  end
end
