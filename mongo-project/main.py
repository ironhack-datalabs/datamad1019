from pymongo import MongoClient


def connectCollection(database, collection):
    client = MongoClient()
    db = client[database]
    coll = db[collection]
    return db, coll

db, coll = connectCollection('datamad1019','restaurants')

rest = list(coll.find({'name':"Wendy'S"}))

print(rest)