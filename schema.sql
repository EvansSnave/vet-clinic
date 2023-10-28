/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100) DEFAULT 'Unknown',
    date_of_birth date,
    escape_attempts int DEFAULT 0,
    neutered BOOLEAN,
    weight_kg decimal(5, 2)
);


ALTER TABLE
    animals
ADD
    species char(20);


CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name varchar(25) DEFAULT 'Unknown',
    age int
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name varchar(20)
);

ALTER TABLE animals
    ADD PRIMARY KEY (id);

ALTER TABLE animals
    DROP COLUMN species;

ALTER TABLE animals
    ADD species_id int;

ALTER TABLE animals
    ADD CONSTRAINT fk_animals_species
    FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
    ADD owners_id int;

ALTER TABLE animals
    ADD CONSTRAINT fk_animals_owners
    FOREIGN KEY (owners_id) REFERENCES owners(id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name varchar(100),
	age smallint,
    date_of_graduation date
);

CREATE TABLE specializations (
	species_id int,
	vets_id int
);

CREATE TABLE visits (
	animals_id int,
	vets_id int,
	visit_date date
);