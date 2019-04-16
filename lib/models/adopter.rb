
class Adopter < ActiveRecord::Base 
	has_many :favorite_pets
	has_many :pets, through: :favorite_pets

	def parse_species 
		preferred_species = []
		valid_responses = ["1", "2", "3"]
		loop do 
		
		response = gets.chomp
		#make sure response contains appropriate values
		if (response.split.uniq - valid_responses).empty?
			#pushes corresponding species into array
			response.split.uniq.each {|i|
				if i == "1"
					preferred_species << "Dogs"
				elsif i == "2"
					preferred_species << "Cats"
				elsif i == "3"
					preferred_species << "Rabbits"
				end 	
			}
			puts  "You entered #{preferred_species.uniq}. If this is correct, enter 'done'. Otherwise, please re-enter your choices."
		#finalizes selection
		elsif response.downcase == "done"
			self.preferred_species = "#{preferred_species}"
			puts "Thank you for your selection"
			break #return to homepage here
		#quits selection
		elsif response.downcase == "quit"
			preferred_species = []
			puts "Goodbye"
			break #return to homepage here
		#invalid response
		else
			puts "Invalid response - to quit, type 'quit'"
		end 

		end #ends the loop
	end 

	def set_preferred_species
		puts "What type of animal are you looking for?"
		puts "We offer the following species:"
		puts "1. Dogs"
		puts "2. Cats"
		puts "3. Rabbits"
		puts "Please enter the number corresponding to the species you're interested in"
		self.parse_species	
	end 
end 