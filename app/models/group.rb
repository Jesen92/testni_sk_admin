class Group < ActiveRecord::Base
	has_paper_trail :ignore => [:updated_at]


	
	has_many :events


	belongs_to :profesor
	belongs_to :dob
	belongs_to :nivo
	belongs_to :jezik
	belongs_to :location

	before_save { |group|

		
		group.name = group.jezik.name

		if group.dob != nil
			group.name += "/"+group.dob.name
		end

		if group.nivo != nil
			group.name +="/"+group.nivo.name
		end

		if group.dodatak != ""
			group.name = group.name+"/"+group.dodatak
		end


	}
end
