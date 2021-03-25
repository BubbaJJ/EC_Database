CREATE TABLE accounts_locations (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    account_id INT FOREIGN KEY REFERENCES bank_accounts(id),
    location_id INT FOREIGN KEY REFERENCES locations(id)
);