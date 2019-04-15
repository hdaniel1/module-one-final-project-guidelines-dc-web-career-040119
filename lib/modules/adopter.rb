class Adopter < ActiveRecord::Base[4.2]
	has_many :preferences
	has_many :pets, through: :favorite_pets
end 