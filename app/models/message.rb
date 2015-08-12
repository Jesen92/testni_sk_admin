class Message < ActiveRecord::Base
	has_paper_trail
	
	belongs_to :profesor

	after_create{ |message|
		message.profesor = User.current.profesor
		message.save
	}
end
