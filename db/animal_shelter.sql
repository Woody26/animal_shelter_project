DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owner;

CREATE TABLE owner(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  age INT8,
  species VARCHAR(255),
  adoptable BOOLEAN,
  admission_date VARCHAR(255),
  owner_id INT8 REFERENCES owner(id)
);
