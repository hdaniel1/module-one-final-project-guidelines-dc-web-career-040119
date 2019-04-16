
class Adopter < ActiveRecord::Base 
	has_many :favorite_pets
	has_many :pets, through: :favorite_pets

	#gets the users fullname
	def full_name
		"#{self.first_name} #{self.last_name}"
	end 

	#present menu options
	def present_options
		puts "Hello #{self.full_name}"
		puts "What can we help you with today? Please enter the number corresponding with what you would like to do:"
		puts "1. Review & Update Preferences"
		puts "2. See available pets"
		puts "3. Adopt a Pet"
		puts "4. Logout"
		self.choose_menu_option
	end 

	#menu options paths
	def choose_menu_option 
		response = gets.chomp
		if response == "1"
			self.show_preferences
		elsif response == "4"
			puts "Goodbye"
			$user = nil
		end
	end 	

	#shows user's existing preferences
	def show_preferences
		puts "Your preferences are as follows:"
		puts "1. Species - #{self.preferred_species}"
		puts "2. Temperament - #{self.preferred_temperament}"
		puts "3. Size - #{self.preferred_size}"
		puts "To update your preferences, enter 'change'. Otherwise, enter 'exit' to return to the main menu"
		self.change_preferences
		self.save
	end 

	#goes through methods to update preferences
	def change_preferences
		response = gets.chomp
		if response == "change"
			self.set_preferred_species
			self.set_preferred_temperament
			self.set_preferred_size
			self.present_options
		elsif response =='exit'
			self.present_options
		else 
			puts "Please enter a valid response"
		end
	end

	#wording for updating preferred_species
	def set_preferred_species
		puts "What type of animal are you looking for?"
		puts "We offer the following species:"
		puts "1. Dogs"
		puts "2. Cats"
		puts "3. Rabbits"
		puts "Please enter the number corresponding to the species you're interested in"
		self.parse_species	
	end 

	#wording for updating preferred_temperament
	def set_preferred_temperament 
		puts "Please choose from one of the following temperaments"
		puts "1. Outgoing"
		puts "2. Quiet"
		puts "3. Independent"
		self.parse_temperament
		self.save
	end 

	#wording for updating preferred_size
	def set_preferred_size
		puts "Please choose from one of the following sizes"
		puts "1. Small"
		puts "2. Medium"
		puts "3. Large"
		self.parse_size
		self.save
	end

	#logic for defining user response for preferred species
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
			puts  "You chose #{preferred_species.uniq}. If this is correct, enter 'done'. Otherwise, please re-enter your choices."
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

	#logic for defining user response for preferred temperament
	def parse_temperament 

		temperament = nil

		loop do 

		response = gets.chomp
		#make sure response contains appropriate values
		if response == "1"
			temperament = "Outgoing"
			puts "You chose #{temperament}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "2"
			temperament = "Quiet"
			puts "You chose #{temperament}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "3"
			temperament = "Independent"
			puts "You chose #{temperament}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "done"
			self.preferred_temperament = temperament
			puts "Thank you for your selection"
			break 
		elsif response.downcase == "quit"
			puts "Goodbye"
			break
		else 
			puts "Invalid response - to quit, type 'quit'"
		end 

		end #ends the loop
	end

	#logic for defining user response for preferred size
	def parse_size 

		size = nil

		loop do 

		response = gets.chomp
		#make sure response contains appropriate values
		if response == "1"
			size = "Outgoing"
			puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "2"
			size = "Quiet"
			puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "3"
			size = "Independent"
			puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "done"
			self.preferred_size = size
			puts "Thank you for your selection"
			break 
		elsif response.downcase == "quit"
			puts "Goodbye"
			break
		else 
			puts "Invalid response - to quit, type 'quit'"
		end 

		end #ends the loop
	end

end 