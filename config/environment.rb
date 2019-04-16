require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/animal_shelter.db')

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

require_all 'lib'