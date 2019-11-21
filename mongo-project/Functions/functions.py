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


def moneyRaise(value):
    dicc_coin = {'CAD': 1.3124497992,'RUB': 63.7561301828, 'EUR': 0.8916629514, 'GBP': 0.7991529202}
    values_money = {'K':1000, 'M':1000000, 'B': 100000000000}
    value_number = float(re.search('[+-]?([0-9]*[.])?[0-9]+', value)[0])
    if value.endswith('B'):
        exchange = value_number*(values_money['B'])
    elif value.endswith('K[k]'):
        exchange = value_number*(values_money['K'])
    elif value.endswith('M'):
        exchange = value_number*(values_money['M'])
    elif value.startswith("C"):
        exchange =  value_number*(dicc_coin['CAD'])
    elif value.startswith("$"):
        exchange =  value_number
    elif value.startswith("€"):
        exchange = value_number*(dicc_coin['EUR'])
    elif value.startswith("£"):
        exchange = value_number*(dicc_coin['GBP'])
    elif value.startswith("r"):
        exchange = value_number*(dicc_coin['RUB'])
    else:
        exchange = value_number
    return int(exchange)

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
