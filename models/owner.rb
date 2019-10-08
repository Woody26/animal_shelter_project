require('pg')
require_relative( '../db/sql_runner' )
require_relative( 'animal' )

class Owner

  attr_reader :id, :first_name, :last_name

  def initialize (options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO owner
    (
      first_name,
      last_name
      ) VALUES (
        $1, $2
        ) RETURNING id"
        values = [@first_name, @last_name]
        #DO I REQUIRE @PET_ID IN ABOVE LINE OF CODE
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
  end

  def update()
    sql = "UPDATE owner
    SET
    (
      first_name,
      last_name
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@first_name, @last_name, @owner_id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM owner"
    owners = SqlRunner.run(sql)
    return owners.map { | owner | Owner.new(owner) }
  end

  def self.find(id)
    sql = "SELECT * FROM owner WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    owner_hash = results.first()
    owner = Owner.new(owner_hash)
    return owner
  end

end
