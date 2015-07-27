class Event < ActiveRecord::Base
	require 'date'

	belongs_to :profesor
	belongs_to :group
	has_many :days, through: :picked_days
	has_many :picked_days
	has_many :single_events
	belongs_to :where

	validates :start,:end,:start_date, presence: true


    after_create { |event|  #svako predavanje se pojedinačno zapisuje u bazu
    	@dani = Array.new(7)
    	@i = 0
    	@dani_count = 0
    	@br = 0
    	@zbr = 0

    if event.repeat?

    	@first_day = event.days.first.id
    	@d_c = @first_day

    		event.days.each do |day|
    			temp = day.id-@d_c
    			if temp < 0
    				temp = (day.id+7)-@d_c
    			end
    			date = event.start_date
    			@dani[@dani_count] = date+(temp)
    			@dani_count+=1
    		end

    	@br = event.br_pred/@dani_count-1
    	@i = @br

    	@dani_count-=1 	
    end


    while @i >= 0 && @dani_count >= 0
      s_event = SingleEvent.new
      s_event.event_id = event.id
      s_event.title = event.title
      s_event.start = event.start
      s_event.end = event.end

      if event.repeat?
      	s_event.date = @dani[@dani_count]+@zbr
  	  else
  	  	s_event.date = event.start_date
  	  end

      if event.profesor_id?
      	s_event.profesor_id = event.profesor_id
  	  end

  	  if event.where_id?
  	  	s_event.where_id = event.where_id
  	  end

  	  if event.group_id?
  	  	s_event.group_id = event.group_id
  	  end

      s_event.save
      @zbr+=7
      @i-=1

      if @i < 0 && @dani_count > 0
      	@dani_count-=1
      	@i = @br
      	@zbr = 0
      end
  end

    }

end
