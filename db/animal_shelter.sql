DROP TABLE IF EXISTS owner_records;
DROP TABLE IF EXISTS animal_records;

CREATE TABLE animal_records (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  age INT8,
  species VARCHAR(255),
  adoptable BOOLEAN,
  admission_date VARCHAR(255)
  owner_id INT8 REFERENCES owner_records(id)
);

CREATE TABLE owner_records(
  id SERIAL8,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
);
