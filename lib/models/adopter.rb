
class Adopter < ActiveRecord::Base 
	has_many :favorite_pets
	has_many :pets, through: :favorite_pets

	def parse_species 
		puts "Please enter the number corresponding to the species you're interested in. Enter done to finalize selection"
		preferred_species = []
		loop do 
		response = gets.chomp

		valid_responses = ["1", "2", "3"]

		if (response.split.uniq - valid_responses).empty?
			response.split.uniq.each do |i|
				if i == "1"
					preferred_species << "Dogs"
				elsif i == "2"
					preferred_species << "Cats"
				elsif i == "3"
					preferred_species << "Rabbits"
				end 	
			end 
			puts  "You entered #{preferred_species.uniq}. If this is correct, enter 'done'. Otherwise, please re-enter your choices."
		elsif response.downcase == "done"
			puts "Thank you for your selection"
		break #return to homepage
		elsif response.downcase == "quit"
			preferred_species = []
			puts "Goodbye"
			break #return to homepage here
		else
			puts "Invalid response - to quit, type 'quit'"
		end 
		end 
	end 

	def set_preferred_species
		puts "What type of animal are you looking for?"
		puts "We offer the following species:"
		puts "1. Dogs"
		puts "2. Cats"
		puts "3. Rabbits"
		self.parse_species	
	end 
end 