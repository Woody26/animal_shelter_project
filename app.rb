require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animal_controller')
require_relative('controllers/owner_controller')
also_reload("./models/*")

get '/' do
  erb( :index )
end
