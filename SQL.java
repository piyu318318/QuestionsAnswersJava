
1)diff between delete and truncate statement ?
->delete command: 
  delete command   is used to delete a row in a table.
  you can rollback the data after delete statement.
  It is DML command.
  It is slower than truncate.
  DELETE FROM table_name WHERE condition;
  
  truncate command:
  truncate  commmand  is used to delete all the row in the table.
  truncate command will delete all the rows in one go.
  you cannot rollback the data after truncate.
  It is a DDL Command.
  It is a faster than delete command.
  TRUNCATE TABLE tablename;

2) what are the different subsets of SQL?
   DDL->Data definition language. It is used  to define database schema. create,alter ,drop ,truncate.
   DML-Data manupilation language . It manupilates the data in the database. insert,update,delete.
   DCL->Data constrol language. This commands deals with the rightd,permission and other control.Grant,revoke.
   Tcl->Transaction control language. Includes commands which mainly deals with transaction of the database. commit,rollback,savepoint
   
3what is Data Management System ? what are its different types ?
 ->Database Management Systems (DBMS) are software systems used to store, retrieve, and run queries on data. A DBMS serves as an interface between an end-user 
   and a database. The data can be mdified and it can be any kind  of data example strings,numbers,images ect.
  types of dbms are  : 
1)hierarchical = it consiste of predecessor and successor types of a relationship.it has a structure like a tree.
2)Relationa: This type of database consist uses a structure  that allows to user to identify access data in databse.
3)newwork :newwork database management  system supports many to many relations where multiple  records can be linked.
4)Object oriented: Object oriented database management system uses small indivual softwares called objects . and each objects contains data and instructions 
for the actions to be  done with the data. 

  
  
  
  4)what do you mean by table and field in a sql ?
  -> a tables refers to a  collection of data in organized manner in forms of rows and columns. and field represents number of column in the tables.
  
    
   5)what are joins in sql ?
   ->join clause is used to define to combine rows from two or more tables based on related columns between them.
    It is used to merge two tables or retieve data from there.
    a)innter join = reutrn the those records which have matching values in both table.
    b)LeftOuter join = returns all the records which have match in  matching values in both table and all the values in left table.
    c)rightOuter join = returns all the records which have match in  matching values in both table and all the values in right table.
    d)Sekf join.  
    
 6)char and varchar?
 ->char stores character datatype.eg.'c'
 varchar can store string datatype. eg."234aksc"
    
    
7)what is primary key ?
-> A set  of attributes that can be used to uniquely identify every tuple is a primary key.
   
8)contraints ?
 ->SQL constraints are used to specify rules for the data in a table. Constraints are used to limit the type of data that can go into a table
 not null = ensures that null value cannot be stored in the table.
 unique = makes sure that all vallues in the table should be  unique.
 check = ensures that all values in a column satisfy a specific condition eg we dont want negative numbers in the table we apply check constraint. eg. in sal check sal<1
 default= constrains defines a set of default values for column when no value is specified. eg sal float(20) default 10000
 Primary key =
   
 9)Which is better MySQL or SQL?
In terms of data security, the SQL server is much more secure than the MySQL server. In SQL, external processes (like third-party apps) 
 cannot access or manipulate the data directly. While in MySQL, one can easily manipulate or modify the database files during run time using binaries
 
 10)what is unique key  and primary key diff ?
   unique key
   unique key identifies a single row in a table. 
   unique key can be many in one table. 
   null values are allowed 
   dublicate values are not allowed.
   
   primary key :
    primary key can identifies a single row in a table.
    unique key can be only one in one  table.
    Dont allow null values.
    dublicate values are not allowed.
      
 1!)what is foreign key ?
 -> foreign key maintains the referencial integrity by enforcing a link between data in two tables.
      fooreign key in child table references the primary key in the parent table.
 
 12)what is data intigrity ?
 -> defines the accuracy of data , consistency of data stored in databasse. it also defines the integrity constraints to enforce nusiness rule on data. 
   in short data integrity defines the accuracy and data consistancy of a data.
      
 13)what is the cluster and non cluster index in sql?
    -> 
      cluster index is used for easy retrieval of data from the database and it is faster.
      non - cluster index is used for easy retrieval of data from the database and it is slower.
      one table can have only one cluser index.
      one table can have many one non - cluser index.
   
14)write a query to display the current date?
        select getdate();

