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

#add new animal
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
  erb(:"index")
end

# edit
get '/animals/:id/edit' do
  @owners = Owner.all
  @animals = Animal.find(params['id'])
  erb(:"animals/edit")
end

# update
post '/animals/:id' do
  Animal.new(params).update
  redirect to '/animals'
end

# delete
post '/animals/:id/delete' do
  animal = Animal.find(params['id'])
  animal.delete
  redirect to '/animals'
end

# GET ADOPTION Form
get "/animals/:id/adoption-form" do
  @animal = Animal.find(params['id'])
  @owners = Owner.all()
  erb(:"animals/adopt")
end

# ADOPTING
post "/animals/:id/adopt" do
  animal = Animal.find(params["id"])
  animal.owner_id = params["owner_id"].to_i
  animal.update()
  redirect to '/animals'
end
