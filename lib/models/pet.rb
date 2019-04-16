class Pet < ActiveRecord::Base
	belongs_to :shelter
	belongs_to :adopter
	has_many :favorite_pets
	has_many :adopters, through: :favorite_pets

end 