class Ucenik < ActiveRecord::Base


	has_many :groups, through: :group_uceniks
	has_many :group_uceniks

	has_many :ucenik_events
	has_many :single_events, through: :ucenik_events

	has_many :ucenik_books
	has_many :books, through: :ucenik_books

	has_many :payments

	accepts_nested_attributes_for :ucenik_books
	accepts_nested_attributes_for :payments


		after_commit{ |ucenik| 


			@fee = 0

			ucenik.groups.each do |group|
				@fee += group.cijena
			end

			ucenik.fee = @fee
			ucenik.fee_to_pay = @fee

			if ucenik.placanje_na_rate?
				ucenik.groups.each do |group|
					@i = 0
					@indicator = 0

					payments = Payment.all

					payments.each do |pay| #provjera da li uplate vec postoje u bazi
						if pay.ucenik_id == ucenik.id && pay.group_id == group.id
							@indicator = 1
							break
						end 
					end


					while @i < ucenik.br_rata && @indicator == 0
						payment = Payment.new

						payment.ucenik_id = ucenik.id
						payment.group_id = group.id
						payment.date = ucenik.prvi_mj_placanja + @i.month
						payment.title = ucenik.name+" "+group.name+" "+payment.date.strftime(" %m.%Y.").to_s

						payment.save
						@i+=1
					end
				end
			end

			ucenik.save


	}
end
