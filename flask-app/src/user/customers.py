from flask import Blueprint, request, jsonify, make_response
import json
from src import db
from flaskext.mysql import MySQL

user = Blueprint('user', __name__)


# Get all plants from a user with a particular userID.
@user.route('/user/<user_id>/plants', methods=['GET'])
def get_plants(user_id):
    cursor = db.get_db().cursor()
    cursor.execute('select p.species, p.height, p.plant_date, g.name as Garden_Name, p.id as plant_id '
                   ' from garden g JOIN plants p on g.id = p.garden_id where g.user_id = {0}'.format(user_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Getting the watering from a specific plant.
@user.route('/<user_id>/<plant_id>/water', methods=['GET'])
def get_watering(plant_id, user_id):
    cursor = db.get_db().cursor()
    cursor.execute('select water_date as x, water_amount as y from watering where plant_id = {0}'.format(plant_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Post request for a user to add a plant to their garden.
@user.route('/<user_id>/addPlant', methods=['POST'])
def add_plant(user_id):
    cursor = db.get_db().cursor()

    species1 = request.form['species']
    plant_date1 = request.form['plant_date']
    height1 = request.form['height']
    garden_id1 = request.form['garden_id']
    bed_num = request.form['bed_num']
    rec_wf = request.form['rec_wf']
    rec_wa = request.form['rec_wa']

    cursor.execute(
        'Insert into plants(species, garden_id, plant_date, height, bed_num, rec_water_freq, rec_water_amount)'
        ' values (%s, %s, %s, %s, %s, %s, %s)',
        (species1, garden_id1, plant_date1, height1, bed_num, rec_wf, rec_wa))
    cursor.connection.commit()
    cursor.close()
    get_plants(user_id)
    return 'success'


# Gets the users garden ids and garden names.
@user.route('/<user_id>/gardens', methods=['GET'])
def get_gardens(user_id):
    cursor = db.get_db().cursor()
    cursor.execute('select id as value, name as label from garden where user_id = {0}'.format(user_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Gets all the harvests from a specific plant.
@user.route('/<plant_id>/harvests', methods=['GET'])
def get_harvests(plant_id):
    cursor = db.get_db().cursor()
    cursor.execute('select * from harvests where plant_id = {0}'.format(plant_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Post request to let record a watering of the plant.
@user.route('/<user_id>/<plant_id>/addWater', methods=['POST'])
def add_water(user_id, plant_id):
    cursor = db.get_db().cursor()

    amount = request.form['amount']
    day = request.form['day']
    cursor.execute('Insert into watering(water_date, plant_id, water_amount)'
                   ' values (%s, %s, %s )',
                   (day, plant_id, amount))
    cursor.connection.commit()
    cursor.close()
    return 'success'
