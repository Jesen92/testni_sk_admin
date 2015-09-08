class GroupUcenik < ActiveRecord::Base

	belongs_to :ucenik
	belongs_to :event
end
