
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
    a)innter join
    b)LeftOuter join
    c)rightOuter join
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
   
  14)
      
      
