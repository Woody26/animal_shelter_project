require('pg')
require_relative( '../db/sql_runner' )
require_relative('owner')

class Animal

  attr_reader :id
  attr_accessor :name, :age, :species, :adoptable, :admission_date, :owner_id

  def initialize( options )
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @age = options['age'].to_i()
    @species = options['species']
    @adoptable = options['adoptable']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id'].to_i() if options['owner_id']
  end

  def save()
    sql = "INSERT INTO animals
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

  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      age,
      species,
      adoptable,
      admission_date,
      owner_id
      ) =
      (
        $1, $2, $3, $4, $5, $6
      ) WHERE id = $7"
        values = [@name, @age, @species, @adoptable, @admission_date, @owner_id, @id]
        SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animal = SqlRunner.run(sql)
    return animal.map { | animal | Animal.new(animal) }
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    animal_hash = results.first()
    animal = Animal.new(animal_hash)
    return animal
  end

end
