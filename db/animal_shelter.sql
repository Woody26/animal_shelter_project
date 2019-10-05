DROP TABLE IF EXISTS owner_records;
DROP TABLE IF EXISTS animal_records;

CREATE TABLE animal_records (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  age INT8,
  species VARCHAR(255),
  adoptable BOOLEAN,
  admission_date VARCHAR(255)
);

CREATE TABLE owner_records(
  id SERIAL8,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  pet_id INT8 REFERENCES animal_records(id)
);
