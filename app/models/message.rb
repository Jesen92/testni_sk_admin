class Message < ActiveRecord::Base
	belongs_to :profesor

	after_create{ |message|
		message.profesor = User.current.profesor
		message.save
	}
end
