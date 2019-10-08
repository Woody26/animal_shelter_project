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

# Create
post '/owner' do
  Owner.new(params).save
  redirect to '/owner'
end

# Show
get '/owner/:id' do
  @owner = Owner.find(params['id'])
  erb(:show)
end

# Edit
get '/owner/:id/edit' do
  @animals = Animals.all
  @owner = Owner.find(params['id'])
  erb(:edit)
end

# Update
post '/owner/:id' do
  owner = Owner.new(params)
  Owner.update
  redirect to "/owner/#{params['id']}"
end

# Delete
post '/owner/:id/delete' do
  owner = Owner.find(params['id'])
  Owner.delete
  redirect to '/owner'
end
