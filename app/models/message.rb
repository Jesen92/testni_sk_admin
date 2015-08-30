class Message < ActiveRecord::Base
	has_paper_trail :ignore => [:updated_at]
	
	belongs_to :profesor

	before_save{ |message|
		message.profesor = User.current.profesor
	}
end
