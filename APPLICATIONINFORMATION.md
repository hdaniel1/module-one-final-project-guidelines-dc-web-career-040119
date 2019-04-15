# Module One Final Project - Animal Shelter Application

# Contributors
-Dan Hallada
-Matthew Lindsey

# API Information
 
https://userguide.rescuegroups.org/display/APIDG/HTTP+API+object+information+and+code+examples

# User Stories
1. As a user, I want to log in and specify certain adoption preferences
2. As a user, I want to see all available pets/shelters based on my preferences
3. As a user, I want to adopt a pet
4. As a user, I want to see all shelters in my area that offer volunteer work
5. As a user, I want to sign up for volunteer work
6. As a user, I want to see all events in my area
7. As a user, I want to sign up for events in my area

# Object Models
1. Adopter
	-Attributes:
		1. first_name - string, required
		2. last_name - string, required
	-Methods:
		1. See all Adopters
		2. See all favorited pets
		3. See my preferences by species
		4. Edit my preferences
		5. See my attended events
		6. See my volunteer history
2. Preferences 
	-Attributes:
		1. Adopter - integer, required
		2. Breed - string, optional
		3. Size - string, optional (Options = Small, Medium, Large)
		4. Species - string, optional (Options = Dog, Cat, Rabbit)
		5. Temperament - string, optional (Options = Friendly, Aggressive, Quiet)
		6. Age - integer, optional 
3. Pet
	-Attributes:
		1. Name - string, optional
		2. Breed - string, optional
		3. Species - string, required
		4. Size (small, medium, large) - string, required
		5. Temperament (aggressive, sedentary, family-oriented) - string, required
		6. Age - integer, required
		7. Misc.(Special needs, diet, etc.) - string, optional
		8. Available?  - boolean, required
	-Methods:
		1. See all pets
		2. See all potential Adopters
4. Shelter
	-Attributes:
		1. Name - string, required
		2. Street - string, required
		3. City - string, required
		4. Zip - string, required
		5. Volunteer? - boolean, optional
	-Methods:
		1. See all shelters
		2. See all pets
		3. See all available pets
		4. See all adopted pets
		5. See pets by breed
		6. See all shelters that have volunteer work
		7. See all events
5. Area
	-Attributes:
		1. Zip - string, required
		3. City, string, required
	-Methods: 
		1. See all areas
		2. See all shelters in area
		3. See all available pets???
6. Event
	-Attributes:
		1. Shelter - integer, required
		2. Location - string, required
		3. Description - string, required
		4. Start_time - datetime, required
		5. End_time - datetime, required
7. Favorited_Pets (J)
	-Attributes:
		1. Pet - integer, required
		2. Adopter - integer, required
8. Volunteer_Interest (J)
	-Attributes:
		1. Shelter - integer, required
		2. Adopter - integer, required
9. Event_attendance (J)
	-Attributes:
		1. Attended - boolean, optional
		2. Event - integer, required
		3. Adopter - integer, required


# Object Relationships
Shelter <> Pet = 1:N
Area <> Shelter = 1:N
Adopter <> Preferences 1:N
Adopter <> Pet = N:N through favorited_pets
User <> Shelter = N:N through volunteer table
User <> Event = N:N through event_attendance


