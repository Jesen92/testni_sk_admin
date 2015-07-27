class ProfesorsController < ApplicationController
  def index
  	@profesors = Profesor.all
  end

  def show
  	@profesor = Profesor.find(params[:format])
  end
end
