INSERT INTO accounts_locations (account_id, location_id)
VALUES (
        -- Subquery being used to get id for a specific user being inserted
        (
            SELECT id
            FROM bank_accounts
            WHERE first_name = 'Corbin'
                AND last_name = 'Hauck'
        ),
        -- Subquery being used to get id for a specific location being inserted
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