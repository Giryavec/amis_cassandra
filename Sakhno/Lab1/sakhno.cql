//Task:
//1. Create keyspace sakhno with replication_factor equal to 1.
//2. Change replication factor to 2.
//3. Create ERD according to task "Books are bought by Users". Each entity should have three attributes, except primary key.
//4. Create table, according to ERD without STATIC.
//5. Insert some data.
//6. Update some record.
//7. Drop table.
//8. Create table, according to ERD with STATIC.
//9. Insert some data.
//10. Update some record.
//11. Drop table and keyspace.


CREATE KEYSPACE IF NOT EXISTS sakhno
	WITH replication = {
	'class': 'SimpleStrategy',
	'replication_factor': 1
};


ALTER KEYSPACE sakhno
WITH replication = {
	'class': 'SimpleStrategy',
	'replication_factor': 2
};

USE sakhno;
CREATE TABLE IF NOT EXISTS bookUser(
	book_id int,
	book_name text,
	date_of_sell date,
	price float,
	user_id int,
	user_name text,
	user_email text,
	user_bd date,
	PRIMARY KEY ((book_id, date_of_sell), user_id)
);

INSERT INTO sakhno.bookUser (book_id, book_name, date_of_sell, price, user_id, user_name, user_email, user_bd)
VALUES (1, 'my favorite book1', '2017-10-13', 20, 1, 'Anya', 'sakhno@gmail.com', '1994-01-01');

INSERT INTO sakhno.bookUser (book_id, book_name, date_of_sell, price, user_id, user_name, user_email, user_bd)
VALUES (2, 'my favorite book2', '2017-10-14', 20, 2, 'Anya2', 'sakhno2@gmail.com', '1994-01-02');

INSERT INTO sakhno.bookUser (book_id, book_name, date_of_sell, price, user_id, user_name, user_email, user_bd)
VALUES (3, 'my favorite book3', '2017-10-15', 20, 3, 'Anya3', 'sakhno3@gmail.com', '1994-01-03');

SELECT * FROM sakhno.bookUser;

UPDATE sakhno.bookUser
SET book_name = 'my favorite film'
WHERE book_id = 1 AND date_of_sell='2017-10-13' AND user_id=1;

SELECT * FROM sakhno.bookUser;

DROP TABLE IF EXISTS bookUser;

CREATE TABLE IF NOT EXISTS bookUser(
	book_id int,
	book_name text STATIC,
	date_of_sell date,
	price float,
	user_id int,
	user_name text STATIC,
	user_email text,
	user_bd date STATIC,
	PRIMARY KEY ((book_id, date_of_sell), user_id)
);

INSERT INTO sakhno.bookUser (book_id, book_name, date_of_sell, price, user_id, user_name, user_email, user_bd)
VALUES (1, 'my favorite book1', '2017-10-13', 20, 1, 'Anya', 'sakhno@gmail.com', '1994-01-01');

INSERT INTO sakhno.bookUser (book_id, book_name, date_of_sell, price, user_id, user_name, user_email, user_bd)
VALUES (2, 'my favorite book2', '2017-10-14', 20, 2, 'Anya2', 'sakhno2@gmail.com', '1994-01-02');

INSERT INTO sakhno.bookUser (book_id, book_name, date_of_sell, price, user_id, user_name, user_email, user_bd)
VALUES (3, 'my favorite book3', '2017-10-15', 20, 3, 'Anya3', 'sakhno3@gmail.com', '1994-01-03');

SELECT * FROM sakhno.bookUser;

UPDATE sakhno.bookUser
SET book_name = 'my favorite film',
	price = 19
WHERE book_id = 1 AND date_of_sell='2017-10-13' AND user_id=1;

SELECT * FROM sakhno.bookUser;

DROP TABLE IF EXISTS bookUser;
DROP KEYSPACE IF EXISTS sakhno;
