class CreateFavoritePets < ActiveRecord::Migration[4.2]
	def change 
		create_table :favorite_pets do |t|
			t.integer :pet_id
			t.integer :adopter_id
		end 
	end 
end 