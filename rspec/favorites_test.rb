#make sure preferences are saved
#make sure pets returned match preferences
#make sure adopted pets are unfavorited and not available

RSpec.describe 'Adopter' do
 	  let(:stella) { Adopter.new(first_name: 'Stella', last_name: "Artois", id: 1, preferred_species: "Dog", preferred_size: "Small", preferred_temperament: "Quiet", zip: 25252) }
  	  let(:blanche) { Adopter.new(first_name: "Carte", last_name: 'Blanche', id: 2, preferred_species: "Cat", preferred_size: "Small", preferred_temperament: "Independent", zip: 15151) }

  describe 'Shelter', do
	  let(:pound) {Shelter.new(name:"The Pound", zip: 25252, id: 1)}
	  let(:hra) {Shelter.new(name:"Humane Rescue Alliance", zip: 15151, id: 2)}
  

  describe 'Pet' do 
 	let(:buddy) { Pet.new(name: 'Buddy', species: "Dog", breed: "Cairne Terrier", temperament: "Quiet", age: 13, size: "Small", misc: "Likes chewies", owner_id: nil, available: true, shelter: 1, id: 1) }
 	let(:grizz) { Pet.new(name: 'Grizabella', species: "Cat", breed: "Maine Coon", temperament: "Outgoing", age: 2, size: "Medium", misc: "Smells bad", owner_id: nil, available: true, shelter: 2, id: 2) }
 	let(:basil) { Pet.new(name: 'Basil', species: "Rabbit", breed: "Stag Hare", temperament: "Independent", age: 4, size: "Large", misc: "Likes to fight", owner_id: nil, available: true, shelter: 1, id: 3) }
 	let(:penny) { Pet.new(name: 'Penny', species: "Cat", breed: "Tortoiseshell", temperament: "Independent", age: 3, size: "Small", misc: "Fond of sunlight", owner_id: nil, available: false, shelter: 2, id: 4) }
 

  describe '#preferred' do
        it 'person only sees pets pets matching their preferences' do
          expect {stella.preferred_pets}.to include(buddy)
          expect {stella.preferred_pets}.not_to include(basil, grizz, penny)
          end
      	end 
  	end
	end 
end