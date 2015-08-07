class UcenikBook < ActiveRecord::Base
	belongs_to :ucenik
	belongs_to :book

 before_save { |uce_book|

 		if(book = UcenikBook.find_by(ucenik_id: uce_book.ucenik_id))
 			uce_book.book_id = book.book_id
 		end

 }
end
