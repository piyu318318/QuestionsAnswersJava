from pyspark.sql import *
from pyspark.sql.functions import *
from pyspark.sql.types import FloatType

# filter: Operates on both RDDs and DataFrames to filter data based on a condition.
# select: Works only with DataFrames to select specific columns.
# withColumn: Works only with DataFrames to add or modify a column.

#C:\Users\dixit\PycharmProjects\pythonProgram\company_data.csv

spark = SparkSession.builder.appName("read data").getOrCreate()


rdd1 = spark.read.option("Header", True).option("inferSchema",True).csv(r"C:\Users\dixit\PycharmProjects\pythonProgram\employee_data.csv")


#remove leading $ symbol from salary column
rdd1 = rdd1.withColumn("Salary", regexp_replace(col("Salary"), "[$]", ""))

rdd1.show(3)

#How can you check the schema of rdd1?
# rdd1.printSchema()

#How can you identify the data types of each column in rdd1?
# print(rdd1.dtypes)

#Filter employees hired after 2015:
# daterdd = rdd1.filter(year(col("Hire_Date") ) > 2015 )
# daterdd.show(3)


#Calculate average salary:
# avgSalaary = rdd1.select(avg(col("Salary")))
# avgSalaary.show(3)


#Write a PySpark command to filter out employees who work in the "HR" department.
# HRdeptDEtails = rdd1.filter(rdd1["Department"] == "HR")
# HRdeptDEtails.show(3)


#How can you select only the Employee_ID, First_Name, and Position columns from rdd1?
# fisrtdetails = rdd1.select("Employee_ID","First_Name","Position")
# fisrtdetails.show(2)

#How do you rename the columns
# renamedColumnRdd = rdd1.withColumnRenamed("First_Name", "fname").withColumnRenamed("Last_Name", "lName")
# renamedColumnRdd.show(3)


#How would you sort rdd1 by the salary  in ascending order?
# sortedRddBySalary = rdd1.orderBy("Salary", descending=True)
#sortedRddBySalary.show()


#Write a command to get the top 5 highest-paid employees based on the Salary column.
# descendingSortedBySalary = rdd1.orderBy("Salary", descending = True).limit(5)
# descendingSortedBySalary.show(3)

#frind the highest salary from each department
# maxSalaryByDept = rdd1.groupby("Department").max()
# maxSalaryByDept.show()


#How can you group employees by their Department and count the number of employees in each department?
# departMentCount = rdd1.groupby("Department").count()
# departMentCount.show()

# How would you calculate the average salary for each Country?
# avgSalaryPerCounty = rdd1.groupBy("Country").agg(avg("Salary"))
# avgSalaryPerCounty.show(2)


#How would you remove duplicate rows in rdd1?
# dropduplicatesRDD = rdd1.dropDuplicates()
# dropduplicatesRDD.show(2)

# how to get the number of partitions in a PySpark DataFrame ==> you can use the rdd.getNumPartitions() method
# numpartitions = rdd1.rdd.getNumPartitions()
# print(numpartitions)

#To cache an RDD in PySpark, you can use the cache() method. This will store the RDD in memory, which allows for faster access if the RDD is reused multiple times in your operations.
# rdd1.cache()





