from pymongo import MongoClient

def get_mongo_client():
    return MongoClient("mongodb+srv://<username>:<password>@cluster0.mongodb.net/?retryWrites=true&w=majority")

def get_database():
    client = get_mongo_client()
    return client["tollmateai"]

