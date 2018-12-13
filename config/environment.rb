require 'bundler'
Bundler.require
require_all 'app'
require './app/controllers/application_controller'

ActiveRecord::Base.establish_connection({
  :adapter => "sqlite3",
  :database  => "db/database.sqlite3"})
