require 'greet'

use Rack::Reloader, 0

run Greet.new