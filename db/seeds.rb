require_relative('../models/animal')
require('pry')

  animal1 = AnimalRecord.new({
    "name" =>  "Harry",
    "age" => 4,
    "species" => "Dog",
    "adoptable" => "Yes",
    "admission_date" => "01/01/2019"
    })

  animal2 = AnimalRecord.new({
    "name" =>  "Sally",
    "age" => 2,
    "species" => "Cat",
    "adoptable" => "No",
    "admission_date" => "01/10/2019"
    })

  customer1 = Customer.new({
    "first_name" => "Tony"
    "last_name" => "Cobb"
    })

  customer2 = Customer.new({
        "first_name" => "Sarah"
        "last_name" => "Dey"
        })

animal1.save
animal2.save

customer1.save
customer2.save
