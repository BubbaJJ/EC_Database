// Import bank accounts from local file
// Database "bank" is automatically created if it does not exist.
// Collection "bank_accounts" is automatically created if it does not exist
mongoimport --db bank --collection bank_accounts --file./ bank_accounts.json --jsonArray

// Select database bank
use bank

// Verify that bank account have been imported
db.bank_accounts.find().pretty()

// Create new collection for locations
db.createCollection("locations")

// Insert data into locations
db.locations.insertMany([
  {country: "SE", address: "Vimmerbygatan 20"},
  {country: "US", address: "Asteroid Road 5"},
  {country: "US", address: "Comet Road 41"},
  {country: "SE", address: "Brunnsgatan 7"}
])

// Verify that locations have been inserted
db.locations.find().pretty()

// DBRefs
db.bank_accounts.updateOne({$and: [{first_name: "Blaire", last_name: "Kirgan"}]},{$set: {location: [{"$ref":"locations", "$id":ObjectId("605d01617d23388960777c8e")}]}})

// Manual references
db.bank_accounts.updateOne({$and: [{first_name: "Faith", last_name: "Scoon"}]},{ $set: {location: [{country: "US"},{address:"Comet Road 41"}]}})
db.bank_accounts.updateOne({$and: [{first_name: "Jody", last_name: "Merrall"}]},{ $set: {location: [{country: "US"},{address:"Asteroid Road 5"}]}})
db.bank_accounts.updateOne({$and: [{first_name: "Farah", last_name: "Bollini"}]},{ $set: {location: [{country: "SE"},{address:"Vimmerbygatan 20"}]}})
db.bank_accounts.updateOne({$and: [{first_name: "Thorn", last_name: "Pitt"}]},{ $set: {location: [{country: "SE"},{address:"Brunnsgatan 7"}]}})

// CREATE
db.locations.insertOne({country: "NO", address:"31 Spooner Street"})

// READ
db.locations.find({address: "31 Spooner Street"}).pretty()

// UPDATE
db.locations.updateOne({address: "31 Spooner Street"},{$set: {"country": "US"}})

// DELETE
db.locations.deleteOne({address: "31 Spooner Street"})