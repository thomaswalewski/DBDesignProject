from flask import Blueprint, request, jsonify, make_response
import json
from src import db
from flaskext.mysql import MySQL

user = Blueprint('user', __name__)


# Get all plants from a user with a particular userID
@user.route('/user/<user_id>/plants', methods=['GET'])
def get_plants(user_id):
    cursor = db.get_db().cursor()
    cursor.execute('select species, height, p.id, plant_date, g2.name as garden_name, g2.id as garden_id'
                   ' from plants p JOIN garden g2 on g2.id = p.garden_id'
                   ' where garden_id = (select g.id from garden g JOIN user u on u.id = '
                   'g.user_id where g.user_id = {0})'.format(user_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@user.route('/user/<user_id>/<plant_id>/water', methods=['GET'])
def get_watering(plant_id):
    cursor = db.get_db().cursor()
    cursor.execute('select * from watering where plant_id = {0}'.format(plant_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@user.route('/<user_id>/addPlant', methods=['POST'])
def add_plant(user_id):

    cursor = db.get_db().cursor()

    species1 = request.form['species']
    plant_date1 = request.form['plant_date']
    height1 = request.form['height']
    garden_id1 = request.form['garden_id']

    cursor.execute('Insert into plants(species, garden_id, plant_date, height) values (%s, %s, %s, %s)',
                   (species1, garden_id1, plant_date1, height1))
    cursor.connection.commit()
    cursor.close()
    get_plants(user_id)
    return 'success'
