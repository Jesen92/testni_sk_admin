class Payment < ActiveRecord::Base
	has_paper_trail :ignore => [:updated_at]
	
	belongs_to :ucenik
	belongs_to :group

	after_commit { |pay|
		
		@ucenik = Ucenik.find(pay.ucenik_id)

		@ucenik.fee_to_pay = @ucenik.fee_to_pay - pay.uplata

		@ucenik.save
	}
end
