class EventsController < ApplicationController


	layout "application"
	respond_to :json
  	helper_method :current_user
  	before_filter :authenticate_user!

	

	def get_events
		@event = current_user.profesor.events


		
		events = []
		@event.each do |event|
			@ponavljaj = ""
			@grupa
			@mjesto
			@adresa
			if event.group == nil
				@grupa = "";
			else
				@grupa = event.group.name
			end

			if event.where == nil
				@mjesto = ""
				@adresa = ""
			else
				@mjesto = event.where.name
				@adresa = event.where.adress
			end

			if event.repeat?
				event.days.each do |day|
					if day.id == 7
						dan_id = 0
					else
					dan_id = day.id.to_s
					end
					@ponavljaj += dan_id.to_s+",";
				end

				
				events << {:id => event.id, :title => event.title, :start => event.start,:end => event.end, :dow => @ponavljaj, :vrijeme => "<p><strong>"+event.start+" - "+event.end+"</strong></p>" ,:grupa => "<p><strong>Predavanje grupe:</strong></p> "+"<p>"+@grupa+"</p>", :mjesto => "<p><strong>Mjesto predavanja:</strong></p> "+"<p>"+@mjesto+"</p>", :adresa => "<p><strong>Adresa:</strong></p> "+"<p>"+@adresa+"</p>", :ranges => [{:start => event.start_date, :end => event.end_date ? event.end_date : event.start_date}] }
			else 
				events << {:id => event.id, :title => event.title, :start =>event.start_date.to_s+" "+event.start.to_s,:end =>event.start_date.to_s+" "+event.end.to_s , :vrijeme => "<p><strong>"+event.start+" - "+event.end+"</strong></p>" , :grupa => "<p><strong>Predavanje grupe:</strong></p> "+"<p>"+@grupa+"</p>", :mjesto => "<p><strong>Mjesto predavanja:</strong></p> "+"<p>"+@mjesto+"</p>", :adresa => "<p><strong>Adresa:</strong></p> "+"<p>"+@adresa+"</p>", :ranges => [{:start => "2000-1-1", :end => "3000-1-1"}] }
			end
		end
	render :text => events.to_json
	end 

  def new
    @page_title = 'Novo predavanje'
    #@book = Book.new
    #@category = Category.new
    #@author = Author.new
    #@publisher = Publisher.new

    @event = Event.new
    @profesor = Profesor.new
    @where = Where.new

  end

  def create
    #@book = Book.new(book_params)
    #@book.save

    #flash[:notice] = 'Book Added'

    #redirect_to books_path

    @event = Event.new(event_params)
    @event.save

    flash[:notice] = "Predavanje dodano"

    redirect_to single_events_path
  end

  private
    def event_params
    params.require(:event).permit(:title, :start, :end, :start_date, :profesor_id, :where_id)
  end

end