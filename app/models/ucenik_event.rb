class UcenikEvent < ActiveRecord::Base
	#klasa/model za prisutnost učenika
	belongs_to :ucenik 
	belongs_to :single_event
end
