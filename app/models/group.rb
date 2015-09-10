class Group < ActiveRecord::Base
	has_paper_trail :ignore => [:updated_at]


	
	has_many :events
	has_many :payments

	belongs_to :profesor
	belongs_to :dob
	belongs_to :nivo
	belongs_to :jezik

	after_commit { |group|

		
		group.name = group.jezik.name+"/"+group.nivo.name+"/"+group.dob.name

		if group.dodatak != ""
			group.name = group.name+"/"+group.dodatak
		end

		group.save

	}
end
