/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE (name = 'Agumon' OR name = 'Pikachu');
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 AND  weight_kg <= 17.3;

BEGIN;
UPDATE animals
    SET species = 'unespecified';
ROLLBACK;

BEGIN;
UPDATE animals
    SET species = 'digimon'
    WHERE name LIKE '%mon';
UPDATE animals
    SET species = 'pokemon'
    WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
    WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
    SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
    SET weight_kg = weight_kg * -1
    WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(id) AS animal_count FROM animals;

SELECT COUNT(animals.id) AS amount_of_animals_never_escaped
    FROM animals
    WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS avg_weigth_kg FROM animals;

SELECT neutered, MAX(escape_attempts) AS max_esc_attempts
    FROM animals
    GROUP BY neutered
    ORDER BY max_esc_attempts DESC;

SELECT 
    species,
    MIN(weight_kg) AS min_weight,
    MAX(weight_kg) AS max_weight
    FROM animals
    GROUP BY species;

SELECT 
    species,
    AVG(escape_attempts) AS avg_esc_attempts
    FROM animals
    WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
    GROUP BY species;

SELECT 
    owners.full_name AS owner, 
	STRING_AGG(animals.name, ', ') AS pokemons
    FROM owners
    JOIN animals ON owners_id = owners.id
    WHERE full_name = 'Melody Pond'
	GROUP BY owner;

SELECT animals.name AS pokemons
    FROM animals
    JOIN species ON species_id = species.id
    WHERE species.name = 'Pokemon';

SELECT 
    full_name AS owner, 
    STRING_AGG(animals.name, ', ') AS pokemons
    FROM owners
    LEFT JOIN animals ON owners.id = owners_id
    GROUP BY owners.full_name;

SELECT 
    species.name AS animal_type,
    COUNT(animals.species_id) AS amount
    FROM species
    JOIN animals ON species.id = species_id
    GROUP BY animal_type;

SELECT 
    owners.full_name AS owner,
    animals.name AS digimons
    FROM owners
    JOIN animals ON owners.id = owners_id
    JOIN species ON species.id = species_id
    WHERE owners.full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';

SELECT 
    animals.name AS Mr_Winchester_pets,
    animals.escape_attempts
    FROM animals
    JOIN owners ON owners_id = owners.id
    WHERE owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

SELECT 
    owners.full_name AS owners,
    COUNT(animals.owners_id) AS pets_amount
    FROM owners
    LEFT JOIN animals ON owners.id = owners_id
    GROUP BY owners
    ORDER BY pets_amount DESC;

SELECT 
    vets.name AS veterinarian, 
    animals.name AS patient, 
    visits.visit_date 
	FROM visits
	JOIN animals ON animals.id = animals_id
	JOIN vets ON vets.id = vets_id 
	WHERE vets.name = 'William Tatcher'
	GROUP BY vets.name, animals.name, visits.visit_date
	ORDER BY visit_date DESC
	LIMIT 1;

SELECT 
    vets.name AS veterinarian, 
    COUNT(animals.name) AS patient_amount
	FROM visits
	JOIN vets ON vets.id = vets_id
	JOIN animals ON animals.id = animals_id
	WHERE vets.name = 'Stephanie Mendez'
	GROUP BY vets.name;

SELECT 
    vets.name AS veterinarian,
	STRING_AGG(species.name, ', ') AS speciality
	FROM specializations
	RIGHT JOIN vets ON vets_id = vets.id
	LEFT JOIN species ON species.id = species_id
	GROUP BY vets.name
	ORDER BY vets.name;

SELECT 
    vets.name AS veterinarian, 
	animals.name AS patient,
	visits.visit_date
	FROM visits
	JOIN vets ON vets_id = vets.id
	JOIN animals ON animals_id = animals.id
	WHERE vets.name = 'Stephanie Mendez'
		AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT 
    animals.name AS patient,
	COUNT(visit_date) AS visit_amount 
	FROM visits
	JOIN animals ON animals_id = animals.id
	GROUP BY animals.name
	ORDER BY visit_amount DESC
	LIMIT 1;

SELECT 
    vets.name AS veterinarian,
	animals.name AS patient,
	visits.visit_date
	FROM visits
	JOIN vets ON vets_id = vets.id
	JOIN animals ON animals_id = animals.id
	WHERE vets.name = 'Maisy Smith'
	ORDER BY visit_date
	LIMIT 1;

select animals.name as patient_name, animals.date_of_birth as 
patient_birthdate, animals.escape_attempts, animals.neutered, 
animals.weight_kg, species.name as species, owners.full_name 
as patient_owner, vets.name as vet_name, vets.age as vet_age, 
vets.date_of_graduation as vet_grad_date, visits.visit_date from 
visits join animals on animals_id = animals.id join species on 
species_id = species.id join owners on owners_id = owners.id 
join vets on vets_id = vets.id order by visits.visit_date desc limit 1;

SELECT 
	vets.name AS veterinarian,
	species.name AS speciality,
	COUNT(visits.visit_date) AS visit_amount
	FROM visits, specializations
	RIGHT JOIN vets ON vets_id = vets.id
	LEFT JOIN species ON specializations.species_id = species.id
	WHERE vets.id NOT IN (
		SELECT specializations.vets_id FROM specializations
	)
		AND vets.id = visits.vets_id
	GROUP BY vets.name, species.name;

SELECT 	
	vets.name AS veterinarian,
	COUNT(CASE WHEN species.name = 'Pokemon' THEN 1 ELSE NULL END) AS pokemon_visit_amount,
	COUNT(CASE WHEN species.name = 'Digimon' THEN 1 ELSE NULL END) AS digimon_visit_amount
	FROM visits JOIN vets ON vets_id = vets.id JOIN animals ON animals_id = animals.id
	JOIN species ON species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name;
