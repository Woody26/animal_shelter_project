require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )


get '/owners' do
  @owners = Owner.all
  erb(:"/owners/index")
end

get '/owners/new' do
  @owners = Owner.all
  erb(:"/owners/new")
end

# Create
post '/owners' do
  Owner.new(params).save
  redirect to '/owners'
end

# Show
get '/owners/:id' do
  @owners = Owner.find(params['id'])
  erb(:show)
end

# Edit
get '/owners/:id/edit' do
  @animals = Animal.all
  @owners = Owner.find(params['id'])
  erb(:"owners/edit")
end

# Update
post '/owners/:id' do
  owner = Owner.new(params)
  owner.update
  redirect to "/owners"
end

# Delete
post '/owners/:id/delete' do
  owner = Owner.find(params['id'])
  owner.delete
  redirect to '/owners'
end
