class Where < ActiveRecord::Base
	has_paper_trail
	
	has_many :events
	has_many :single_events
end
