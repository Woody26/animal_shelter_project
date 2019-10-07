require_relative('../models/animal')
require_relative('../models/owner')
require('pry')

# Animal.delete_all
# Owner.delete_all

  animal1 = Animal.new({
    "name" =>  "Harry",
    "age" => 4,
    "species" => "Dog",
    "adoptable" => "True",
    "admission_date" => "01/01/2019"
    })

  animal2 = Animal.new({
    "name" =>  "Sally",
    "age" => 2,
    "species" => "Cat",
    "adoptable" => "False",
    "admission_date" => "01/10/2019"
    })

  owner1 = Owner.new({
    "first_name" => "Tony",
    "last_name" => "Cobb"
    })

  owner2 = Owner.new({
    "first_name" => "Sarah",
    "last_name" => "Dey"
    })

animal1.save
animal2.save

owner1.save
owner2.save
