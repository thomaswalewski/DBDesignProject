# Garden Tracker Application: 
#### Video Overview and demonstration https://www.youtube.com/watch?v=ZOokHR6WN6M

## Project Structure:
In the source directory, there are three subdirectories for a normal user, company, and website admin / employee. 
These are the three personas of the project, and all the routes and code for their respective blueprints
contained in the python files in each directory. The Database with all initialization code is located in the 
db_bootstrap.sql file in the DB directory. 

## How to use this Application:
The application is very easy and intuitive to use. The only necessary steps are to clone this repository,
create the necessary db_password files, 
run the docker compose build and up commands, and use ngrok to forward port 8001, as defined in the 
docker-compose.yml file. Upon changing the source for the DB API in appsmith, you can deploy and go to the login
page. Default values are provided, but exploration of the whole app is encouraged.\
User IDs span from [1-50]. \
Company IDs span from [1-30]. \
Employee IDs span from [1-10]. 

There is data for all users that can log in to the application. There are four pages, two for normal users, and both 
Employees and Companies have one. The post requests are located across the application, with one on each of the
normal users screens, and one on the companies screen. These post requests immediately update the information in the
database and graphs next to them.


