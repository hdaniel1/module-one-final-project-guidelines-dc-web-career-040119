require_relative '../config/environment'

def welcome
	puts "Welcome to [Insert placeholder name here]"
	puts "Are you an existing user? Yes/No"
	response = gets.chomp
	if response.downcase == "yes"
		puts "Please enter your username to log in:"
		login
	elsif response.downcase == "no"
		puts "Please create an account to continue"
		create_account
	else puts "Please enter Yes or No for login access"
	end 
end 

def create_account
	puts "Please tell us your first name"
	first_name = gets.chomp 
	puts "Please tell us your last_name"
	last_name = gets.chomp
	puts "Please provide a username for login access"
	username = gets.chomp
	Adopter.create(username: username, first_name: first_name, last_name: last_name)
end 

def login
	response = gets.chomp
	if Adopter.find_by(username:response) == false
		puts "Hmmm, we couldn't find an account associated with that username. Please try again."
	elsif Adopter.find_by(username:response) == true
		puts "Welcome back!"
	end 
end 

welcome 