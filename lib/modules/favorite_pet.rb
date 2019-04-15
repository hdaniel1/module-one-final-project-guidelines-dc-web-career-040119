class FavoritePet < ActiveRecord::Base[4.2]
	belongs_to :pet 
	belongs_to :adopter

end 