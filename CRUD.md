CRUD

Create  : Adds a new entry (or row / record) to the database
Retrieve: Returns an existing entry from the database
Update  : Modifies an existing entry
Delete  : Deletes an existing entry

Four basic functions of persistent storage (e.g. a database).

SQL ('Structured Query Language') is a standard language for interacting with a
database. In SQL, the commands correspond in the following way:-

Create    --> INSERT
Retrieve  --> SELECT
Update    --> UPDATE
Delete    --> DELETE

In DataMapper, we can use Ruby methods which correspond as follows

Create    --> Model.create ; Model.first_or_create
              instance = Model.new || .first_or_new
              instance.attributes = { }
              instance.save
Retrieve  --> Model.get(id), .first, .last etc.
Update    --> instance.update, instance.attributes = { }
Delete    --> instance.destroy
