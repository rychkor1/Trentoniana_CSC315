createdb proj7


psql proj 7


CREATE TABLE users (userID serial PRIMARY KEY, firstName varchar (30), lastName varchar (30), access varchar (30));


COPY users(userID,firstName, lastName, access)FROM '/home/lion/UserInfo.csv' DELIMITER ',' CSV HEADER;


SELECT * FROM users;


CREATE TABLE entries (entryNo Serial PRIMARY KEY, entryType varchar (60), entryName varchar, entryLink varchar, date DATE);


COPY entries(entryNo,entryType, entryName, entryLink, date)FROM '/home/lion/EntryInfo.csv' DELIMITER ','CSV HEADER;


SELECT * FROM entries;


DELETE FROM entries WHERE (entryNo = 1);


SELECT * FROM entries;


SELECT * FROM entries 
WHERE entrytype = ‘Audio’;


UPDATE users
SET lastname = 'Rychkova' 
WHERE lastname = 'Gill';


SELECT * FROM users;


INSERT INTO users
(firstname, lastname, access)
VALUES ('Sorca', 'MC', 'user');


SELECT * FROM users;


SELECT userID 
FROM users 
WHERE lastName = ‘Kiera’
AND firstName = ‘Gill’;
SELECT * FROM users;


SELECT access, userID 
FROM users 
WHERE lastName = ‘Roman’ 
AND firstName = ‘Rychkov’;


SELECT * FROM users;


UPDATE users 
SET access = superUser 
WHERE userID = 4;


SELECT * FROM users;


DELETE FROM users 
WHERE userID = 3;


SELECT * FROM users;


\s work.txt
