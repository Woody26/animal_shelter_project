require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/animal.rb' )
require_relative( '../models/customer.rb' )
also_reload( '../models/*' )


get '/customers' do
  @customers = customer.all
  erb(:index)
end

get '/customers/new' do
  @animals = animals.all
  erb(:new)
end

post '/customers' do
  Customer.new(params).save
  redirect to '/customers'
end

get '/customers/:id' do
  @customer = Customer.find(params['id'])
  erb(:show)
end

get '/customers/:id/edit' do
  @animals = Animals.all
  @customer = Customer.find(params['id'])
  erb(:edit)
end

post '/customers/:id' do
  customer = Customer.new(params)
  customer.update
  redirect to "/customers/#{params['id']}"
end

post '/customers/:id/delete' do
  customer = Customer.find(params['id'])
  customer.delete
  redirect to '/customers'
end
