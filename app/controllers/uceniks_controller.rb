class UceniksController < ApplicationController
  def index
  end

  def show
  	@ucenik = Ucenik.find(params[:format])
  end
end
