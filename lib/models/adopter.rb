class Adopter < ActiveRecord::Base
	has_many :favorite_pets
	has_many :pets, through: :favorite_pets
end 