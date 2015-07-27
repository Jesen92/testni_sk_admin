class GroupUcenik < ActiveRecord::Base
	belongs_to :ucenik
	belongs_to :group
end
