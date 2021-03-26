CREATE DATABASE EC_Utb_assignment2;


USE EC_Utb_assignment2;


CREATE TABLE bank_accounts (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    holding INT
);


-- List of bank accounts reduced from 1000
INSERT INTO bank_accounts (id, first_name, last_name, holding)
values (1, 'Grete', 'Gulliver', 463797);
INSERT INTO bank_accounts (id, first_name, last_name, holding)
values (2, 'Reese', 'Mulvy', 41857);
INSERT INTO bank_accounts (id, first_name, last_name, holding)
values (3, 'Zedekiah', 'Perri', 466433);
INSERT INTO bank_accounts (id, first_name, last_name, holding)
values (4, 'Leonardo', 'Hawke', 388651);
INSERT INTO bank_accounts (id, first_name, last_name, holding)
values (5, 'Odell', 'Goney', 38777);
INSERT INTO bank_accounts (id, first_name, last_name, holding)
values (6, 'Onida', 'Atwater', 321705);
INSERT INTO bank_accounts (id, first_name, last_name, holding)
values (7, 'Corbin', 'Hauck', 449092);
INSERT INTO bank_accounts (id, first_name, last_name, holding)
values (8, 'Vanya', 'Worsell', 330641);
INSERT INTO bank_accounts (id, first_name, last_name, holding)
values (9, 'Ingunna', 'Castellucci', 471372);
INSERT INTO bank_accounts (id, first_name, last_name, holding)
values (10, 'Eldon', 'McCartan', 75096);


CREATE TABLE locations (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    country VARCHAR(5),
    address VARCHAR(50),
);


INSERT INTO locations (country, address)
VALUES ('SE', 'Vimmerbygatan 20'),
    ('US', 'Asteroid Road 5'),
    ('US', 'Comet Road 41'),
    ('SE', 'Brunnsgatan 7');


CREATE TABLE accounts_locations (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    account_id INT FOREIGN KEY REFERENCES bank_accounts(id),
    location_id INT FOREIGN KEY REFERENCES locations(id)
);


INSERT INTO accounts_locations (account_id, location_id)
VALUES (
        (
            SELECT id
            FROM bank_accounts
            WHERE first_name = 'Corbin'
                AND last_name = 'Hauck'
        ),
        (
            SELECT id
            FROM locations
            WHERE address = 'Brunnsgatan 7'
        )
    ),
    (
        (
            SELECT id
            FROM bank_accounts
            WHERE first_name = 'Vanya'
                AND last_name = 'Worsell'
        ),
        (
            SELECT id
            FROM locations
            WHERE address = 'Asteroid Road 5'
        )
    ),
    (
        (
            SELECT id
            FROM bank_accounts
            WHERE first_name = 'Eldon'
                AND last_name = 'McCartan'
        ),
        (
            SELECT id
            FROM locations
            WHERE address = 'Vimmerbygatan 20'
        )
    ),
    (
        (
            SELECT id
            FROM bank_accounts
            WHERE first_name = 'Ingunna'
                AND last_name = 'Castellucci'
        ),
        (
            SELECT id
            FROM locations
            WHERE address = 'Comet Road 41'
        )
    );


SELECT id,
    first_name AS 'First name',
    last_name AS 'Last name'
FROM bank_accounts
WHERE id IN (
        SELECT account_id
        FROM accounts_locations
        WHERE location_id IN (
                SELECT id
                FROM locations
                WHERE country = 'SE'
            )
    );


SELECT b.first_name AS 'First name',
    b.last_name AS 'Last name',
    l.country AS Country
FROM accounts_locations al
    JOIN locations l ON l.id = al.location_id
    JOIN bank_accounts b ON b.id = al.account_id
WHERE country = 'SE' 


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