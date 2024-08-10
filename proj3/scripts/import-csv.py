import boto3
import pandas as pd
from pymongo import MongoClient

# AWS S3 Configuration
s3_bucket = 's3-spark-bucket'
#s3_key ='s3://s3-spark-bucket/PS_20174392719_1491204439457_log.csv'
s3_key ='PS_20174392719_1491204439457_log.csv'


# MongoDB Configuration
mongo_uri = 'mongodb://localhost:27017/'
database_name = 'local'
collection_name = 'data' 

# Initialize S3 client
s3_client = boto3.client('s3',
    aws_access_key_id=my_your_access_key_id,
    aws_secret_access_key=my_aws_secret_access_key)

# Download the CSV file from S3
csv_file = '/tmp/tempfile.csv'  # Temporary file path
s3_client.download_file(s3_bucket, s3_key, csv_file)

# Read the CSV file into a pandas DataFrame
df = pd.read_csv(csv_file)

# Convert DataFrame to dictionary records
records = df.to_dict(orient='records')

# Connect to MongoDB
client = MongoClient(mongo_uri)
db = client[database_name]
collection = db[collection_name]

# Insert data into MongoDB
collection.insert_many(records)

# Close the MongoDB connection
client.close()

print("Data successfully inserted into MongoDB %s, collection %s" %database_name %collection_name)
print ("nombre de donnees de la collection %s :%s " %collection_name %db.data.countDocuments() ) 
