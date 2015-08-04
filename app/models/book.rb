class Book < ActiveRecord::Base
	has_many :ucenik_books
	has_many :uceniks, through: :ucenik_books
end
