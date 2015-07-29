class UceniksController < ApplicationController
  def index
  end

  def show
  	@ucenik = Ucenik.find(params[:format])
  	@page_title = @ucenik.name
  end
end
