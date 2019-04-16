class CreateAdopter < ActiveRecord::Migration

	def change 
		create_table :adopters do |t|
			t.string :first_name
			t.string :last_name
			t.string :username
			t.string :preferred_species
			t.string :preferred_temperament
			t.string :preferred_size
			t.string :zip
		end 
	end 
end 