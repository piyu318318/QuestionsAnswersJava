#merege the 2 rdds in pyspark

from pyspark.sql  import SparkSession

spark = SparkSession.builder.appName("read data").getOrCreate()

rdd1 = spark.read.option("Header", True).csv(r"C:\Users\dixit\PycharmProjects\pythonProgram\employee_data.csv")

rdd2 = spark.read.option("Header", True).csv(r"C:\Users\dixit\PycharmProjects\pythonProgram\company_data.csv")


mergedrdd = rdd1.union(rdd2)

mergedrdd.show(2)

spark.stop()
