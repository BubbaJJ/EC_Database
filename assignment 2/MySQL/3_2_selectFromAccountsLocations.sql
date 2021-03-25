-- Select statements using joins.
-- Will displays columns first_name and last_name from bank_accounts as well as country from locations.
-- accounts_locations is being used as the base for convenience.
SELECT b.first_name AS 'First name',
    b.last_name AS 'Last name',
    l.country AS Country
FROM accounts_locations al
    JOIN locations l ON l.id = al.location_id
    JOIN bank_accounts b ON b.id = al.account_id 
-- Looks for any row that has the country set to "SE".
WHERE country = 'SE' 

-- Will also work with bank_accounts as base table.
-- If done this way the joins has to be done in correct order.
SELECT first_name AS 'First name',
    last_name AS 'Last name',
    l.country AS Country
FROM bank_accounts b 
-- Joining accounts_locations first to enable joining locations.
    JOIN accounts_locations al ON b.id = al.account_id
    JOIN locations l ON al.location_id = l.id
WHERE country = 'SE';


-- Same as above, we can use locations as the base as long as we do the joins in the correct order.
SELECT b.first_name AS 'First name',
    b.last_name AS 'Last name',
    country AS Country
FROM locations l
    JOIN accounts_locations al ON al.location_id = l.id
    JOIN bank_accounts b ON b.id = al.account_id
WHERE country = 'SE'