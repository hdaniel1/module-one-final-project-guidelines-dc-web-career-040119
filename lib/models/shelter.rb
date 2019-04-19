class Shelter < ActiveRecord::Base
	has_many :pets

	def self.volunteer_shelters 
		Shelter.all.select do |shelter|
			shelter.volunteer == true 
		end 
	end
end 