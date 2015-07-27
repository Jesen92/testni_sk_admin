class Group < ActiveRecord::Base
	has_many :uceniks, through: :group_uceniks
	has_many :group_uceniks
	has_many :events
	belongs_to :profesor
end
