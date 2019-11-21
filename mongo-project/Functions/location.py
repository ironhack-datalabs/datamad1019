import re

def getGeoLocation(data):   #Selecciono los elementos que necesito para hacer el geoindex después
    data = data['offices']
    principal = None
    if data[0]['latitude'] and data[0]['longitude']:
        principal = {
            "type":"Point",
            "coordinates":[data[0]['longitude'], data[0]['latitude']]
        }

    return {
        "lat": data[0]['latitude'],
        "lng": data[0]['longitude'],
        "principal_office": principal
    }


def cleanLocation(location):
    location = str(location)
    if (re.search('[Ll]os [Aa]ngeles', location)):
        return 'Los Angeles'
    elif (re.search('IRVINGTON', location)):
          return 'Irvington'
    else:
        return location
