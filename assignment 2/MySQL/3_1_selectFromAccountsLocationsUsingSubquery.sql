-- Select using subquerys
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