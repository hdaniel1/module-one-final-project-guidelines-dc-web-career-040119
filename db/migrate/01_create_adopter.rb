class CreateAdopter < ActiveRecord::Migration[4.2]

	def change 
		create_table :adopters do |t|
			t.string :first_name
			t.string :last_name
		end 
	end 

end 