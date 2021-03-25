-- CREATE
INSERT INTO locations (country, address)
VALUES ('NO', '31 Spooner Street');


-- READ
SELECT *
FROM locations


SELECT *
FROM locations
WHERE country = 'US';


-- UPDATE
UPDATE locations
SET country = 'US'
WHERE address = '31 Spooner Street';


-- DELETE
DELETE FROM locations
WHERE country = 'US' AND
WHERE address = '31 Spooner Street';