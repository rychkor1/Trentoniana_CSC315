\h CREATE INDEX
CREATE TABLE countries(country_code char(2) PRIMARY KEY, country_name text UNIQUE);
INSERT INTO countries (country_code, country_name) VALUES ('us', 'United States'), ('mx', 'Mexico'), ('au', 'Australia'), ('gb', 'United Kingdom'), ('de', 'Germany'), ('ll', 'Loompaland');
INSERT INTO countries VALUES ('uk', 'United Kingdom');
SELECT * FROM countries;
DELETE FROM countries WHERE country_code = '11';
CREATE TABLE cities (name text NOT NULL, postal_code varchar(9) CHECK (postal_code <> ''), country_code char(2) REFERENCES countries, PRIMARY KEY (country_code, postal_code));
INSERT INTO cities VALUES ('Toronto', 'M4C1B5', 'ca');
INSERT INTO cities VALUES ('Portland', '87200', 'us');
UPDATE cities SET postal_code = '97206' WHERE name = 'Portland';
SELECT cities.*, country_name FROM cities INNER JOIN countries /* or just FROM cities JOIN countries */ ON cities.country_code = countries.country_code;
CREATE TABLE venues (venue_id SERIAL PRIMARY KEY, name carchar(255), street_address text, type char(7) CHECK ( type in ('public', 'private') ) DEFAULT 'public', postal_code varchar(9), country_code char(2), FOREIGN KEY (country_code, postal_code) REFERENCES cities (country_code, postal_code) MATCH FULL);
CREATE TABLE venues (venue_id SERIAL PRIMARY KEY, name varchar(255), street_address text, type char(7) CHECK ( type in ('public', 'private') ) DEFAULT 'public', postal_code varchar(9), country_code char(2), FOREIGN KEY (country_code, postal_code) REFERENCES cities (country_code, postal_code) MATCH FULL
INSERT INTO venues (name, postal_code, country_code) VALUES ('Crystal Ballroom', '97206', 'us');
SELECT v.venue_id, v.name, c.name FROM venues v INNER JOIN cities c ON v.postal_code=c.postal_code AND v.country_code=c.country_code;
;
\q
\h CREATE INDEX
archar(255), street_address text, type char(7) CHECK ( type in ('public', 'private') ) DEFAULT 'public', postal_code varchar(9), country_code char(2), FOREIGN KEY (country_code, postal_code) REFERENCES cities (country_code, postal_code) MATCH FULL)CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC\q
\h CREATE INDEX
CREATE TABLE countries (country_code char(2) PRIMARY KEY,country_name text UNIQUE);
INSERT INTO countries (country_code, country_name)VALUES ('us','United States'), ('mx','Mexico'), ('au','Australia'),('gb','United Kingdom'), ('de','Germany'), ('ll','Loompaland');
INSERT INTO countries VALUES ('uk','United Kingdom');
SELECT * FROM countries;
DELETE FROM countries WHERE country_code = 'll';
CREATE TABLE cities (name text NOT NULL,postal_code varchar(9) CHECK (postal_code <> ''),country_code char(2) REFERENCES countries,PRIMARY KEY (country_code, postal_code));
INSERT INTO cities VALUES ('Toronto','M4C1B5','ca');
INSERT INTO cities VALUES ('Portland','87200','us');
UPDATE cities SET postal_code = '97206' WHERE name = 'Portland';
SELECT cities.*, country_name FROM cities INNER JOIN countries /* or just FROM cities JOIN countries */ ON cities.country_code = countries.country_code;
CREATE TABLE venues (venue_id SERIAL PRIMARY KEY,name varchar(255),street_address text,type char(7) CHECK ( type in ('public','private') ) DEFAULT 'public',postal_code varchar(9),country_code char(2),FOREIGN KEY (country_code, postal_code) REFERENCES cities (country_code, postal_code) MATCH FULL);
INSERT INTO venues (name, postal_code, country_code) VALUES ('Crystal Ballroom', '97206', 'us');
SELECT v.venue_id, v.name, c.name FROM venues v INNER JOIN cities c ON v.postal_code=c.postal_code AND v.country_code=c.country_code;
INSERT INTO venues (name, postal_code, country_code) VALUES ('Voodoo Doughnut', '97206', 'us') RETURNING venue_id;
CREATE TABLE events (
  event_id SERIAL PRIMARY KEY,
  title text,
  starts timestamp,
  ends timestamp,
  venue_id integer,
  FOREIGN KEY (venue_id)
    REFERENCES venues (venue_id)
);
CREATE TABLE events (event_id SERIAL PRIMARY KEY, title text, starts timestamp, ends timestamp, venue_id integer, FOREIGN KEY (venue_id) REFERENCES venues (venue_id), event_id integer);
CREATE TABLE events (event_id SERIAL PRIMARY KEY, title text, starts timestamp, ends timestamp, venue_id integer, FOREIGN KEY (venue_id) REFERENCES venues (venue_id);
\q
INSERT INTO events (title, starts, ends, venue_id)VALUES ('Moby', '2018-02-06 21:00', '2018-02-06 23:00', (SELECT venue_id FROM venues WHERE name = 'Crystal Ballroom'));
INSERT INTO events (title, starts, ends, venue_id)VALUES ('Wedding', '2018-02-26 21:00', '2018-02-26 23:00', (SELECT venue_id FROM venues WHERE name = 'Voodoo Doughnut'));
INSERT INTO events (title, starts, ends, venue_id)VALUES ('Dinner with Mom', '2018-02-26 18:00', '2018-02-26 20:30', (SELECT venue_id FROM venues WHERE name = ''));
SELECT count(title) FROM events WHERE title LIKE '%Day%';
SELECT min(starts), max(ends) FROM events INNER JOIN venues ON events.venue_id = venues.venue_id WHERE venues.name = 'Crystal Ballroom';
SELECT count(*) FROM events WHERE venue_id = 1;
SELECT count(*) FROM events WHERE venue_id = 2;
SELECT count(*) FROM events WHERE venue_id = 3;
SELECT count(*) FROM events WHERE venue_id IS NULL;
SELECT venue_id, count(*) FROM events GROUP BY venue_id;
SELECT venue_id FROM events GROUP BY venue_id HAVING count(*) >= 2 AND venue_id IS NOT NULL;
SELECT venue_id FROM events GROUP BY venue_id;
SELECT DISTINCT venue_id FROM events;
SELECT title, venue_id, count(*) FROM events GROUP BY venue_id;
ELECT title, count(*) OVER (PARTITION BY venue_id) FROM events;
SELECT title, count(*) OVER (PARTITION BY venue_id) FROM events;
BEGIN TRANSACTION;
DELETE FROM events;
ROLLBACK;
SELECT * FROM events;
BEGIN TRANSACTION;
UPDATE account SET total=total+5000.0 WHERE account_id=1337;
CREATE OR REPLACE FUNCTION add_event(title text, starts timestamp, ends 
\q
INSERT INTO events (title, starts, ends, venue_id) VALUES ('Moby', '2018-02-06 21:00', '2018-02-06 23:00', (SELECT venue_id FROM venues WHERE name = 'Crystal Ballroom'));
INSERT INTO events (title, starts, ends, venue_id)VALUES ('Wedding', '2018-02-26 21:00', '2018-02-26 23:00', (SELECT venue_idFROM venuesWHERE name = 'Voodoo Doughnut'))iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii/q;
INSERT INTO events (title, starts, ends, venue_id) VALUES ('Wedding', '2018-02-26 21:00', '2018-02-26 23:00', (SELECT venue_id FROM venues WHERE name = 'Voodoo Doughnut'));
INSERT INTO events (title, starts, ends, venue_id) VALUES ('Dinner with Mom', '2018-02-26 18:00', '2018-02-26 20:30', (SELECT venue_id FROM venues WHERE name = 'My Place'));
INSERT INTO events (title, starts, ends, venue_id) VALUES ('Valentine''s Day', '2018-02-14 00:00', '2018-02-14 23:59', (SELECT venue_id FROM venues WHERE name = ''));
SELECT count(title) FROM events WHERE title LIKE '%Day%';
SELECT min(starts), max(ends) FROM events INNER JOIN venues ON events.venue_id = venues.venue_id WHERE venues.name = 'Crystal Ballroom';
SELECT count(*) FROM events WHERE venue_id = 1;
SELECT count(*) FROM events WHERE venue_id = 2;
SELECT count(*) FROM events WHERE venue_id = 3;
SELECT count(*) FROM events WHERE venue_id IS NULL;
SELECT venue_id, count(*) FROM events GROUP BY venue_id;
SELECT venue_id FROM events GROUP BY venue_id HAVING count(*) >= 2 AND venue_id IS NOT NULL;
SELECT venue_id FROM events GROUP BY venue_id;
SELECT DISTINCT venue_id FROM events;
SELECT title, venue_id, count(*) FROM events GROUP BY venue_id;
SELECT title, count(*) OVER (PARTITION BY venue_id) FROM events;
BEGIN TRANSACTION;
DELETE FROM events;
ROLLBACK;
SELECT * FROM events;
INSERT INTO events (title, starts, ends, venue_id) VALUES ('Moby', '2018-02-06 21:00', '2018-02-06 23:00', (SELECT venue_id FROM venues WHERE name = 'Crystal Ballroom'));
INSERT INTO events (title, starts, ends, venue_id) VALUES ('Wedding', '2018-02-26 21:00', '2018-02-26 23:00', (SELECT venue_idF ROM venues WHERE name = 'Voodoo Doughnut'));
INSERT INTO events (title, starts, ends, venue_id) VALUES ('Wedding', '2018-02-26 21:00', '2018-02-26 23:00', (SELECT venue_id FROM venues WHERE name = 'Voodoo Doughnut'));
INSERT INTO events (title, starts, ends, venue_id) VALUES ('Dinner with Mom', '2018-02-26 18:00', '2018-02-26 20:30', (SELECT venue_id FROM venues WHERE name = 'My Place'));
INSERT INTO events (title, starts, ends, venue_id) VALUES ('Valentine''s Day', '2018-02-14 00:00', '2018-02-14 23:59', (SELECT venue_id FROM venues WHERE name = ''));
SELECT count(title) FROM events WHERE title LIKE '%Day%';
SELECT min(starts), max(ends)FROM events INNER JOIN venues ON events.venue_id = venues.venue_id WHERE venues.name = 'Crystal Ballroom';
SELECT count(*) FROM events WHERE venue_id = 1;
SELECT count(*) FROM events WHERE venue_id = 2;
SELECT count(*) FROM events WHERE venue_id = 3;
SELECT count(*) FROM events WHERE venue_id IS NULL;
SELECT venue_id, count(*)FROM events GROUP BY venue_id;
SELECT venue_id FROM events GROUP BY venue_id HAVING count(*) >= 2 AND venue_id IS NOT NULL;
SELECT venue_id FROM events GROUP BY venue_id;
SELECT DISTINCT venue_id FROM events;
SELECT title, venue_id, count(*)FROM events GROUP BY venue_id;
SELECT title, count(*) OVER (PARTITION BY venue_id) FROM events;
BEGIN TRANSACTION;
DELETE FROM eventsl
BEGIN TRANSACTION;
DELETE FROM events;
BEGIN TRANSACTION;
/q
\
\q
BEGIN TRANSACTION;
DELETE FROM events;
ROLLBACK;
SELECT * FROM events;
\i add_event.sql
\i add_event.sql
SELECT add_event('House Party', '2018-05-03 23:00', '2018-05-04 02:00', 'Run''s House', '97206', 'us');
createlang 7dbs --list
CREATE TABLE logs (event_id integer, old_title varchar(255), old_starts timestamp, old_ends timestamp, logged_at timestamp DEFAULT current_timestamp);
\q
create extension "tablefunc";
create extension "dict_xsyn";
create extension "fuzzystrmatch";
create extension "pg_trgm";
create extension "cube";
\q
SELECT '1'::cube;
\q
SELECT '1'::cube;
\q
\i create_movies.sql
SELECT title FROM movies WHERE title ILIKE 'stardust%';
SELECT title FROM movies WHERE title ILIKE 'stardust_%';
\i movies_data.sql
SELECT title FROM movies WHERE title ILIKE 'stardust%';
SELECT title FROM movies WHERE title ILIKE 'stardust%';
SELECT title FROM movies WHERE title ILIKE 'stardust_%';
SELECT COUNT(*) FROM movies WHERE title !~* '^the.*';
CREATE INDEX movies_title_pattern ON movies (lower(title) text_pattern_ops);
SELECT levenshtein('bat', 'fads');
SELECT levenshtein('bat', 'fad') fad,levenshtein('bat', 'fat') fat,levenshtein('bat', 'bat') bat;
SELECT movie_id, title FROM movies WHERE levenshtein(lower(title), lower('a hard day nght')) <= 3;
SELECT show_trgm('Avatar');
CREATE INDEX movies_title_trigram ON movies USING gist (title gist_trgm_ops);
SELECT title FROM movies WHERE title % 'Avatre';
SELECT title FROM movies WHERE title @@ 'night & day';
SELECT title FROM movies WHERE to_tsvector(title) @@ to_tsquery('english', 'night & day');
SELECT to_tsvector('A Hard Day''s Night'),to_tsquery('english', 'night & day');
SELECT * FROM movies WHERE title @@ to_tsquery('english', 'a');
\s day3
\q
SELECT to_tsvector('english', 'A Hard Day''s Night');
SELECT to_tsvector('simple', 'A Hard Day''s Night');
\dF
\dFd
SELECT ts_lexize('english_stem', 'Day''s');
SELECT to_tsvector('german', 'was machst du gerade?');
EXPLAIN SELECT * FROM movies WHERE title @@ 'night & day';
CREATE INDEX movies_title_searchable ON movies USING gin(to_tsvector('english', title));
EXPLAIN SELECT * FROM movies WHERE title @@ 'night & day';
EXPLAINSELECT *FROM moviesWHERE to_tsvector('english',title) @@ 'night & day';
EXPLAINSELECT *FROM moviesWHERE to_tsvector('english',title) @@ 'night & day';
EXPLAIN SELECT * FROM movies WHERE to_tsvector('english',title) @@ 'night & day';
SELECT * FROM actors WHERE name = 'Broos Wils';
\i movies_data_1.sql
SELECT * FROM actors WHERE name = 'Broos Wils';
SELECT *FROM actorsWHERE name % 'Broos Wils';
SELECT * FROM actors WHERE name % 'Broos Wils';
SELECT title FROM movies NATURAL JOIN movies_actors NATURAL JOIN actors WHERE metaphone(name, 6) = metaphone('Broos Wils', 6);
SELECT name, dmetaphone(name), dmetaphone_alt(name),metaphone(name, 8), soundex(name)FROM actors;
SELECT * FROM actors WHERE metaphone(name,8) % metaphone('Robin Williams',8)ORDER BY levenshtein(lower('Robin Williams'), lower(name));
SELECT * FROM actors WHERE dmetaphone(name) % dmetaphone('Ron');
SELECT name,cube_ur_coord('(0,7,0,0,0,0,0,0,0,7,0,0,0,0,10,0,0,0)', position) as scoreFROM  genres gWHERE cube_ur_coord('(0,7,0,0,0,0,0,0,0,7,0,0,0,0,10,0,0,0 )', position) > 0;
SELECT name,cube_ur_coord('(0,7,0,0,0,0,0,0,0,7,0,0,0,0,10,0,0,0)', position) as scorees gWHERE cube_ur_coord('(0,7,0,0,0,0,0,0,0,7,0,0,0,0,10,0,0,0)', position) > 0;
SELECT name, cube_ur_coord('0,7,0,0,0,0,0,0,0,7,0,0,0,0,10,0,0,0)' positio
\q
createlang 6dbs --list
createlang 7dbs --list
CREATE TABLE logs (event_id integer, old_title varchar(255), old_starts timestamp, old_ends timestamp, logged_at timestamp DEFAULT current_timestamp);
createlang 6dbs --list
createlang 7dbs --list
CREATE TABLE logs (event_id integer, old_title varchar(255), old_starts timestamp, old_ends timestamp, logged_at timestamp DEFAULT current_timestamp);
CREATE TABLE logs (event_id integer, old_title varchar(255), old_starts timestamp, old_ends timestamp, logged_at timestamp DEFAULT current_timestamp);
\s day2
\i log_event.sql
CREATE TRIGGER log_events AFTER UPDATE ON events FOR EACH ROW EXECUTE PROCEDURE log_event();
UPDATE events SET ends='2018-05-04 01:00:00' WHERE title='House Party';
SELECT event_id, old_title, old_ends, logged_at FROM logs;
\s day2
\i holiday_view_1.sql
SELECT name, to_char(date, 'Month DD, YYYY') AS date FROM holidays WHERE date <= '2018-04-01';
ALTER TABLE events ADD colors text ARRAY;
CREATE OR REPLACE VIEW holidays AS SELECT event_id AS holiday_id, title AS name, starts AS date, colors FROM events WHERE title LIKE '%Day%' AND venue_id IS NULL;
UPDATE holidays SET colors = '{"red","green"}' where name = 'Christmas Day';
EXPLAIN VERBOSE SELECT * FROM holidays;
EXPLAIN VERBOSE SELECT event_id AS holiday_id,title AS name, starts AS date, colors FROM events WHERE title LIKE '%Day%' AND venue_id IS NULL;
\s day2
\i create_rule.sql
UPDATE holidays SET colors = '{"red","green"}' where name = 'Christmas Day';
\s day2
SELECT extract(year from starts) as year, extract(month from starts) as month, count(*) FROM events GROUP BY year, month ORDER BY year, month;
CREATE TEMPORARY TABLE month_count(month INT);
INSERT INTO month_count VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);
SELECT * FROM crosstab('SELECT extract(year from starts) as year,extract(month from starts) as month, count(*) FROM events GROUP BY year, monthO RDER BY year, month','SELECT * FROM month_count');
SELECT * FROM crosstab('SELECT extract(year from starts) as year,extract(month from starts) as month, count(*) FROM events GROUP BY year, month ORDER BY year, month','SELECT * FROM month_count') AS (year int,jan int, feb int, mar int, apr int, may int, jun int,jul int, aug int, sep int, oct int, nov int, dec int) ORDER BY YEAR;
SELECT * FROM crosstab(
'SELECT extract(year from starts) as year,
extract(month from starts) as month, count(*) FROM events
GROUP BY year, month',
  'SELECT m FROM generate_series(1, 12) m'
) AS (
year int,
jan int, feb int, mar int, apr int, may int, jun int, jul int, aug int, sep int, oct int, nov int, dec int
) ORDER BY YEAR;
\s day2
sudo -u postgres psql
\q
CREATE TABLE entries (entryNo Serial PRIMARY KEY, entryType varchar (60), entryName varchar (60), entryLink varchar (60), date char);
CREATE TABLE users (userID serial PRIMARY KEY, firstName varchar (30), lastName varchar (30), access varchar (30));
COPY users(userID,firstName, lastName, access)FROM '/home/UserInfo.csv' DELIMITER ','CSV HEADER;
COPY users(userID,firstName, lastName, access)FROM '/home/lion/UserInfo.csv' DELIMITER ','CSV HEADER;
SELECT * FROM users
q
\q
CREATE TABLE users (userID serial PRIMARY KEY, firstName varchar (30), lastName varchar (30), access varchar (30));
COPY users(userID,firstName, lastName, access)FROM '/home/lion/UserInfo.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM users;
CREATE TABLE entries (entryNo Serial PRIMARY KEY, entryType varchar (60), entryName varchar (60), entryLink varchar (60), date DATE);
COPY entries(entryNo,entryType, entryName, entryLink, date)FROM '/home/lion/EntryInfo.csv' DELIMITER ','CSV HEADER;
CREATE TABLE entries (entryNo Serial PRIMARY KEY, entryType varchar (60), entryName varchar, entryLink varchar, date DATE);
DROP TABLE entries;
CREATE TABLE entries (entryNo Serial PRIMARY KEY, entryType varchar (60), entryName varchar, entryLink varchar, date DATE);
COPY entries(entryNo,entryType, entryName, entryLink, date)FROM '/home/lion/EntryInfo.csv' DELIMITER ','CSV HEADER;
SELECT * FROM entries;
DELETE FROM entries WHERE (entryNo = ‘1’’)
q
\q
DELETE FROM entries WHERE (entryNo = ‘1’);
DELETE FROM entries WHERE (entryNo = 1);
SELECT * FROM entries;
SELECT * FROM entries WHERE entryType = ‘Audio’;
INSERT INTO users VALUES (0626 ‘Sorca’, ‘MC’, ‘user’);
INSERT INTO users VALUES ('0626', ‘Sorca’, ‘MC’, ‘user’);
UPDATE users SET lastName = ‘Rychkova’ WHERE lastName = ‘Gill’;
UPDATE users SET lastname = ‘Rychkova’ WHERE lastname = ‘Gill’;
UPDATE users SET lastname = ‘Rychkova’ WHERE lastname = ‘Gill’;
UPDATE users SET lastname = ‘Rychkova’ WHERE lastname = ‘Gill’
\q
UPDATE users
SET lastname = 'Rychkova' 
WHERE lastname = 'Gill';
SELECT * FROM users;
INSERT INTO users 
VALUES (0626, ‘Sorca’, ‘MC’, ‘user’);
INSERT INTO users
(userid, firstname, lastname, access) 
VALUES (;
q
\q
INSERT INTO users
VALUES (firstname, lastname, access)
\q
INSERT INTO users
(firstname, lastname, access)
VALUES ('Sorca', 'MC', 'user');
SELECT * FROM users;
\s
\s work.txt
