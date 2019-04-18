class Pet < ActiveRecord::Base
	belongs_to :shelter
	belongs_to :adopter
	has_many :favorite_pets
	has_many :adopters, through: :favorite_pets


	def show_pet_info 
		print "Pet ID: "
		puts self.id
	    print "Name: "
		puts self.name.nil? ? "N/A" : self.name
		print "Breed: "
		puts self.breed.nil? ? "N/A" : self.breed
		print "Age: "
		puts self.age.nil? ? "N/A" : self.age
		print "Misc: "
		puts self.miscellaneous .nil? ? "N/A" : self.miscellaneous
		print "Available? "
		puts self.available .nil? ? "N/A" : self.available
		print "Shelter: "
		puts self.shelter.name.nil? ? "N/A" : self.shelter.name
		67.times do print "*" end 
		puts
	end 

end 