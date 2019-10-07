require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )


get '/animal' do
  @animals = Animal.all
  erb(:"/animal/index")
end

get '/animal/new' do
  @animals = Animal.all
  erb(:"/animal/new")
end

# post '/animal' do
#   Animal.new(params).save
#   redirect to '/animal'
# end
#
# get '/animal/:id' do
#   @animals = Animal.find(params['id'])
#   erb(:show)
# end
#
# get '/animal/:id/edit' do
#   @owners = Owner.all
#   @animals = Animal.find(params['id'])
#   erb(:edit)
# end
#
# post '/animal/:id' do
#   animal = Animal.new(params)
#   Animal.update
#   redirect to "/animal/#{params['id']}"
# end
#
# post '/animal/:id/delete' do
#   animal = Animal.find(params['id'])
#   animal.delete
#   redirect to '/animal'
# end
