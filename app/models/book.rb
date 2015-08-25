class Book < ActiveRecord::Base
	has_paper_trail :ignore => [:updated_at]
	
	has_many :ucenik_books
	has_many :uceniks, through: :ucenik_books
end
