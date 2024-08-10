import boto3
import pymongo
import json

def read_json_lines_from_s3(bucket_name, file_key):
    """
    Reads a JSON lines file from S3 and returns a list of Python objects.
    
    :param bucket_name: Name of the S3 bucket.
    :param file_key: S3 key (path) of the JSON file.
    :return: List of Python objects parsed from JSON lines.
    """
    s3 = boto3.client('s3')
    response = s3.get_object(Bucket=bucket_name, Key=file_key)
    data = response['Body'].read().decode('utf-8')
    
    # Split the file into lines and parse each line as a JSON object
    json_lines = [json.loads(line) for line in data.splitlines() if line.strip()]
    return json_lines

def write_to_mongodb(mongo_uri, database_name, collection_name, data):
    """
    Writes data to a MongoDB collection.
    
    :param mongo_uri: MongoDB URI connection string.
    :param database_name: Name of the MongoDB database.
    :param collection_name: Name of the MongoDB collection.
    :param data: Data to be inserted into MongoDB.
    """
    mongo_client = pymongo.MongoClient(mongo_uri)
    db = mongo_client[database_name]
    collection = db[collection_name]
    
    if isinstance(data, list):
        collection.insert_many(data)
    else:
        collection.insert_one(data)

def process_files_from_s3(bucket_name, prefix, mongo_uri, database_name, collection_name):
    """
    Processes multiple JSON files from an S3 bucket and imports them into MongoDB.
    
    :param bucket_name: Name of the S3 bucket.
    :param prefix: Prefix to filter files (e.g., folder path in the bucket).
    :param mongo_uri: MongoDB URI connection string.
    :param database_name: Name of the MongoDB database.
    :param collection_name: Name of the MongoDB collection.
    """
    s3 = boto3.client('s3')
    
    # List all files in the S3 bucket with the specified prefix
    response = s3.list_objects_v2(Bucket=bucket_name, Prefix=prefix)
    
    if 'Contents' not in response:
        print("No files found with prefix:", prefix)
        return
    
    files = response['Contents']
    for file in files:
        file_key = file['Key']
        if file_key.endswith('.json'):
            print(f"Processing file: {file_key}")
            json_data = read_json_lines_from_s3(bucket_name, file_key)
            write_to_mongodb(mongo_uri, database_name, collection_name, json_data)
            print(f"Finished processing file: {file_key}")


def main():
    # Configuration
    #bucket_name = 's3://s3-spark-bucket/data3/'
    bucket_name = 's3-spark-bucket'
    prefix = 'data3/'  # Adjust if needed to match your S3 folder structure
    mongo_uri = 'mongodb://glue_user:secure_password@localhost:27017/test'
    database_name = 'test'
    collection_name = 'collectionTest'
    
    # Process files from S3 and import to MongoDB
    process_files_from_s3(bucket_name, prefix, mongo_uri, database_name, collection_name)
    
    print("Data import completed!")

if __name__ == "__main__":
    main()

