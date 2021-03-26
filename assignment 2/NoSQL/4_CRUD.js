// CREATE
db.locations.insertOne
    (
        {
            country: "NO",
            address: "31 Spooner Street"
        }
    )

// READ
// Added pretty for better formatting of response.
db.locations.find
    (
        { address: "31 Spooner Street" }
    ).pretty()

// UPDATE
db.locations.updateOne
    (
        // Find document with address: "31 Spooner Street".
        { address: "31 Spooner Street" },
        // Update country to US.
        { $set: { "country": "US" } }
    )

// DELETE
db.locations.deleteOne({address: "31 Spooner Street"})