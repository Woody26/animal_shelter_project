require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )


get '/animals' do
  @animals = Animal.all
  erb(:"animals/index")
end

get '/animals/new' do
  @animals = Animal.all
  erb(:"animals/new")
end

#create
post '/animals' do
  Animal.new(params).save
  redirect to '/animals'
end

# show
get '/animals/:id' do
  @animals = Animal.find(params['id'])
  erb(:show)
end

# edit
get '/animals/:id/edit' do
  @owners = Owner.all
  @animals = Animal.find(params['id'])
  erb(:"animals/edit")
end

# update
post '/animals/:id' do
  animal = Animal.new(params)
  Animal.update
  redirect to "/animals/#{params['id']}"
end

# delete
post '/animals/:id/delete' do
  animal = Animal.find(params['id'])
  Animal.delete
  redirect to '/animals'
end
