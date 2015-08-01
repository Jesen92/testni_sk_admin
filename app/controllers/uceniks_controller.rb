class UceniksController < ApplicationController
	  	before_filter :authenticate_user!
  def index
  end

  def show
  	@ucenik = Ucenik.find(params[:format])
  	@page_title = @ucenik.name
  end
end
