class CreateShelter < ActiveRecord::Migration[4.2]

	def change
		create_table :shelters do |t|
			t.string :name
			t.string :street
			t.string :city
			t.string :zip
			t.boolean :volunteering
		end
	end

end
