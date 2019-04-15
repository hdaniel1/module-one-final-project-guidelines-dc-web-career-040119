#Module One Final Project - Animal Shelter Application

#API Information

https://userguide.rescuegroups.org/display/APIDG/HTTP+API+object+information+and+code+examples

#User-Stories
1. As a user, I want to log in and specify certain preferences
2. As a user, I want to see all available pets/shelters based on my preferences
3. As a user, I want to adopt a pet
4. As a user, I want to see all shelters in my area that offer voluneteer work
5. As a user, I want to sign up for volunteer work
6. As a user, I want to see all events in my area
7. As a user, I want to sign up for events in my area

#Object Models
1. Adoptee
	-Attributes:
		1. first_name - string, required
		2. last_name - string, required
		3. favorited_pets - array, optional
		4. Preferences
			-Breed
			-Size
			-Temperament
			-Price
			-Area
			-Age
	-Methods:
		1. See all adoptees
		2. See all favorited pets
		3. See preferences
2. Pet
	-Attributes:
		1. name - string, optional
		2. Breed - string, optional
		3. Species - string, required
		4. Size (small, medium, large) - string, required
		5. Temperament (aggressive, sedentary, family-oriented), Sstring, required
		6. Age - integer, required
		7. Misc.(Special needs, diet, etc.) - string, optional
		8. Available?  - boolean, required
	-Methods:
		1. See all pets
		2. See all potential adoptees
3. Shelter
	-Attributes:
		1. Name - string, required
		2. Street - string, required
		3. City - string, required
		4. Zip - string, required
		5. List of pets - array, optional
		6. Volunteer? - boolean, optional
	-Methods:
		1. See all shelters
		2. See all pets
		3. See all available pets
		4. See all adopted pets
		5. See pets by breed
		6. See all shelters that have volunteer work
4. Area
	-Attributes:
		1. Zip - string, required
		2. List of shelters
		3. City, string, required
	-Methods: 
		1. See all areas
		2. See all shelters in area
		3. See all available pets???
5. Event
	-Attributes:
		1. Shelter - integer, required
		2. Location - string, required
		3. Description - string, required
		4. Start_time - datetime, required
		5. End_time - datetime, required
6. Favorited_Pets (J)
	-Attributes:
		1. Pet - integer, required
		2. Adoptee - integer, required
7. Volunteer_Interest (J)
	-Attributes:
		1. Shelter - integer, required
		2. Adoptee - integer, required
8. Event_attendance (J)
	-Attributes:
		1. Attended - boolean, optional
		2. Event - integer, required
		3. Adoptee - integer, required


# Object Relationships
Shelter <> Pet = 1:N
Area <> Shelter = 1:N
Adoptee <> Pet = N:N through favorited_pets
User <> Shelter = N:N through volunteer table
User <> Event = N:N through event_attendance


