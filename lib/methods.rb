species_dict = { '1': 'Dogs', '2': 'Cats', '3': 'Rabbits' }
input = [1, '2', '3']

prefered_species = input.map { |code| species_dict.fetch(code.to_s.to_sym, code) }

def translate(input, lookup_hash)
  if input.is_a?(Array)
    input.map { |code| lookup_hash.fetch(code.to_s.to_sym, code) }
  elsif input.is_a?(String) || input.is_a?(Integer)
    lookup_hash.fetch(input.to_s.to_sym, input)
  end
end

# p translate(input, species_lookup)
# p translate(2, species_lookup)
# p translate('3', species_lookup)

def lookup_key(key, dictionary)
  dictionary.fetch(key.to_s.to_sym, key)
end

def lookup_key_array(key_array, dictionary)
  key_array.map { |key| lookup_key(key, dictionary) }
end

p lookup_key_array(input, species_dict)
