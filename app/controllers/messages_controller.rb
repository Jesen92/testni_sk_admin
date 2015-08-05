class MessagesController < ApplicationController
  def index
  	@page_title = "Obavijesti"
  	@obavijesti = Message.all
  	@obavijesti_grid = initialize_grid(@obavijesti,include: :profesor, order: 'created_at',order_direction: 'asc') #conditions: ["single_events.odrzano = '0'"] // ako zelim ispisati samo sa ne

  end

  def show
  	@obavijest = Message.find(params[:format])
  	@page_title = @obavijest.title
  end
end
