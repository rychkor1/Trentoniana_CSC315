#! /usr/bin/python3

"""
ONE-TIME SETUP

To run this example in the CSC 315 VM you first need to make
the following one-time configuration changes:

# set the postgreSQL password for user 'lion'
sudo -u postgres psql
    ALTER USER lion PASSWORD 'lion';
    \q

# install pip for Python 3
sudo apt update
sudo apt install python3-pip

# install psycopg2
pip3 install psycopg2-binary

# install flask
pip3 install flask

# logout, then login again to inherit new shell environment
"""

"""
CSC 315
Spring 2021
John DeGood

# usage
export FLASK_APP=app.py 
flask run

# then browse to http://127.0.0.1:5000/

Purpose:
Demonstrate Flask/Python to PostgreSQL using the psycopg adapter.
Connects to the 7dbs database from "Seven Databases in Seven Days"
in the CSC 315 VM.

For psycopg documentation:
https://www.psycopg.org/

This example code is derived from:
https://www.postgresqltutorial.com/postgresql-python/
https://scoutapm.com/blog/python-flask-tutorial-getting-started-with-flask
https://www.geeksforgeeks.org/python-using-for-loop-in-flask/
"""

import psycopg2
from config import config
from datetime import date
from flask import Flask, render_template, request
 
def connect(query):
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters from database.ini
        params = config()
 
        # connect to the PostgreSQL server
        print('Connecting to the %s database...' % (params['database']))
        conn = psycopg2.connect(**params)
        print('Connected.')
      
        # create a cursor
        cur = conn.cursor()
        
        # execute a query using fetchall()
        cur.execute(query)
        rows = cur.fetchall()

       # close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')
    # return the query result from fetchall()
    return rows
    
#update database table using query which is an sql statement
def update(query):
    """ Connect to the PostgreSQL database server """
    #host=localhost port=5432 database=project user=lion password=lion    
    conn = psycopg2.connect(
    database ="project", user= "lion", password = "lion",host = "localhost", port =   "5432"
    )
    
    conn.autocommit = True
    #attempt to run sql command
    try:
        cursor = conn.cursor()
        cursor.execute(query)
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    conn.close()
    
# app.py
app = Flask(__name__)


# serve form web page
@app.route("/")
def form():
    return render_template('my-form.html')


# handle form data
@app.route('/form-handler', methods=['POST'])
def handle_data():
    rows = connect(request.form['query'])
    return render_template('my-result.html', rows=rows)


#dropdown 1 for file type
@app.route('/form-type', methods=['POST'])
def form_type():
    temp = request.form['dropdown']
    tempnew = "SELECT * FROM entries \nWHERE entryType = 'Transcript'"
    if temp == "Audio":
        tempnew = "SELECT * FROM entries \nWHERE entryType = 'Audio'"
    if temp == "#":
        return render_template('my-form.html')
    rows = connect(tempnew)
    return render_template('my-result.html', rows=rows)
    

#dropdown 2 for file date
@app.route('/form-date', methods=['POST'])
def form_date():
    temp = request.form['dropdown2']
    tempnew = "SELECT * FROM entries \nWHERE date = '1996-10-29'"
    if temp == "1988-06-08":
        tempnew = "SELECT * FROM entries \nWHERE date = '1988-06-08'"
    if temp == "1995-04-17":
        tempnew = "SELECT * FROM entries \nWHERE date = '1995-04-17'"
    if temp == "#":
        return render_template('my-form.html')
    rows = connect(tempnew)
    return render_template('my-result.html', rows=rows)
    
#dropdown 3 for file author
@app.route('/form-author', methods=['POST'])
def form_author():
    temp = request.form['dropdown1']
    tempnew = "SELECT * FROM entries \nWHERE entryName ILIKE '%Minerva%'"
    if temp == "Joe and Ida Klatzkin":
        tempnew = "SELECT * FROM entries \nWHERE entryName ILIKE '%Joe%'"
    if temp == "Herman Finkle":
        tempnew = "SELECT * FROM entries \nWHERE entryName ILIKE '%Herman%'"
    if temp == "#":
        return render_template('my-form.html')
    rows = connect(tempnew)
    return render_template('my-result.html', rows=rows)
    
# handle login
@app.route('/idlogin', methods=['POST'])
def handle_login():
    temp = request.form['idquery1']
    access = "SELECT access FROM USERS \nWHERE userID = \'" + temp + "\';";
    rows = connect(access)
    if connect(access) != 'superUser':
        return render_template('adminchanges.html', rows=rows)
    

# back to home button
@app.route('/home', methods=['POST'])
def go_home():
    return render_template('my-form.html')

# admin
@app.route('/admin', methods=['POST'])
def login():
    return render_template('adminpage.html')
    
    
#admin insert

@app.route('/form-handler-insert', methods=['POST'])
def handle_data_insert():
    temp = request.form['entryType']
    temp2 = request.form['entryName']
    temp3 = request.form['entryLink']
    temp4 = request.form['date']
    tempholder = "INSERT INTO entries VALUES (\'" + temp + "',\'" + temp2 + "',\'" + temp3 + "'," + temp4 + ")';"
    rows = connect(tempholder)
    return render_template('adminchanges.html', rows=rows)
    
def sqlMethod(query):
    params = config()
    conn = psycopg2.connect(**params)
    cur = conn.cursor()
    cur.execute(query)
    conn.close()
 
#admin delete
@app.route('/form-handler-delete', methods=['POST'])
def handle_data_delete():
    temp = request.form['entryNo']
    action = "DELETE FROM entries \nWHERE entryNo = \'" + request.form['entryNo'] + "\';"
    sqlMethod(action)
    return render_template('adminchanges.html', rows=rows)

if __name__ == '__main__':
    app.run(debug = True)
