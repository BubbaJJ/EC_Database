// Manual references, location is added to the document.
// Using $and operator to make sure both first_name and last_name matches the criteria.
db.bank_accounts.updateOne(
    { $and: [{ first_name: "Faith", last_name: "Scoon" }] },
    { $set: { location: [{ country: "US" }, { address: "Comet Road 41" }] } })

db.bank_accounts.updateOne(
    { $and: [{ first_name: "Jody", last_name: "Merrall" }] },
    { $set: { location: [{ country: "US" }, { address: "Asteroid Road 5" }] } })

db.bank_accounts.updateOne(
    { $and: [{ first_name: "Farah", last_name: "Bollini" }] },
    { $set: { location: [{ country: "SE" }, { address: "Vimmerbygatan 20" }] } })

db.bank_accounts.updateOne(
    { $and: [{ first_name: "Thorn", last_name: "Pitt" }] },
    { $set: { location: [{ country: "SE" }, { address: "Brunnsgatan 7" }] } })