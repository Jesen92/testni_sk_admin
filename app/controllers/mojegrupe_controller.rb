class MojegrupeController < ApplicationController
before_action :authenticate_user!
  helper_method :current_user

  def index
    if current_user
     @page_title = "Tečajevi"
     @profesor = current_user.profesor
   	 @groups = @profesor.events
     @user = current_user
   else
     redirect_to new_user_session_path, notice: 'You are not logged in.'
   end
  end

  def show
  	@group = Event.find(params[:id])
    @page_title = @group.title
    @indicator
  end


end
