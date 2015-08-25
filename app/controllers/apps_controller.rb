class AppsController < ApplicationController
	  include HTTParty

	  format :json


  def create

  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def index
  	
  end

  def destroy
  end

  private
    def ucenik_params
    params.require(:novi_ucenik).permit(:name)
  end
end
