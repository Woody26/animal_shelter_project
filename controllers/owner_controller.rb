require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )


get '/owner' do
  @owners = Owner.all
  erb(:"/owner/index")
end

get '/owner/new' do
  @owners = Owner.all
  erb(:"/owner/new")
end

# post '/owner' do
#   Owner.new(params).save
#   redirect to '/owner'
# end
#
# get '/owner/:id' do
#   @owner = Owner.find(params['id'])
#   erb(:show)
# end
#
# get '/owner/:id/edit' do
#   @animals = Animals.all
#   @owner = Owner.find(params['id'])
#   erb(:edit)
# end
#
# post '/owner/:id' do
#   owner = Owner.new(params)
#   owner.update
#   redirect to "/owner/#{params['id']}"
# end
#
# post '/owner/:id/delete' do
#   owner = Owner.find(params['id'])
#   Owner.delete
#   redirect to '/owner'
# end
