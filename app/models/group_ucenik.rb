class GroupUcenik < ActiveRecord::Base
		has_paper_trail
	
	belongs_to :ucenik
	belongs_to :group
end
