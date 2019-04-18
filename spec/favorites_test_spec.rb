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
 	let(:stella) { Adopter.create(first_name: 'Stella', last_name: "Artois", preferred_species: "Dog", preferred_size: "Small", preferred_temperament: "Quiet", zip: 25252) }
  	let(:blanche) { Adopter.create(first_name: "Carte", last_name: 'Blanche', preferred_species: "Cat", preferred_size: "Small", preferred_temperament: "Independent", zip: 15151) }

  	describe 'Shelter' do
	  let(:pound) {Shelter.create(name:"The Pound", zip: 25252)}
	  let(:hra) {Shelter.create(name:"Humane Rescue Alliance", zip: 15151)}

  	describe 'Pet' do 
	 	let(:buddy) { Pet.create(name: 'Buddy', species: "Dog", breed: "Cairne Terrier", temperament: "Quiet", age: 13, size: "Small", miscellaneous: "Likes chewies", owner_id: nil, available: true, shelter: hra) }
	 	let(:grizz) { Pet.create(name: 'Grizabella', species: "Cat", breed: "Maine Coon", temperament: "Outgoing", age: 2, size: "Medium", miscellaneous: "Smells bad", owner_id: nil, available: true, shelter: pound) }
	 	let(:basil) { Pet.create(name: 'Basil', species: "Rabbit", breed: "Stag Hare", temperament: "Independent", age: 4, size: "Large", miscellaneous: "Likes to fight", owner_id: nil, available: true, shelter: hra) }
	 	let(:penny) { Pet.create(name: 'Penny', species: "Cat", breed: "Tortoiseshell", temperament: "Independent", age: 3, size: "Small", miscellaneous: "Fond of sunlight", owner_id: nil, available: false, shelter: pound) }

	 	it "checks preferred pets match preferences" do 
	 		expect(stella.my_preferred_pets).to include(buddy)
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