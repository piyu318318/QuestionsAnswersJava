from pyspark.sql import SparkSession
#C:\Users\dixit\PycharmProjects\pythonProgram\company_data.csv

spark = SparkSession.builder.appName("read data").getOrCreate()


rdd1 = spark.read.csv(r"C:\Users\dixit\PycharmProjects\pythonProgram\company_data.csv")
rdd2 = spark.read.csv(r"C:\Users\dixit\PycharmProjects\pythonProgram\employee_data.csv")

rdd1.show(3)
spark.stop()
