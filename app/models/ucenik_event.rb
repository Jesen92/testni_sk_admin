class UcenikEvent < ActiveRecord::Base
	belongs_to :ucenik 
	belongs_to :single_event
end
