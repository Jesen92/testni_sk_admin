class Payment < ActiveRecord::Base
	has_paper_trail :ignore => [:updated_at]
	
	belongs_to :ucenik
	belongs_to :event



	before_save { |pay|
		
	if pay.uplaceno == true

		if pay.uplata == nil
			pay.uplata = pay.default_uplata
		end

	end

	}

	after_save { |pay|
	if pay.uplata != nil
		@ucenik = Ucenik.find(pay.ucenik_id)

		@ucenik.save
	end
	}

end
