What is the difference between Relational Databases, NoSQL and Flat File Databases?

1. Flat File Databases
Simplest structure
Everything all in one table - the file must be read in its entirety in the computer's memory.

Pros
----
Easy - doesn't require any specialist knowledge

Cons
----
SLOW
As the amount of data grows becomes difficult to manage and maintain
Duplicate records hard to spot


2. Relational Databases
A database structure where there are a number of tables.
Each table contains records, and these records may be linked between tables.

Pros
----
Information only needs to be entered once and can be reused in other tables - mistakes are less likely
Relatively easy to query; using UIDs
Duplication is avoided

Cons
----
Difficult to scale for the volume of data required by modern web applications (e.g. Twitter, Facebook)
Need knowledge of database structures to query
Where lots of different types of data are being dealt with, the programmer may have to convert non-relational data in order to make use of the relational database.


3. NoSQL Database

A database that is not a relational database. 'Not only SQL'
Meets 'eventual consistency'; no database schema.

Pros
----
Faster access to bigger sets of data
Don't need to know all of the parameters in advance
Can easily add more multiple servers / clusters

Cons
----
Harder to query because the data is less rigidly organised
Difficult to migrate since they are schema-less: an implicit schema may arise from code that uses the NoSQL database and assumes some relationship.
