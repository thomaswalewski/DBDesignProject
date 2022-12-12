from flask import Blueprint, request, jsonify, make_response
import json
from src import db
from flaskext.mysql import MySQL

site_admin = Blueprint('views', __name__)


@site_admin.route('/<employeeID>/contacts', methods=['GET'])
def get_contacts(employeeID):
    cursor = db.get_db().cursor()
    cursor.execute('select name, email, company_id from '
                   'company_representatives where primary_contact = {0}'.format(employeeID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@site_admin.route('/getPageDetails', methods=['GET'])
def get_page_details():
    cursor = db.get_db().cursor()
    cursor.execute('select p.pname as x, count(user_id) as y from page p join user_page on p.id = user_page.page_id '
                   'group by p.pname')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
