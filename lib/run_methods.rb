require 'artii'
$user = nil
def introduce
	125.times do print "*" end
	puts
	a = Artii::Base.new
	a.asciify('word') 
	puts a.asciify('Welcome to Pets R US!') 
	125.times do print "*" end
	puts
end

def welcome
	puts "Are you an existing user? Yes/No"

	loop do

	response = gets.chomp
	if response.downcase == "yes"
		login
		break
	elsif response.downcase == "no"
		puts
		67.times do print "*" end
		puts
		puts
		puts
		puts "Please create an account to continue"
		puts
		67.times do print "*" end
		puts
		puts
		puts
		create_account
		break
	elsif response.downcase == "quit"
		puts "Have a nice day!"
		break
	else puts "Please enter Yes or No for login access - enter quit to close application"
	end

	end

end

#go through account creation process
def create_account
	puts "Please tell us your first name"
	first_name = gets.chomp

	puts "Please tell us your last_name"
	last_name = gets.chomp

	puts "Please provide a username for login access"
	loop do
	username = gets.chomp

	if Adopter.find_by(username:username)
		puts "We're sorry, that username already exists. Please try another"
	else
		puts "Thanks for joining!"
		Adopter.create(username: username, first_name: first_name, last_name: last_name)
		# binding.pry
		$user = Adopter.all.last
		puts
		67.times do print "*" end
		puts
		puts
		puts "To help us help you, please follow the following prompts:"
		puts
		67.times do print "*" end
		puts
		puts
		#go through preferences
		$user.set_preferred_species
		$user.set_preferred_temperament
		$user.set_preferred_size
		$user.set_preferred_zip
		$user.present_options
		break
	end
	end
end

#search for exising username to log in with
def login
	puts
	67.times do print "*" end 
	puts
	puts
	puts "Please enter your username to log in: "

	loop do

	response = gets.chomp

	if Adopter.find_by(username:response)
		puts
		67.times do print "*" end 
		puts
		puts
		puts "Welcome back!"
		puts
		$user = Adopter.find_by(username:response)
		puts
		67.times do print "*" end 
		puts
		puts
		$user.present_options
		break
	elsif response.downcase == "exit"
		puts "Goodbye"
		break
	else
		puts "Hmmm, we couldn't find an existing account with that username. Please try again. To exit, please enter Exit"
	end

	end

end
