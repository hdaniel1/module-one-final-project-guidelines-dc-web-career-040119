class CreatePet < ActiveRecord::Migration[4.2]

	def change
		create_table :pets do |t|
			t.string :name
			t.string :breed
			t.string :species
			t.string :temperament
			t.string :size
			t.integer :age
			t.string :miscellaneous
			t.boolean :available
			t.integer :owner_id
			t.integer :shelter_id
		end
	end
end
