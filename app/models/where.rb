class Where < ActiveRecord::Base
	has_many :events
	has_many :single_events
end
