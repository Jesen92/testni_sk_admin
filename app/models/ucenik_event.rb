class UcenikEvent < ActiveRecord::Base
		has_paper_trail
	#klasa/model za prisutnost učenika
	belongs_to :ucenik 
	belongs_to :single_event
end
