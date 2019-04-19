
class Adopter < ActiveRecord::Base 
	has_many :favorite_pets
	has_many :owned_pets, class_name: "Pet"
	has_many :favorited_pets, through: :favorite_pets, source: :pet

	#gets the users fullname
	def full_name
		"#{self.first_name} #{self.last_name}"
	end


	def present_options
		puts "Hello #{self.full_name}!"
		puts "What can we help you with today? Please enter the number corresponding with what you would like to do:"
		puts
		67.times do print "*" end 
		puts
		puts
		puts "1. Review & Update Preferences"
		puts "2. See available pets"
		puts "3. View my favorite pets / Adopt a pet"
		puts "4. Volunteer"
		puts "5. Logout"
		puts
		67.times do print "*" end 
		puts
		puts
		self.choose_menu_option
	end


	#menu options paths
	def choose_menu_option
		response = gets.chomp
		if response == "1"
			ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/animal_shelter.db')
			self.show_preferences
    	elsif response == "2"
    		ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/animal_shelter.db')
     		self.show_available_pets
    	elsif response == "3"
    		ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/animal_shelter.db')
    		self.show_favorite_pets
    	elsif response == "4"
    		self.shelters_with_volunteer_in_my_area
		elsif response == "5"
			puts "Goodbye"
			$user = nil
			exit
		end
	end

	#shows user's existing preferences
	def show_preferences
		puts "Your preferences are as follows:"
		puts
		67.times do print "*" end 
		puts
		puts
		puts "1. Species - #{self.preferred_species}"
		puts "2. Temperament - #{self.preferred_temperament}"
		puts "3. Size - #{self.preferred_size}"
		puts "4. Zip - #{self.zip}"
		puts "To update your preferences, enter 'change'. Otherwise, enter 'done' to return to the main menu"
		puts
		67.times do print "*" end 
		puts
		puts
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
			elsif response =='done'
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
		puts
		67.times do print "*" end 
		puts
		puts
		self.parse_species
		self.save
	end

	#wording for updating preferred_temperament
	def set_preferred_temperament
		puts "Please choose from one of the following temperaments:"
		puts
		67.times do print "*" end 
		puts
		puts
		puts "1. Outgoing"
		puts "2. Quiet"
		puts "3. Independent"
		puts
		67.times do print "*" end 
		puts
		puts
		self.parse_temperament
		self.save
	end

	#wording for updating preferred_size
	def set_preferred_size
		puts "Please choose from one of the following sizes:"
		puts
		67.times do print "*" end 
		puts
		puts
		puts "1. Small"
		puts "2. Medium"
		puts "3. Large"
		puts
		67.times do print "*" end 
		puts
		puts
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
				puts "You chose '#{species}'. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
													puts <<-'EOF' 
^..^      /
/_/\_____/
   /\   /\
  /  \ /  \               
EOF
				puts
				67.times do print "*" end
				puts
				puts
			elsif response == "2"
				species = "cat"
				puts "You chose '#{species}'. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
									puts <<-'EOF' 
 |\__/,|   (\												
 |_ _  |.--.) )
 ( T   )     /
