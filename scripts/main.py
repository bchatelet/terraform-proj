from pyspark.sql import SparkSession
from pyspark.sql.functions import col

S3_DATA_SOURCE_PATH='s3://s3-spark-bucket/PS_20174392719_1491204439457_log.csv'
S3_DATA_OUTPUT_PATH='s3://s3-spark-bucket/data1/'

def main ():
    spark=SparkSession.builder.appName('DemoInsertCsvData').getOrCreate()
    all_data=spark.read.csv(S3_DATA_SOURCE_PATH,header=True)
    #Nomrbe total d'enregistrements
    print ('Nombre total de lignes %s' % all_data.count())
    #Nombre de paiements frauduleux
    selected_data=all_data.where ((col('type')=='PAYMENT')&(col('isFraud')=='1'))
    print ('Le nombre de paiement frauduleux est  %s' % selected_data.count())
     selected_data.write.mode('overwrite').parquet(S3_DATA_OUTPUT_PATH)
     pri
     nt ('les donnees ont été sauvegardees sur %s' % S3_DATA_OUTPUT_PATH )
    
    
    


if __name__=='__main__':
    main()
    


