class ProfesorsController < ApplicationController
  def index
  	@page_title = "Profesori"
  	@profesors = Profesor.all
  end

  def show
  	@profesor = Profesor.find(params[:format])
  	@page_title = @profesor.name
  end
end
