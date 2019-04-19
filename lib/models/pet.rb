class Pet < ActiveRecord::Base
	belongs_to :shelter
	belongs_to :adopter, foreign_key: :owner_id
	has_many :favorite_pets
	has_many :adopters, through: :favorite_pets


	def show_pet_info 
		print "Pet ID: "
		puts self.reload.id
	    print "Name: "
		puts self.name.nil? ? "N/A" : self.name
		print "Breed: "
		puts self.reload.breed.nil? ? "N/A" : self.reload.breed
		print "Age: "
		puts self.reload.age.nil? ? "N/A" : self.reload.age
		print "Misc: "
		puts self.reload.miscellaneous .nil? ? "N/A" : self.reload.miscellaneous
		print "Available? "
		puts self.reload.available .nil? ? "N/A" : self.reload.available
		print "Shelter: "
		puts self.shelter.reload.name.nil? ? "N/A" : self.shelter.reload.name
		67.times do print "*" end 
		puts
	end 

end 