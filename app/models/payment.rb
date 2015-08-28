class Payment < ActiveRecord::Base
	has_paper_trail :ignore => [:updated_at]
	
	belongs_to :ucenik
	belongs_to :group

	after_commit { |pay|
		
		if pay.uplata == nil
			pay.uplata == pay.default_uplata
		end

		@ucenik = Ucenik.find(pay.ucenik_id)

		@ucenik.preostalo_za_platiti = @ucenik.preostalo_za_platiti - pay.uplata

		@ucenik.save
	}
end
