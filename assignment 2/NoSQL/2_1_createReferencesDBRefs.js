// DBRefs
db.bank_accounts.updateOne(
    { $and: [{ first_name: "Blaire", last_name: "Kirgan" }] },
    {
        $set: {
            location: [
                {
                    // $ref points to the collection where the reference is stored.
                    "$ref": "locations",
                    // $id equals the id of the specific document containing the location.
                    "$id": ObjectId("605d01617d23388960777c8e")
                }]
        }
    })