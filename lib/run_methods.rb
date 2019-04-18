
#starts the application
def welcome
	67.times do print "*" end
	puts
	puts "Welcome to [Insert placeholder name here]"
	puts "Are you an existing user? Yes/No"
	67.times do print "*" end
	puts

	loop do

	response = gets.chomp
	if response.downcase == "yes"
		login
		$user.present_options
		break
	elsif response.downcase == "no"
		puts "Please create an account to continue"
		create_account
		puts "To help us help you, please follow the following prompts:"
		#go through preferences
		$user.set_preferred_species
		$user.set_preferred_temperament
		$user.set_preferred_size
		$user.set_preferred_zip
		$user.present_options
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
		break
	end
	end
end

#search for exising username to log in with
def login

	puts "Please enter your username to log in "

	loop do

	response = gets.chomp

	if Adopter.find_by(username:response)
		puts "Welcome back!"
		$user = Adopter.find_by(username:response)
		break
	elsif response.downcase == "exit"
		puts "Goodbye"
		break
	else
		puts "Hmmm, we couldn't find an existing account with that username. Please try again. To exit, please enter Exit"
	end

	end

end
