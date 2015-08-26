class ProfesorBook < ActiveRecord::Base
	belongs_to :profesor
	belongs_to :book
end
