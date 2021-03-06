# Module One Final Project - Animal Shelter Application

# Contributors
-Dan Hallada
-Matthew Lindsey

# API Information (Potential)
 
https://userguide.rescuegroups.org/display/APIDG/HTTP+API+object+information+and+code+examples

# User Stories
1. As a user, I want to log in and specify certain adoption preferences
2. As a user, I want to see all available pets based on my preferences for shelters in my zip
3. As a user, I want to favorite pets within my preferences to view later
4. As a user, I want to adopt a pet(s) from my favorited pets
5. As a user, I want to see all shelters in my area that offer volunteer work
6. As a user, I want to sign up for volunteer work
7. As a user, I want to see all events in my area
8. As a user, I want to sign up for events in my area

# Object Models
1. Adopter
	-Attributes:
		1. first_name - string, required
		2. last_name - string, required
		3. username - string, required
		4. preferred_species - string, required
		5. preferred_size - string, required
		6. preferred_temperament - string, required
		7. zip - string, required
	-Methods:
		1. See all Adopters
		2. See all favorited pets
		3. See my preferences by species
		4. Edit my preferences
		5. See my attended events
		6. See my volunteer history
		7. Adopt a pet
2. Pet
	-Attributes:
		1. Name - string, optional
		2. Breed - string, optional
		3. Species (dog, cat, rabbit) - string, required
		4. Size (small, medium, large) - string, required
		5. Temperament (independent, quiet, outgoing) - string, required
		6. Age - integer, required
		7. Misc.(Special needs, diet, etc.) - string, optional
		8. Available - boolean, required
		9. Owner ID - integer, optional
	-Methods:
		1. See all pets
		2. See all potential Adopters
3. Shelter
	-Attributes:
		1. Name - string, required
		2. Street - string, required
		3. City - string, required
		4. Zip - string, required
		5. Volunteer - boolean, optional
	-Methods:
		1. See all shelters
		2. See all pets
		3. See all available pets
		4. See all adopted pets
		5. See pets by breed
		6. See all shelters that have volunteer work
		7. See all events
4. Event
	-Attributes:
		1. Shelter - integer, required
		2. Location - string, required
		3. Description - string, required
		4. Start_time - datetime, required
		5. End_time - datetime, required
5. Favorited_Pets (J)
	-Attributes:
		1. Pet - integer, required
		2. Adopter - integer, required
	-Methods:
		1. See all favorited_pets
		2. See favorited pets matching an input response that are available
		3. See favorited pets matching an input response that are unavailable
6. Volunteer_Interest (J)
	-Attributes:
		1. Shelter - integer, required
		2. Adopter - integer, required
7. Event_attendance (J)
	-Attributes:
		1. Attended - boolean, optional
		2. Event - integer, required
		3. Adopter - integer, required


# Object Relationships
Shelter <> Pet = 1:N
Adopter <> Preferences 1:N
Adopter <> Pet = N:N through favorited_pets
Adopter <> Pet = 1:N (owning the pet)
Adopter <> Shelter = N:N through volunteer table
Adopter <> Event = N:N through event_attendance

# Flow
1. Welcome page
	-Existing user? 
		If yes, prompt login - verify username against existing data
		If no, create new adopter. Verify username against existing data to ensure does not exist already.
2. Logged in, presented with homepage options
	-Update preferences
	-Browse available pets
	-Adopt a pet
	-See events in area / sign up
	-Volunteer


