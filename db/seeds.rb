require 'csv'
require_relative '../config/environment'

CSV.foreach('lib/seeds/adopters.csv', headers: true) do |row|
  Adopter.find_or_create_by(row.to_hash)
end

CSV.foreach('lib/seeds/pets.csv', headers: true) do |row|
  Pet.find_or_create_by(row.to_hash)
end

CSV.foreach('lib/seeds/shelters.csv', headers: true) do |row|
  Shelter.find_or_create_by(row.to_hash)
end
