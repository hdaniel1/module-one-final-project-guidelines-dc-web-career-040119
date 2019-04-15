class Pet < ActiveRecord::Base
	belongs_to :shelter
	has_many :favorite_pets
	has_many :adopters, through: :favorite_pets

end 