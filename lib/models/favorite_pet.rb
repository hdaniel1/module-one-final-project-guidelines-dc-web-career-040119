class FavoritePet < ActiveRecord::Base
	belongs_to :pet 
	belongs_to :adopter

	def self.find_chosen_unavailable_pet(response)
		FavoritePet.all.find do |pet|
			pet.pet_id == response.to_i && pet.pet.available == false 
		end
	end 

	def self.find_chosen_available_pet(response)
		FavoritePet.all.find do |pet|
			pet.pet_id == response.to_i && pet.pet.available == true 
		end
	end
end 