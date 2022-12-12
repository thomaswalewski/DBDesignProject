from flask import Blueprint, request, jsonify, make_response
import json
from src import db

company = Blueprint('company', __name__)


# Get all the company from the database
@company.route('/products/<company_id>', methods=['GET'])
def get_products(company_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of company

    cursor.execute('select id, name, list_date from products where company_id = {0}'.format(company_id))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@company.route('/<product_id>', methods=['GET'])
def get_ratings(product_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of company

    cursor.execute('select rating as y, user_id as x'
                   ' from ratings where product_id = {0}'.format(product_id))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


@company.route('/<company_id>/addProduct', methods=['POST'])
def add_product(company_id):
    cursor = db.get_db().cursor()

    name = request.form['name']
    date = request.form['date']

    cursor.execute(
        'Insert into products(name, company_id, list_date)'
        ' values (%s, %s, %s)', (name, company_id, date))
    cursor.connection.commit()
    cursor.close()
    return 'success'
