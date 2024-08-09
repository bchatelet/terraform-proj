from pyspark.context import SparkContext
from pyspark.sql import SparkSession
from pyspark.sql.functions import col

# Initialize Spark Context and Spark Session

# Initialize Spark Session
spark = SparkSession.builder.appName("GlueJob").getOrCreate()

# Read data from Glue Data Catalog directly using the database and table name
df = spark.read.table("`insert-mongodb`.data2")

# Perform any necessary transformations
# Uncomment and customize the transformation as needed
# df_transformed = df.withColumnRenamed("old_column_name", "new_column_name")

# If no transformation is needed, just use df
df_transformed = df  # Or apply transformations as needed
#df.show(5)
# Write transformed data to a temporary S3 location in JSON format
df_transformed.write.format("json").mode("overwrite").save("s3://s3-spark-bucket/data3/")