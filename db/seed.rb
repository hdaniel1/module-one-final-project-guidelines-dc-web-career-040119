humane_society = Shelter.find_or_create_by(name: "Humane Society")

dan = Adopter.find_or_create_by(first_name: "Dan", last_name: "Hallada")

matt = Adopter.find_or_create_by(first_name: "Matthew", last_Name: "Lindsey")

shadow = Pet.find_or_create_by(name: "Shadow", breed: "Cocker Spaniel", age: 12, size: "Medium", temperament: "Hostile", species: "Dog", misc: "raised by wolves", available: true

buddy = Pet.find_or_create_by(name: "Buddy", breed: "Tortoise Shell", age: 3, size: "Small", temperament: "Friendly", species: "Cat", misc: "smells bad", available: true)

bunnicula = Pet.find_or_create_by(name: "Bunnicula", breed: "Rabbit", age: 6, size: "Small", temperament: "Quiet", species: "Rabbit", misc: "drinks blood", available: false)