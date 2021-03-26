// Import bank accounts from local file
// Database "bank" is automatically created if it does not exist.
// Collection "bank_accounts" is automatically created if it does not exist
mongoimport --db bank --collection bank_accounts --file./ bank_accounts.json --jsonArray