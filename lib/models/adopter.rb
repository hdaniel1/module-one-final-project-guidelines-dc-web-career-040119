class Adopter < ActiveRecord::Base
  has_many :favorite_pets
  has_many :pets
  has_many :pets, through: :favorite_pets

  # gets the users fullname
  def full_name
    "#{first_name} #{last_name}"
  end

  # present menu options
  def present_options
    puts "Hello #{full_name}"
    puts 'What can we help you with today? Please enter the number corresponding with what you would like to do:'
    puts '1. Review & Update Preferences'
    puts '2. See available pets'
    puts '3. View my favorite pets'
    puts '4. Logout'
    choose_menu_option
  end

  # menu options paths
  def choose_menu_option
    response = gets.chomp
    if response == '1'
      show_preferences
    elsif response == '2'
      show_available_pets
    elsif response == '4'
      puts 'Goodbye'
      $user = nil
    end
  end

  # shows user's existing preferences
  def show_preferences
    puts 'Your preferences are as follows:'
    puts "1. Species - #{preferred_species}"
    puts "2. Temperament - #{preferred_temperament}"
    puts "3. Size - #{preferred_size}"
    puts "4. Zip - #{zip}"
    puts "To update your preferences, enter 'change'. Otherwise, enter 'exit' to return to the main menu"
    change_preferences
    save
  end

  # goes through methods to update preferences
  def change_preferences
    loop do
      response = gets.chomp
      if response == 'change'
        set_preferred_species
        set_preferred_temperament
        set_preferred_size
        set_preferred_zip
        present_options
        break
      elsif response == 'exit'
        present_options
        break
      else
        puts 'Please enter a valid response'
      end
    end
  end

  # wording for updating preferred_species
  def set_preferred_species
    puts 'What type of animal are you looking for?'
    puts 'We offer the following species:'
    puts '1. Dogs'
    puts '2. Cats'
    puts '3. Rabbits'
    puts "Please enter the number corresponding to the species you're interested in"
    parse_species
  end

  # wording for updating preferred_temperament
  def set_preferred_temperament
    puts 'Please choose from one of the following temperaments'
    puts '1. Outgoing'
    puts '2. Quiet'
    puts '3. Independent'
    parse_temperament
    save
  end

  # wording for updating preferred_size
  def set_preferred_size
    puts 'Please choose from one of the following sizes'
    puts '1. Small'
    puts '2. Medium'
    puts '3. Large'
    parse_size
    save
  end

  # logic for defining user response for preferred species
  def parse_species
    species = nil

    loop do
      response = gets.chomp
      # make sure response contains appropriate values
      if response == '1'
        species = 'dog'
        puts "You chose #{species}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
      elsif response == '2'
        species = 'cat'
        puts "You chose #{species}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
      elsif response == '3'
        species = 'rabbit'
        puts "You chose #{species}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
      elsif response == 'done'
        if species.nil? == false
          self.preferred_species = species
          puts 'Thank you for your selection'
        else
          puts 'Thank you for your selection'
        end
        break
      elsif response.casecmp('quit').zero?
        puts 'Goodbye'
        break
      else
        puts "Invalid response - to quit, type 'quit'"
      end
    end # ends the loop
  end

  # logic for defining user response for preferred temperament
  def parse_temperament
    temperament = nil

    loop do
      response = gets.chomp
      # make sure response contains appropriate values
      if response == '1'
        temperament = 'Outgoing'
        puts "You chose #{temperament}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
      elsif response == '2'
        temperament = 'Quiet'
        puts "You chose #{temperament}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
      elsif response == '3'
        temperament = 'Independent'
        puts "You chose #{temperament}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
      elsif response == 'done'
        if temperament.nil? == false
          self.preferred_temperament = temperament
          puts 'Thank you for your selection'
        else
          puts 'Thank you for your selection'
        end
        break
      elsif response.casecmp('quit').zero?
        puts 'Goodbye'
        break
      else
        puts "Invalid response - to quit, type 'quit'"
      end
    end # ends the loop
  end

  # logic for defining user response for preferred size
  def parse_size
    size = nil

    loop do
      response = gets.chomp
      # make sure response contains appropriate values
      if response == '1'
        size = 'Small'
        puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
      elsif response == '2'
        size = 'Medium'
        puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
      elsif response == '3'
        size = 'Large'
        puts "You chose #{size}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
      elsif response == 'done'
        if size.nil? == false
          self.preferred_size = size
          puts 'Thank you for your selection'
        else
          puts 'Thank you for your selection'
        end
        break
      elsif response.casecmp('quit').zero?
        puts 'Goodbye'
        break
      else
        puts "Invalid response - to quit, type 'quit'"
      end
    end # ends the loop
  end

  # set preferred zip
  def set_preferred_zip
    puts "Your current zip is #{zip}. To change, please enter a new zip or type 'quit' to exit"

    zip = nil
    loop do
      response = gets.chomp
      # make sure response contains appropriate values
      if response == 'done'
        if zip.nil? == false
          self.zip = zip
          puts 'Thank you for your selection'
        end
        break
      elsif response.to_i == 0
        puts "Please enter a valid zip or type 'quit' to exit"
      elsif response.length != 5
        puts "Please enter a valid zip or type 'quit' to exit"
      elsif response.casecmp('done').zero?
        puts 'Goodbye'
        break
      else
        zip = response
        puts "You chose #{zip}. If this is correct, enter 'done'. Otherwise, please re-enter your choice."
      end
    end # ends the loop
  end

  def show_available_pets
    conditions = 'pets.species = :species and '\
               'pets.temperament = :temperament and '\
               'pets.size = :size and '\
               'shelters.zip'

    named_params = {
      species: self.preferred_species.downcase,
      temperament: self.preferred_temperament.downcase,
      size: self.preferred_size.downcase,
      zip: self.zip
    }

    results = Pet.joins(:shelter).where(conditions, named_params).to_a

    results.each do |pet|
      print 'Pet ID: '
      puts pet.id
      print 'Name: '
      puts pet.name.nil? ? 'N/A' : pet.name
      print 'Breed: '
      puts pet.breed.nil? ? 'N/A' : pet.breed
      print 'Age: '
      puts pet.age.nil? ? 'N/A' : "#{pet.age} year(s)"
      print 'Miscellaneous: '
      puts pet.miscellaneous.nil? ? 'N/A' : pet.miscellaneous
      print 'Shelter ID: '
      puts pet.shelter.name.nil? ? 'N/A' : pet.shelter.name
    end


    # p result = results.first
    # p result.shelter.name




    # p Pet.joins(:shelter).where(statement, named_params)

    # where_statement = [
    #   "species = ? and temperament = ? and size = ? and zip = ?",
    #   self.preferred_species.downcase,
    #   self.preferred_temperament.downcase,
    #   self.preferred_size.downcase,
    #   self.zip
    # ]
    # select_statement = 'pets.id as pet_id, pets.name as pet_name, pets.breed as pet_breed, pets.age as pet_age, pets.miscellaneous as pet_miscellaneous, shelters.name as shelter_name'
    # p test = Pet.select('*').joins(:shelter).where(where_statement)
    #
    # rows = Pet.joins(:shelter).select(select_statement).where(where_statement)
    # rows.each do |row|
    #   print 'Pet ID: '
    #   puts row.id
    #   print 'Name: '
    #   puts row.name.nil? ? 'N/A' : row.name
    #   print 'Breed: '
    #   puts row.breed.nil? ? 'N/A' : row.breed
    #   print 'Age: '
    #   puts row.age.nil? ? 'N/A' : "#{row.age} year(s)"
    #   print 'Miscellaneous: '
    #   puts row.miscellaneous.nil? ? 'N/A' : row.miscellaneous
    #   print 'Shelter ID: '
    #   puts row.shelter.name.nil? ? 'N/A' : row.shelter.name
    # end
  end
end
