humane_society = Shelter.find_or_create_by(name: "Humane Society", city: "Baltimore", zip: "25150", volunteer?: false, street: "3501 Fake St." )

the_pound = Shelter.find_or_create_by(name: "Pound", city: "Washington D.C.", zip: "35920", volunteer?: true, street: "9523 Best Lane" )

dan = Adopter.find_or_create_by(first_name: "Dan", last_name: "Hallada")

matt = Adopter.find_or_create_by(first_name: "Matthew", last_name: "Lindsey")

sarah = Adopter.find_or_create_by(first_name: "Sarah", last_name:"Jones")

shadow = Pet.find_or_create_by(name: "Shadow", breed: "Cocker Spaniel", age: 12, size: "Medium", temperament: "Friendly", species: "Dog", miscellaneous: "raised by wolves", available?: true, shelter: humane_society)

buddy = Pet.find_or_create_by(name: "Buddy", breed: "Tortoise Shell", age: 3, size: "Small", temperament: "Quiet", species: "Cat", miscellaneous: "smells bad", available?: true, shelter: humane_society)

bunnicula = Pet.find_or_create_by(name: "Bunnicula", breed: "Rabbit", age: 6, size: "Small", temperament: "Aggressive", species: "Rabbit", miscellaneous: "drinks blood", available?: false, shelter: the_pound)

fido = Pet.find_or_create_by(name: "Fido", breed: "Poodle", age: 8, size: "Large", temperament: "Friendly", species: "Dog", available?: true, shelter: humane_society

donny = Pet.find_or_create_by(name: "Donny", breed: "Short-Hair", age: 4, size: "Medium", temperament: "Friendly", species: "Rabbit", available?: true, shelter: the_pound)

crookshanks = Pet.find_or_create_by(name: "Crookshanks", breed: "Maine Coon", age: 3, size: "Large", temperament: "Aggressive", species: "Cat", miscellaneous: "Snores", available?: false, shelter: the_pound)

bolt = Pet.find_or_create_by(name: "Bolt", breed: "Jack Russell", age: 1, size: "Small", temperament: "Aggressive", species: "Dog", miscellaneous: "Hates water", available?: true, shelter: the_pound)

bear = Pet.find_or_create_by(name: "Bear", breed: "Golden Retriever", age: 7, size: "Medium", temperament: "Friendly", species: "Dog", miscellaneous: "Loves children", available?: true, shelter: humane_society)