import pandas as pd
from pymongo import MongoClient
import re
import numpy as np
import sys
sys.path.insert(1, '/home/julio/IRONHACK/datamad1019/mongo-project/Functions')
import functions


client = MongoClient('mongodb://localhost:27017/')
db = client.companies

companies = db.companies.find({
    "offices": {
        "$not": {
            "$size": 0
        }
    }, "founded_year": {
        "$gte": 2007
    }
}, {"name": 1, "founded_year": 1, "offices": 1, "category_code": 1, "total_money_raised": 1, "deadpooled_year": 1, "number_of_employees": 1})

data_companies = pd.DataFrame(companies)


geo_office = data_companies[["offices"]].apply(
    getGeoLocation, result_type="expand", axis=1)  # Aplico la función

df_clean = pd.concat([data_companies, geo_office], axis=1)[
    ["principal_office"]]

data_companies['geoDescription'] = df_clean  # Creo la columna


data_companies['category_code'].value_counts()

list_category = {'web': 'tech', 'software': 'tech',
                 'games_video': 'tech', 'advertising': 'tech', 'mobile': 'tech', 'ecommerce': 'tech', 'search': 'tech', 'network_hosting': 'tech', 'consulting': 'tech', 'hardware': 'tech', 'biotech': 'tech', 'cleantech': 'tech', 'analytics': 'tech', 'hardware': 'tech', 'photo_video': 'tech',
                 'messaging': 'tech', 'design': 'tech'}

data_companies = data_companies.replace(
    to_replace=list_category, inplace=False)

# Reemplazo las categorías para quedarme con la categoría de tech en los casos de arriba y el resto mantenerlas como son

data_companies['founded_year'] = data_companies['founded_year'].dropna(
    axis=0).astype('int64', inplace=True)

latitude = [d[0].get('latitude') for d in data_companies.offices]
longitude = [d[0].get('longitude') for d in data_companies.offices]

data_companies['latitude'] = latitude
data_companies['longitude'] = longitude

# creo columnas de latitud y longitud por separado

city = [d[0].get('city') for d in data_companies.offices]
country = [d[0].get('country_code') for d in data_companies.offices]

# seleciono la ciuidad y el código de país para crear dos columnas

data_companies['city'] = city
data_companies['country'] = country


def dropcolumns(data, columns):
    data = data.drop(columns, axis=1)
    return data


# Borro las columnas de office y _id porque no las necesito
data_companies = dropcolumns(data_companies, ['offices', '_id'])

data_companies = data_companies[data_companies['deadpooled_year'].isna()]
# Me quedo los que deadpooled_year sean nulos para eliminar las empresas que ya no tengan actividad


data_companies['city'] = data_companies['city'].apply(cleanLocation)

# Limpio las localizaciones para terminar de unificarlas

data_companies.dropna(
    subset=['founded_year', 'latitude', 'longitude'], inplace=True)

# Elimino nulos de estas columnas porque no me sirven empresas que no sepamos el año de fundación
# ni la latitud o longitud

data_companies = dropcolumns(data_companies, 'deadpooled_year')

# Ya me quedé con las empresas que tienen actividad, así que no necesito más la columna

# Función para unificar las monedas y su valor en miles, millones o billions


data_companies['total_money_raised'] = data_companies['total_money_raised'].apply(
    moneyRaise)

# Rellenar los nulos en la columna de empleados


def fillNaN(data, col):
    [data[col].fillna(0, inplace=True) for col in data.columns]
    return data


data_companies = fillNaN(data_companies, 'number_of_employees')

data_companies = data_companies[data_companies['number_of_employees'] != 0.0]
data_companies = data_companies[data_companies['total_money_raised'] != 0]

# Quiero empresas que tengan al menos un empleado o algún tipo de ingresos

data_companies = data_companies[data_companies['country'] != 'USA']

# Me quedo con las empresas que no sean de USA porque no va a formar parte finalmente del grupo de empresas que
# me interesan

data_companies = data_companies.reset_index(drop=True)

data_companies.to_json('./data_companies_clean.json', orient='records')
