class Profesor < ActiveRecord::Base
	has_paper_trail :ignore => [:updated_at]
	
	has_one :user
	belongs_to :bank

	has_many :groups
	has_many :events
	has_many :single_events
	has_many :messages

	has_many :jeziks, through: :profesor_jeziks
	has_many :profesor_jeziks
	#validates_attachment_content_type :document, :content_type => ['application/pdf', 'application/msword', 'text/plain']
end
