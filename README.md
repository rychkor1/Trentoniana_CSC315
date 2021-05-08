# Group 10 - Trentoniana Room Database Project
This is our semester long project for Database Systems. <br>
<br/>The newly modified Trentoniana Room database and companion web-based navigation tool are the straightforward, simplistic solution that members of the Trentoniana Room community have been looking for.
We offer a tool that allows for the storage and viewing of links to various webpages, the capabiltity to sort and display these links, along with the functionality to modify, insert, and delete the entries.
<br/> **Installation**
1. Install the following software on your system:

    * [PostgreSQL](https://www.postgresql.org/download/)
    * [Python 3](https://www.python.org/downloads/)
    * [Python library psycopg2](https://www.psycopg.org/docs/install.html])
    * [Python library flask](https://flask.palletsprojects.com/en/1.1.x/installation/)
    * [Python library flask-cors](https://flask-cors.readthedocs.io/en/latest/)

2. Download all of the files in this repository and create a folder with the files - call it "app"
3. Now you need to create the database and fill it with the entries using the following commands.

    * createdb proj7
    * psql proj7
    * CREATE TABLE users (userID serial PRIMARY KEY, firstName varchar (30), lastName varchar (30), password varchar(30), access varchar (30));
    * COPY users(userID,firstName, lastName, password, access)FROM '/home/lion/app/UserInfo.csv' DELIMITER ',' CSV HEADER;
    * SELECT * FROM users;
    * CREATE TABLE entries (entryNo Serial PRIMARY KEY, entryType varchar (60), entryName varchar, entryLink varchar, date DATE);
    * COPY entries(entryNo,entryType, entryName, entryLink, date)FROM '/home/lion/app/EntryInfo.csv' DELIMITER ',' CSV HEADER;

4. Now hit \q and then type cd app to go into the app folder in the terminal. From here, we are ready to run the program and navigate through the site. Type these two commands in the terminal
    
    * i forget
    * flask run ??

5. Now navigate to the site shown in the terminal to see the new Trentoniana Database User Interface we have created. You will have the option to search and filter through the database, as well as make insertions, updates, and deletions if you are an admin. 
