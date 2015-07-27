class Day < ActiveRecord::Base
	has_many :events, through: :picked_days
	has_many :picked_days
end
