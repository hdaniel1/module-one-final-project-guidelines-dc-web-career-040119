
class Adopter < ActiveRecord::Base
	has_many :favorite_pets
	has_many :pets
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
		puts "3. View my favorite pets"
		puts "4. Logout"
		self.choose_menu_option
	end

	#menu options paths
	def choose_menu_option
		response = gets.chomp
		if response == "1"
			self.show_preferences
    elsif response == "2"
      self.show_available_pets
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
		puts "4. Zip - #{self.zip}"
		puts "To update your preferences, enter 'change'. Otherwise, enter 'exit' to return to the main menu"
		self.change_preferences
		self.save
	end

	#goes through methods to update preferences
	def change_preferences
		loop do
		response = gets.chomp
		if response == "change"
			self.set_preferred_species
			self.set_preferred_temperament
			self.set_preferred_size
			self.set_preferred_zip
			self.present_options
			break
		elsif response =='exit'
			self.present_options
			break
		else
			puts "Please enter a valid response"
		end
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
    	species = nil

		loop do

		response = gets.chomp
		#make sure response contains appropriate values
		if response == "1"
			species = "dog"
			puts "You chose #{species}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "2"
			species = "cat"
			puts "You chose #{species}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "3"
			species = "rabbit"
			puts "You chose #{species}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "done"
			if species.nil? == false
				self.preferred_species = species
				puts "Thank you for your selection"
			else
				puts "Thank you for your selection"
			end
			break
		elsif response.downcase == "quit"
			puts "Goodbye"
			break
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
			if temperament.nil? == false
				self.preferred_temperament = temperament
				puts "Thank you for your selection"
			else
				puts "Thank you for your selection"
			end
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
			size = "Small"
			puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "2"
			size = "Medium"
			puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "3"
			size = "Large"
			puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		elsif response == "done"
			if size.nil? == false
				self.preferred_size = size
				puts "Thank you for your selection"
			else
				puts "Thank you for your selection"
			end
			break
		elsif response.downcase == "quit"
			puts "Goodbye"
			break
		else
			puts "Invalid response - to quit, type 'quit'"
		end

		end #ends the loop
	end
	
	#set preferred zip
	def set_preferred_zip

		puts "Your current zip is #{self.zip}. To change, please enter a new zip or type 'quit' to exit"

		zip = nil
		loop do

		response = gets.chomp
		#make sure response contains appropriate values
		if response == "done"
			if zip.nil? == false
				self.zip = zip
				puts "Thank you for your selection"
			end 
			break
		elsif response.to_i == 0
			puts "Please enter a valid zip or type 'quit' to exit"
		elsif response.length != 5
			puts "Please enter a valid zip or type 'quit' to exit"
		elsif response.downcase == "done"
			puts "Goodbye"
			break
		else
			zip = response
			puts "You chose #{zip}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
		end

		end #ends the loop
	end 

  def show_available_pets
    self.preferred_species
    self.preferred_temperament
    self.preferred_size

    where_statement = [
      "species = ? and temperament = ? and size = ?",
      self.preferred_species.downcase,
      self.preferred_temperament.downcase,
      self.preferred_size.downcase
    ]

    p where_statement
    p Pet.where(where_statement)


  end

end