(((^_((((((_/                  
EOF
				puts
				67.times do print "*" end
				puts
				puts
			elsif response == "3"
				species = "rabbit"
				puts "You chose '#{species}'. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
							puts <<-'EOF' 
       	    ,\
             \\\,_
              \` ,\
         __,.-" =__)
       ."        )
    ,_/   ,    \/\_
    \_|    )_-\ \_-`
    `-----` `--`               
EOF
				puts
				67.times do print "*" end
				puts
				puts
			elsif response == "done"
				if species.nil? == false
					self.preferred_species = species
					puts "Thank you for your selection"
					puts
					67.times do print "*" end
					puts
					puts
				else
					puts "Thank you for your selection"
					puts
					67.times do print "*" end
					puts
					puts
				end
				break
			elsif response.downcase == "done"
				puts "Goodbye"
				puts
				67.times do print "*" end
				puts
				puts
				self.present_options
				break
			else
				puts "Invalid response - to quit, type 'done'"
				puts
				67.times do print "*" end
				puts
				puts
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
				puts
				67.times do print "*" end
				puts
				puts
			elsif response == "2"
				temperament = "Quiet"
				puts "You chose #{temperament}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
				puts
				67.times do print "*" end
				puts
				puts
			elsif response == "3"
				temperament = "Independent"
				puts "You chose #{temperament}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
				puts
				67.times do print "*" end
				puts
				puts
			elsif response == "done"
				if temperament.nil? == false
					self.preferred_temperament = temperament
					puts "Thank you for your selection"
					67.times do print "*" end
					puts
					puts
				else
					puts "Thank you for your selection"
					puts
					67.times do print "*" end
					puts
					puts
				end
				break
			elsif response.downcase == "done"
				puts "Goodbye"
				self.present_options
				puts
				67.times do print "*" end
				puts
				puts
				break
			else
				puts "Invalid response - to quit, type 'done'"
				puts
				67.times do print "*" end
				puts
				puts
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
				puts
				67.times do print "*" end
				puts
				puts
			elsif response == "2"
				size = "Medium"
				puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
				puts
				67.times do print "*" end
				puts
				puts
			elsif response == "3"
				size = "Large"
				puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
				puts
				67.times do print "*" end
				puts
				puts
			elsif response == "done"
				if size.nil? == false
					self.preferred_size = size
					puts "Thank you for your selection"
					puts
					67.times do print "*" end
					puts
					puts
				else
					puts "Thank you for your selection"
					puts
					67.times do print "*" end
					puts
					puts
				end
				break
			elsif response.downcase == "done"
				puts "Goodbye"
				puts
				67.times do print "*" end
				puts
				puts
				self.present_options
				break
			else
				puts "Invalid response - to quit, type 'done'"
				puts
				67.times do print "*" end
				puts
				puts
			end
		end #ends the loop
	end

	#set preferred zip
	def set_preferred_zip
		puts "Your current zip is #{self.zip}. To change, please enter a new zip or type 'done' to exit"
		zip = nil
		loop do
		response = gets.chomp
		#make sure response contains appropriate values
			if response == "done"
				if zip.nil? == false
					self.zip = zip
					self.save
					puts "Thank you for your selection"
					puts
					67.times do print "*" end
					puts
					puts
				end 
				break
			elsif response.to_i == 0
				puts "Please enter a valid zip or type 'done' to exit"
				puts
				67.times do print "*" end
				puts
				puts
			elsif response.length != 5
				puts "Please enter a valid zip or type 'done' to exit"
				puts
				67.times do print "*" end
				puts
				puts
			elsif response.downcase == "done"
				puts "Goodbye"
				puts
				67.times do print "*" end
				puts
				puts
				self.present_options
				break
			else
				zip = response
				puts "You chose #{zip}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
				puts
				67.times do print "*" end
				puts
				puts
			end
		end #ends the loop
	end 	

	#gets pets based on preferences
	def my_preferred_pets 
		my_pets = Pet.all.select do |pet|
    		pet.reload.temperament.downcase == self.reload.preferred_temperament.downcase && 
    		pet.reload.size.downcase == self.reload.preferred_size.downcase && 
    		pet.reload.species.downcase == self.reload.preferred_species.downcase && 
    		pet.reload.available == true && 
    		pet.reload.shelter.zip == self.reload.zip
    	end
	end 

	#shows pets based on preferences
  	def show_available_pets
    	self.reload.my_preferred_pets.each do |pet|
    		pet.reload.show_pet_info    	
		end 
		self.reload.favorite_pet
    end 

    #lets the user favorite a pet from their preferences
  	def favorite_pet 
  	
  		if self.reload.my_preferred_pets.empty? == true
  			puts "No pets are available per your preferences"
    		puts
	  		67.times do print "*" end 
			puts
  			self.present_options
  		else
  			puts "To favorite a pet, enter the pet's ID"
  		puts
  		67.times do print "*" end 
		puts
		puts

  		loop do 
  		response = gets.chomp 
			if FavoritePet.find_by(pet_id: response, adopter_id: self.id) 
				puts "You've already favorited #{FavoritePet.find_by(pet_id: response.to_i, adopter_id: self.id).pet.name} - please enter a different pet ID"
			elsif response == "done"
				self.present_options 
			elsif response.to_i == 0
				puts "Please enter a pet ID or type 'done' to return to the main menu"
			else 
				self.reload.my_preferred_pets.each do |pet|
					if response.to_i == pet.id
						FavoritePet.find_or_create_by(pet_id: pet.id, adopter_id: self.id)
						puts "Thanks for considering #{pet.name}! To favorite another pet, enter it's ID or type 'done' to return to the main menu"
					# else 
					# 	puts "No pets with that ID were returned - please check again."
					end
  				end 
  			end 
		end #ends the loop
  		end	
	end 

	def adopt_a_pet
		puts "To adopt a pet, enter the pet's ID. To go back to the main menu, enter 'done'"

  		response = ''
  		while response != "done"
  			response = gets.chomp
			if response.to_i == 0
				puts "Please enter a valid response or type 'done' to return to the main menu"
			elsif FavoritePet.find_chosen_unavailable_pet(response) 
				puts "That pet has already been adopted!"
			elsif FavoritePet.find_chosen_available_pet(response) 
				fav_pet = FavoritePet.find_chosen_available_pet(response) 
				fav_pet.pet.available = false
				fav_pet.pet.owner_id = self.id
				fav_pet.pet.save
				puts
				puts "Congratulations - you've adopted #{fav_pet.pet.name}! They will be removed from your favorites."
				puts
				67.times do print "*" end 
				puts
				FavoritePet.destroy(fav_pet.id)
				self.present_options
			else 
				puts "Please enter a valid pet id from your favorites"
			end

		end #ends the loop
		self.present_options
  	end 
	
  	#list my favorite pets
  	def show_favorite_pets
  		if self.reload.favorite_pets.empty? == true
  			puts "You have not favorited any pets"
  			puts
	  		67.times do print "*" end 
			puts
  			self.present_options
  		else 
	  		"Listed below are pets you have favorited: "
	  		puts
	  		67.times do print "*" end 
			puts
			puts
	  		self.reload.favorite_pets.each do |pet|
	  			pet.reload.pet.show_pet_info 
			end
			self.adopt_a_pet
		end 
	end 

	def shelters_with_volunteer_in_my_area
		puts "The following shelters in your zip(#{self.zip}) offer volunteer opportunities: "
		
		puts
		puts
		count = 1

		Shelter.volunteer_shelters.select do |shelter|
			shelter.zip == self.zip 
		end.each do |my_shelter| 
			puts "#{count}. #{my_shelter.name} - #{my_shelter.street} #{my_shelter.city}, #{my_shelter.zip}" 
			count += 1 
		end

			puts
	  		67.times do print "*" end 
			puts
		self.present_options
	end 
end
