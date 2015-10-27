ENV['SINATRA_ENV'] ||= "development"

require 'bundler'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require 'sinatra/base'
require 'sinatra/reloader'

require './app'
require_all './models'

ActiveRecord::Base.establish_connection(
	adapter: 'sqlite3',
	database: 'db/sinatra_nested_forms.db')
