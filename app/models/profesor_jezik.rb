class ProfesorJezik < ActiveRecord::Base
	belongs_to :profesor
	belongs_to :jezik
end
