class Ucenik < ActiveRecord::Base


	has_many :groups, through: :group_uceniks
	has_many :group_uceniks

	has_many :ucenik_events
	has_many :single_events, through: :ucenik_events

	has_many :ucenik_books
	has_many :books, through: :ucenik_books

	accepts_nested_attributes_for :ucenik_books
end
