#make sure preferences are saved
#make sure pets returned match preferences
#make sure adopted pets are unfavorited and not available
require_relative '../config/environment.rb'
require 'rspec'

describe 'user' do
  it "checks global user is nil" do
    expect($user).to eq(nil)
  end
end

describe 'Adopter' do
 	let(:stella) { Adopter.find_or_create_by(first_name: 'Stella', last_name: "Artois", preferred_species: "Dog", preferred_size: "Small", preferred_temperament: "Quiet", zip: 25252) }
  	let(:blanche) { Adopter.find_or_create_by(first_name: "Carte", last_name: 'Blanche', preferred_species: "Cat", preferred_size: "Small", preferred_temperament: "Independent", zip: 15151) }

  	describe 'Shelter' do
	  let(:pound) {Shelter.find_or_create_by(name:"The Pound", street: "1800 Fake St.", city: "D.C.", zip: 25252, volunteer: true)}
	  let(:hra) {Shelter.find_or_create_by(name:"Humane Rescue Alliance", zip: 15151, volunteer: false)}

  	describe 'Pet' do 
	 	let(:buddy) { Pet.find_or_create_by(name: 'Buddy', species: "Dog", breed: "Cairne Terrier", temperament: "Quiet", age: 13, size: "Small", miscellaneous: "Likes chewies", owner_id: nil, available: true, shelter: pound) }
	 	let(:grizz) { Pet.find_or_create_by(name: 'Grizabella', species: "Cat", breed: "Maine Coon", temperament: "Outgoing", age: 2, size: "Medium", miscellaneous: "Smells bad", owner_id: nil, available: true, shelter: pound) }
	 	let(:basil) { Pet.find_or_create_by(name: 'Basil', species: "Rabbit", breed: "Stag Hare", temperament: "Independent", age: 4, size: "Large", miscellaneous: "Likes to fight", owner_id: nil, available: true, shelter: hra) }
	 	let(:penny) { Pet.find_or_create_by(name: 'Penny', species: "Cat", breed: "Tortoiseshell", temperament: "Independent", age: 3, size: "Small", miscellaneous: "Fond of sunlight", owner_id: nil, available: false, shelter: pound) }
	 	let(:fido) { Pet.find_or_create_by(name: 'Fido', species: "Dog", breed: "Daschund", temperament: "Quiet", age: 5, size: "Small", miscellaneous: "Barks at nothing", owner_id: nil, available: false, shelter: pound) }

	 	describe 'FavoritePet' do
	 		let(:stella_fav) {FavoritePet.find_or_create_by(pet_id: buddy.id, adopter_id: stella.id)}


	 # 	it "checks that I can update my preferences" do
	 # 		expect(stella.preferred_speciesparse_species(gets:"1")).to eq
		# end

	 	it "checks preferred pets match preferences" do 
	 		expect(stella.my_preferred_pets).to include(buddy)
	 	end

	 	it "checks non-preferred pets don't appear in favorites" do 
	 		expect(stella.my_preferred_pets).to_not include(grizz)
	 	end

	 	it "checks non-available pets don't appear in favorites" do 
	 		expect(stella.my_preferred_pets).to_not include(fido)
	 	end

	 	it "checks that I have a favorite pet" do 
	 		expect(stella.favorite_pets).to include(stella_fav)
	 	end 

	 	it "checks that I don't have a favorite pet" do 
	 		expect(blanche.favorite_pets).to eq([])
	 	end 

	 	# it "checks only volunteer shelters are returned in my area" do 
	 	# 	expect(stella.shelters_with_volunteer_in_my_area).to output('1. The Pound - 1800 Fake St. D.C., 25252').to_stdout 
	 	# end


	 end
	 end 
 	end
end
#   describe 'Shelter', do
# 	  let(:pound) {Shelter.create(name:"The Pound", zip: 25252, id: 1)}
# 	  let(:hra) {Shelter.create(name:"Humane Rescue Alliance", zip: 15151, id: 2)}
# end

#   describe 'Pet' do 
#  	let(:buddy) { Pet.create(name: 'Buddy', species: "Dog", breed: "Cairne Terrier", temperament: "Quiet", age: 13, size: "Small", misc: "Likes chewies", owner_id: nil, available: true, shelter: 1, id: 1) }
#  	let(:grizz) { Pet.create(name: 'Grizabella', species: "Cat", breed: "Maine Coon", temperament: "Outgoing", age: 2, size: "Medium", misc: "Smells bad", owner_id: nil, available: true, shelter: 2, id: 2) }
#  	let(:basil) { Pet.create(name: 'Basil', species: "Rabbit", breed: "Stag Hare", temperament: "Independent", age: 4, size: "Large", misc: "Likes to fight", owner_id: nil, available: true, shelter: 1, id: 3) }
#  	let(:penny) { Pet.create(name: 'Penny', species: "Cat", breed: "Tortoiseshell", temperament: "Independent", age: 3, size: "Small", misc: "Fond of sunlight", owner_id: nil, available: false, shelter: 2, id: 4) }
#  end

#   describe '#preferred' do
#         it 'person only sees pets pets matching their preferences' do
#           expect {stella.preferred_pets}.to include(buddy)
#           expect {stella.preferred_pets}.not_to include(basil, grizz, penny)
#           end
#   end 
