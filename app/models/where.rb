class Where < ActiveRecord::Base
	has_paper_trail :ignore => [:updated_at]
	
	has_many :events
	has_many :single_events
end
