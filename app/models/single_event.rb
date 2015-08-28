class SingleEvent < ActiveRecord::Base
	has_paper_trail  :on => [:update, :destroy],:ignore => [:updated_at]
	
	belongs_to :profesor
	belongs_to :group
	belongs_to :where
	belongs_to :event

	has_many :ucenik_events
	has_many :uceniks, through: :ucenik_events #prisutnost učenika
end
