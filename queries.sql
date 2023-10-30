/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits WHERE vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners WHERE email = 'owner_18327@mail.com';
