class CreatePreference < ActiveRecord::Migration

	def change 
		create_table :preferences do |t|
			t.string :breed
			t.string :species
			t.string :size
			t.integer :age 
			t.string :temperament
			t.integer :adopter_id
		end 
	end 

end 