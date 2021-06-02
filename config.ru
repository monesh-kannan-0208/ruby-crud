require './lib/app.rb'

use Rack::Reloader, 0

run App.new