15)what is denormalization ?
  ->increases th performance of entire infrastructure as it inr=troduce redundancy into a table.
  adds retundatnt data into table by incoporating database queries and combine data from various tables into single table.
  
16)what are entities and relationships ?
->A person,place or thing in the real world about data can be stored in a database. Tables stores data that represents one type of entity.
relationships  or links between entities that have something  to do with each other.  

17)what is an index ? 
 ->index basically refers to performance tuning method.
  It allows faster retrieval of records from the table and creates an entry for each value.
  creating indexes :
  CREATE INDEX index_name
  ON table_name (column1, column2, ...);
  
  create unique index 
  CREATE UNIQUE INDEX index_name
  ON table_name (column1, column2, ...);
  
  we can also drop the indexes.
  DROP INDEX index_name ON table_name;
 
18)Explain diff types of index?
  index table we use when we have huge tables. to ease retrieval data we uses indexes.
  Unique index : Unique index is mainly used when you do not want any dublicate values to be present in the column.
  Cluster index : This index reorders the physical order of the table and searches based on the key values. each table can obly have one cluster index.
  Non clusterindex :  Non cluster index does not alter the physical order of the table and maintains the logical order of the table each table can have many non-cluster index.
    
19)what is normalization ?
    normalization is the process of organizing data to avoid dublication and retundancy.

20)diff betwn drop and truncate ?
    
   Drop :
    removes a table and it cannot be rolledback from the database. it drops the data in the table  as well as structure of table.
    DDL command
    Syntax : drop table tablename;
      
  Truncate :
  removes all rows and it cannot be rolledback from the database. 
   DDL command
   syntax :
   truncate tablename;


21)diff types of normalization.
  ->
  1)In 1NF we remove the multivalues attribute.Data must be atomic.
  2)In 2nf :  To be in second normal form, a relation must be in first normal form and relation must not contain any partial dependency. 
    A relation is in 2NF if it has No Partial Dependency, i.e., no non-prime attribute  is dependent on any proper subset of any candidate key of the table.
  3)3nf :A relation is in third normal form, if there is no transitive dependency for non-prime attributes as well as it is in second normal form.
    A relation is in 3NF if at least one of the following condition holds in every non-trivial function dependency X –> Y:
    If A->B and B->C are two FDs then A->C is called transitive dependency.
      
 22)Acid properties ?
  use link ->    https://www.geeksforgeeks.org/acid-properties-in-dbms/
  
  23)what is trigger,cursor ,functions ,views?
    do it from notebook.
      
  24)what are aggregate functions in sql ?
       MIN, MAX, COUNT, SUM, and AVG.
      
  25)what are the different operators avialable in SQL ?
    ->Arithmatic operators , bitwise operators , comparison operators, compound operators , Logical operators.
      
  26)Are NULL values same as that of zero or a  blank space ?
    ->NULL values represents a value which is unavailable,unknown , assigned or not applicable where as zero is a number and blank space is character.
  
   27)cross join and natural join difference ?
    ->
      cross join -> produces the cross product or cartesian product of two tables.
      natural join ->Based on all columns having same name and data types in both the tables.
      
    28)what is subquery in sql ?
      subquery is query inside another qiuery is called as subquery.
      there are two types of subquery 
      corrlated subquery and non-corrlated subquery.
      
      
     29)can u list the ways to get the count of records in a table?
      -> select * from table1;
        select count(*) from table1;
    
    30)write a sql query to find the names of employees that begin with 'A' ?
       select * from emp where ename like "A%";
    
    31)what is the need for group function in sql ? 
      avg,count,max,min,sum,variance are group functions.
      group functions need is group functions works on set of row and return one result per group.
      
     32)What is relationship and diff types ?
      ->Relations are entities that have something to do with each  other .
        Relationships are defined as connection between 2 tables in a database .
        Types of relationship 
        1)one to one :  One family lives in one house, and the house contains one family.
        2)one to many : 1 dept have many emp.
        3)Many to one : Many studets have one classroom.
        4)Many to Many : Many emp have many department.
          
     
    33)what is main difference bewn 'between' and 'in' operator ?
    ->between = used to display rows based on a range of values in a row.
          select * from emp where salary between 10000 and 30000.
    ->in : used to check for values contained in a specific set of values 
           select * from student where rollno in (2,12,20);
    
    34)what are clauses in sql ?
      

      
  
      


























