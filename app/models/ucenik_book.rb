class UcenikBook < ActiveRecord::Base
	belongs_to :ucenik
	belongs_to :book
end
