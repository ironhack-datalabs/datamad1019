def findNear(list_geo, radio_meters):
        geopoint = list_geo
        return list(db.data_companies_clean.find({
        "geoDescription": {
         "$near": {
             "$geometry": geopoint,
             "$maxDistance": radio_meters
         }
       }
    }
    )
    ) 