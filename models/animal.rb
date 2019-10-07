require('pg')
require_relative( '../db/sql_runner' )
require_relative('customer')

class Animal

  attr_reader :id, :name, :age, :species, :adoptable, :admission_date, :owner_id


  def initialize( options )
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @age = options['age']
    @species = options['species']
    @adoptable = options['adoptable']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id']
  end

  def save()
    sql = "INSERT INTO animal_records
    (
      name,
      age,
      species,
      adoptable,
      admission_date,
      owner_id
      ) VALUES (
        $1, $2, $3, $4, $5, $6
      ) RETURNING id"
        values = [@name, @age, @species, @adoptable, @admission_date, @owner_id]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM animal_records"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM animal_records"
    animals = SqlRunner.run(sql)
    return animals.map { | animal | Animal.new(animal) }
  end

  def self.find(id)
    sql = "SELECT * FROM animal_records WHERE id = $1"
    values = [id]
    results = SqlRunner.rub(sql, values)
    animal_hash = results.first()
    animal = Animals.new(animal_hash)
    return animal
  end

end
