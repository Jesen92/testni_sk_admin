class SingleEvent < ActiveRecord::Base
	belongs_to :profesor
	belongs_to :group
	belongs_to :where
	belongs_to :event

	has_many :ucenik_events
	has_many :uceniks, through: :ucenik_events
end
