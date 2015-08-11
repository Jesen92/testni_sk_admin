class PodaciController < ApplicationController
    helper_method :current_user

  def show
  	@page_title = "Moji podaci"
  	@user = current_user.profesor
  end
end
