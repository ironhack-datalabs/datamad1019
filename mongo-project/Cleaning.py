import pandas as pd
from pymongo import MongoClient
import re
import numpy as np
from Functions.location import *
from Functions.money import moneyClean

client = MongoClient('mongodb://localhost:27017/')
db = client.companies

#### Here I make a Pymongo query to get just the companies with certain conditions ####

companies = db.companies.find({
    "offices": {
        "$not": {
            "$size": 0
        }
    }, "founded_year": {
        "$gte": 2007
    }
}, {"name": 1, "founded_year": 1, "offices": 1, "category_code": 1, "total_money_raised": 1, "deadpooled_year": 1, "number_of_employees": 1})

#### Create the dataframe ####

clean_companies = pd.DataFrame(companies)

#### Apply Location Function ####

geo_office = clean_companies[["offices"]].apply(
    getGeoLocation, result_type="expand", axis=1)

#### Join data to create Principal Office ####

df_clean = pd.concat([clean_companies, geo_office], axis=1)[
    ["principal_office"]]

#### Just Tech Business ####

clean_companies['geoDescription'] = df_clean

list_category = {'web': 'tech', 'software': 'tech',
                 'games_video': 'tech', 'advertising': 'tech', 'mobile': 'tech', 'ecommerce': 'tech', 'search': 'tech', 'network_hosting': 'tech', 'consulting': 'tech', 'hardware': 'tech', 'biotech': 'tech', 'cleantech': 'tech', 'analytics': 'tech', 'hardware': 'tech', 'photo_video': 'tech',
                 'messaging': 'tech', 'design': 'tech'}

clean_companies = clean_companies.replace(
    to_replace=list_category, inplace=False)

#### Removing Null Values ####

clean_companies['founded_year'] = clean_companies['founded_year'].dropna(
    axis=0).astype('int64', inplace=True)

#### Create Longitude and Latitude Columns ####

latitude = [d[0].get('latitude') for d in clean_companies.offices]
longitude = [d[0].get('longitude') for d in clean_companies.offices]

clean_companies['latitude'] = latitude
clean_companies['longitude'] = longitude

city = [d[0].get('city') for d in clean_companies.offices]
country = [d[0].get('country_code') for d in clean_companies.offices]

#### City and Country in two Columns ####

clean_companies['city'] = city
clean_companies['country'] = country

#### Deleting useless Columns ####


def dropcolumns(data, columns):
    data = data.drop(columns, axis=1)
    return data


clean_companies = dropcolumns(clean_companies, ['offices', '_id'])

#### Cleaning Deadpooleds ####
clean_companies = clean_companies[clean_companies['deadpooled_year'].isna()]

#### Apply function to clean some locations ####

clean_companies['city'] = clean_companies['city'].apply(cleanLocation)


#### Final Cleaning Columns ####

clean_companies.dropna(
    subset=['founded_year', 'latitude', 'longitude'], inplace=True)

clean_companies = dropcolumns(clean_companies, 'deadpooled_year')


#### Apply function to moneyClean ####


clean_companies['total_money_raised'] = clean_companies['total_money_raised'].apply(
    moneyClean)

#### Fill Null Values ####


def fillNaN(data, col):
    [data[col].fillna(0, inplace=True) for col in data.columns]
    return data


clean_companies = fillNaN(clean_companies, 'number_of_employees')

#### Just Business with employees and money raised ####

clean_companies = clean_companies[clean_companies['number_of_employees'] != 0.0]
clean_companies = clean_companies[clean_companies['total_money_raised'] != 0]

#### USA have the better values ####
clean_companies = clean_companies[clean_companies['country'] != 'USA']

clean_companies = clean_companies.reset_index(drop=True)

#### Json and Csv outputs ####

clean_companies.to_json(
    './Output/clean_companies_clean.json', orient='records')
clean_companies.to_csv('./Output/clean_companies_clean.csv', index=True)
