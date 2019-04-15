class Pet < ActiveRecord::Base[4.2]
	belongs_to :shelter
	has_many :adopters, through: :favorite_pets

end 