class Jezik < ActiveRecord::Base
	has_many :profesors, through: :profesor_jeziks
	has_many :profesor_jeziks
end
