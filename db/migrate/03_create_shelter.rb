class CreateShelter < ActiveRecord::Migration

	def change 
		create_table :shelters do |t|
			t.string :name
			t.string :street
			t.string :city
			t.string :zip 
			t.boolean :volunteer?
		end 
	end 

end 