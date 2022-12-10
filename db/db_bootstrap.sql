CREATE DATABASE GardenTracker;
Grant all privileges on GardenTracker.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE GardenTracker;

CREATE TABLE user(
    name Varchar(30) not null,
    email Varchar(30) not null,
    id int PRIMARY KEY AUTO_INCREMENT,
    join_date DATE DEFAULT ((CURRENT_DATE)),
    location VARCHAR(30));

insert into user (name, email, join_date, location) values ('Ashli Pointin', 'test@gmail.com', '2022-04-23', 'Ak’ordat');
insert into user (name, email, join_date, location) values ('Yorgos Brasner', 'ybrasner1@usgs.gov', '2022-08-26', 'Lau');
insert into user (name, email, join_date, location) values ('Krispin O''Loinn', 'koloinn2@fotki.com', '2022-05-05', 'Steinkjer');
insert into user (name, email, join_date, location) values ('Aylmer MacInherney', 'amacinherney3@army.mil', '2022-03-31', 'Gaotang');
insert into user (name, email, join_date, location) values ('Pail Aldrin', 'paldrin4@typepad.com', '2022-08-10', 'Łęczyce');
insert into user (name, email, join_date, location) values ('Alyda Van den Bosch', 'avan5@rakuten.co.jp', '2021-04-20', 'Nevers');
insert into user (name, email, join_date, location) values ('Genna Brookfield', 'gbrookfield6@shareasale.com', '2021-03-28', 'São Luís do Quitunde');
insert into user (name, email, join_date, location) values ('Livia Shackelton', 'lshackelton7@newsvine.com', '2021-06-17', 'Cikuning');
insert into user (name, email, join_date, location) values ('Nico Baumer', 'nbaumer8@skyrock.com', '2022-09-02', 'Nikkō');
insert into user (name, email, join_date, location) values ('Rozalie Penquet', 'rpenquet9@typepad.com', '2022-01-11', 'Samoljica');

CREATE TABLE garden(
    name Varchar(30) not null,
    id int AUTO_INCREMENT PRIMARY KEY,
    start_date DATE default (CURRENT_DATE),
    num_beds int,
    user_id int not null,
    FOREIGN KEY (user_id) references user(ID) ON DELETE CASCADE ON UPDATE CASCADE);

insert into garden (name, start_date, num_beds, user_id) values ('Khotsimsk', '2021-08-18', 1, 1);
insert into garden (name, start_date, num_beds, user_id) values ('Minna', '2021-04-22', 2, 2);
insert into garden (name, start_date, num_beds, user_id) values ('Ceibas', '2021-06-04', 3, 3);
insert into garden (name, start_date, num_beds, user_id) values ('Castelo de Vide', '2022-06-02', 4, 4);
insert into garden (name, start_date, num_beds, user_id) values ('Cikandang', '2022-11-13', 5, 5);
insert into garden (name, start_date, num_beds, user_id) values ('Condoroma', '2022-08-31', 6, 6);
insert into garden (name, start_date, num_beds, user_id) values ('Bålsta', '2022-11-05', 7, 7);
insert into garden (name, start_date, num_beds, user_id) values ('Burnham', '2021-12-15', 8, 8);
insert into garden (name, start_date, num_beds, user_id) values ('Tilmi', '2022-03-04', 9, 9);
insert into garden (name, start_date, num_beds, user_id) values ('Xiamayu', '2020-10-09', 10, 10);

CREATE TABLE plants(
    species Varchar(30) not null,
    id int AUTO_INCREMENT PRIMARY KEY,
    plant_date DATE,
    height int,
    bed_num int,
    rec_water_freq int,
    rec_water_amount int,
    garden_id int not null,
    FOREIGN KEY (garden_id) references garden(ID) ON UPDATE CASCADE);

insert into plants (species, plant_date, garden_id) values ('Bigelow''s Amaranth', '2022-10-05', 1);
insert into plants (species, plant_date, height, garden_id) values ('Oak Tree', '2022-10-05', 10, 1);
insert into plants (species, plant_date, garden_id) values ('Nuttall''s Milkvetch', '2020-11-04', 2);
insert into plants (species, plant_date, garden_id) values ('Tapertip Liveforever', '2021-06-11', 3);
insert into plants (species, plant_date, garden_id) values ('Cucumberleaf Sunflower', '2021-06-11', 4);
insert into plants (species, plant_date, garden_id) values ('Ptychomitrium Moss', '2021-06-11', 5);
insert into plants (species, plant_date, garden_id) values ('Sand Palafox', '2021-06-11', 6);
insert into plants (species, plant_date, garden_id) values ('Pestilence Wort', '2021-06-11', 7);
insert into plants (species, plant_date, garden_id) values ('Fiveangled Dodder', '2021-06-11', 8);
insert into plants (species, plant_date, garden_id) values ('Pink Mountainheath', '2021-06-11', 9);
insert into plants (species, plant_date, garden_id) values ('Basketgrass', '2021-06-11', 10);

CREATE TABLE harvests(
    part_of_plant Varchar(30),
    id int AUTO_INCREMENT PRIMARY KEY,
    harvest_date DATE default (CURRENT_DATE),
    plant_id int not null,
    FOREIGN KEY (plant_id) references plants(id) ON DELETE CASCADE ON UPDATE CASCADE);

insert into harvests (plant_id, harvest_date) values (1, '2021-02-24');
insert into harvests (plant_id, harvest_date) values (2, '2021-02-24');
insert into harvests (plant_id, harvest_date) values (3, '2021-02-24');
insert into harvests (plant_id, harvest_date) values (4, '2021-02-24');
insert into harvests (plant_id, harvest_date) values (5, '2021-02-24');
insert into harvests (plant_id, harvest_date) values (6, '2021-02-24');
insert into harvests (plant_id, harvest_date) values (7, '2021-02-24');
insert into harvests (plant_id, harvest_date) values (8, '2021-02-24');
insert into harvests (plant_id, harvest_date) values (9, '2021-02-24');
insert into harvests (plant_id, harvest_date) values (10, '2021-02-24');

CREATE TABLE watering(
    water_date DATE default (CURRENT_DATE),
    plant_id int not null,
    water_amount int,
    FOREIGN KEY (plant_id) references plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (plant_id, water_date));

insert into watering (plant_id) values (1);
insert into watering (plant_id) values (2);
insert into watering (plant_id) values (3);
insert into watering (plant_id) values (4);
insert into watering (plant_id) values (5);
insert into watering (plant_id) values (6);
insert into watering (plant_id) values (7);
insert into watering (plant_id) values (8);
insert into watering (plant_id) values (9);
insert into watering (plant_id) values (10);


CREATE TABLE company(
    name Varchar(30) not null,
    id int PRIMARY KEY AUTO_INCREMENT,
    join_date DATE default (CURRENT_DATE));

insert into company (name) values ('Ailane');
insert into company (name) values ('Voonix');
insert into company (name) values ('Meemm');
insert into company (name) values ('Janyx');
insert into company (name) values ('Dabfeed');
insert into company (name) values ('Dabtype');
insert into company (name) values ('Twitterlist');
insert into company (name) values ('Devpoint');
insert into company (name) values ('Skyble');
insert into company (name) values ('Brainverse');

CREATE TABLE employee(
    name Varchar(30) not null,
    id int not null auto_increment primary key,
    email Varchar(30) not null,
    reports_to int not null,
    FOREIGN KEY (reports_to) references employee(id) ON DELETE RESTRICT ON UPDATE CASCADE);

insert into employee (name, email, reports_to) values ('Ambrosi Fifield', 'afifield0@skype.com', 1);
insert into employee (name, email, reports_to) values ('Karrah Giggs', 'kgiggs1@canalblog.com', 2);
insert into employee (name, email, reports_to) values ('Nissy Search', 'nsearch2@nsw.gov.au', 3);
insert into employee (name, email, reports_to) values ('Cully Tumbridge', 'ctumbridge3@reference.com', 4);
insert into employee (name, email, reports_to) values ('Forrest Phizaclea', 'fphizaclea4@patch.com', 5);
insert into employee (name, email, reports_to) values ('Rinaldo Coalburn', 'rcoalburn5@theglobeandmail.com', 6);
insert into employee (name, email, reports_to) values ('Augustine Giacomoni', 'agiacomoni6@usa.gov', 7);
insert into employee (name, email, reports_to) values ('Nicola Christofides', 'nchristofides7@ehow.com', 8);
insert into employee (name, email, reports_to) values ('Leeann Kairns', 'lkairns8@marketwatch.com', 9);
insert into employee (name, email, reports_to) values ('Lianna McAlester', 'lmcalester9@barnesandnoble.com', 10);

CREATE TABLE company_representatives(
    name Varchar(30) not null,
    email Varchar(30) not null primary key,
    company_id int not null,
    primary_contact int,
    FOREIGN KEY (company_id) references company(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (primary_contact) references employee(id) ON DELETE RESTRICT ON UPDATE CASCADE);

insert into company_representatives (name, email, company_id, primary_contact) values ('Luigi Rivel', 'lrivel0@moonfruit.com', 1, 1);
insert into company_representatives (name, email, company_id, primary_contact) values ('Margot Heindrick', 'mheindrick1@youtube.com', 2, 2);
insert into company_representatives (name, email, company_id, primary_contact) values ('Cirstoforo Dudliston', 'cdudliston2@fc2.com', 3, 3);
insert into company_representatives (name, email, company_id, primary_contact) values ('Dennet Raddan', 'draddan3@ucoz.ru', 4, 4);
insert into company_representatives (name, email, company_id, primary_contact) values ('Teddi Geffinger', 'tgeffinger4@arizona.edu', 5, 5);
insert into company_representatives (name, email, company_id, primary_contact) values ('Cory Amyes', 'camyes5@spiegel.de', 6, 6);
insert into company_representatives (name, email, company_id, primary_contact) values ('Kirk McMillan', 'kmcmillan6@globo.com', 7, 7);
insert into company_representatives (name, email, company_id, primary_contact) values ('Kordula McAmish', 'kmcamish7@yelp.com', 8, 8);
insert into company_representatives (name, email, company_id, primary_contact) values ('Court Ahren', 'cahren8@newyorker.com', 9, 9);
insert into company_representatives (name, email, company_id, primary_contact) values ('Guthrie Donohoe', 'gdonohoe9@deliciousdays.com', 10, 10);

CREATE TABLE products(
    name Varchar(30) not null,
    id int AUTO_INCREMENT PRIMARY KEY,
    list_date DATE default (CURRENT_DATE),
    company_id int not null,
    FOREIGN KEY (company_id) references company(id) ON UPDATE CASCADE);

insert into products (name, company_id) values ('Matsoft', 1);
insert into products (name, company_id) values ('Wrapsafe', 2);
insert into products (name, company_id) values ('Hatity', 3);
insert into products (name, company_id) values ('Flowdesk', 4);
insert into products (name, company_id) values ('Flowdesk', 5);
insert into products (name, company_id) values ('Cardify', 6);
insert into products (name, company_id) values ('Tempsoft', 7);
insert into products (name, company_id) values ('Fintone', 8);
insert into products (name, company_id) values ('Biodex', 9);
insert into products (name, company_id) values ('Viva', 10);

CREATE TABLE ratings(
    comments Varchar(200),
    rating int not null check (rating between 1 and 10),
    rate_date DATE default (CURRENT_DATE),
    product_id int not null,
    user_id int not null,
    FOREIGN KEY product (product_id) references products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY user (user_id) references user(id) ON UPDATE CASCADE,
    PRIMARY KEY (user_id, product_id));

insert into ratings (comments, rating, product_id, user_id) values ('hoeuweqono dhca osuka pvnlahcsgk ', 1, 1, 1);
insert into ratings (comments, rating, product_id, user_id) values ('epbespwolg tfrn hevmq fxblzvmohu ', 2, 2, 2);
insert into ratings (comments, rating, product_id, user_id) values ('kijsxheflh rakc rfkas awwwvlkvxo ', 3, 3, 3);
insert into ratings (comments, rating, product_id, user_id) values ('ryfbhbrrtu qjei mxien rconqdatoz ', 4, 4, 4);
insert into ratings (comments, rating, product_id, user_id) values ('aaoyqxyohl izch xlhyv lvqlgswlfr ', 5, 5, 5);
insert into ratings (comments, rating, product_id, user_id) values ('wuxcecompf aemk xmvxy gotmtxbmxq ', 6, 6, 6);
insert into ratings (comments, rating, product_id, user_id) values ('lfmfsdqyjd oxvo trwvc pgbfojxhqo ', 7, 7, 7);
insert into ratings (comments, rating, product_id, user_id) values ('pyivxaygqh ipsi lcads apomkhuywz ', 8, 8, 8);
insert into ratings (comments, rating, product_id, user_id) values ('rlhaeqqqia agdf ekrsg ownmrpstef ', 9, 9, 9);
insert into ratings (comments, rating, product_id, user_id) values ('ejkapjlpgt gmnn dvzts neznyhgnhi ', 10, 10, 10);

CREATE TABLE garden_groups(
    group_name varchar(30),
    id int AUTO_INCREMENT PRIMARY KEY,
    start_date DATE default (CURRENT_DATE),
    leader_id int not null);

insert into garden_groups (group_name, leader_id) values ('Bitchip', 1);
insert into garden_groups (group_name, leader_id) values ('Sub-Ex', 2);
insert into garden_groups (group_name, leader_id) values ('Bigtax', 3);
insert into garden_groups (group_name, leader_id) values ('Flexidy', 4);
insert into garden_groups (group_name, leader_id) values ('Sub-Ex', 5);
insert into garden_groups (group_name, leader_id) values ('Cookley', 6);
insert into garden_groups (group_name, leader_id) values ('Y-find', 7);
insert into garden_groups (group_name, leader_id) values ('Trippledex', 8);
insert into garden_groups (group_name, leader_id) values ('Stringtough', 9);
insert into garden_groups (group_name, leader_id) values ('Veribet', 10);

CREATE TABLE user_group(
    user_id int not null,
    group_id int not null,
    FOREIGN KEY garden_groups (group_id) references garden_groups(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY user (user_id) references user(id) ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (user_id, group_id));

insert into user_group (user_id, group_id) values (1, 1);
insert into user_group (user_id, group_id) values (2, 2);
insert into user_group (user_id, group_id) values (3, 3);
insert into user_group (user_id, group_id) values (4, 4);
insert into user_group (user_id, group_id) values (5, 5);
insert into user_group (user_id, group_id) values (6, 6);
insert into user_group (user_id, group_id) values (7, 7);
insert into user_group (user_id, group_id) values (8, 8);
insert into user_group (user_id, group_id) values (9, 9);
insert into user_group (user_id, group_id) values (10, 10);

CREATE TABLE friends(
    user1_id int not null,
    user2_id int not null,
    FOREIGN KEY user1 (user1_id) references user(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY user2 (user2_id) references user(id) ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (user1_id, user2_id));

insert into friends (user1_id, user2_id) values (1, 1);
insert into friends (user1_id, user2_id) values (2, 2);
insert into friends (user1_id, user2_id) values (3, 3);
insert into friends (user1_id, user2_id) values (4, 4);
insert into friends (user1_id, user2_id) values (5, 5);
insert into friends (user1_id, user2_id) values (6, 6);
insert into friends (user1_id, user2_id) values (7, 7);
insert into friends (user1_id, user2_id) values (8, 8);
insert into friends (user1_id, user2_id) values (9, 9);
insert into friends (user1_id, user2_id) values (10, 10);

CREATE TABLE plant_products(
    plant_id int not null,
    product_id int not null,
    amount int,
    unit VARCHAR(10),
    FOREIGN KEY plant (plant_id) references plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY product (product_id) references products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (plant_id, product_id));

insert into plant_products (plant_id, product_id) values (1, 1);
insert into plant_products (plant_id, product_id) values (2, 2);
insert into plant_products (plant_id, product_id) values (3, 3);
insert into plant_products (plant_id, product_id) values (4, 4);
insert into plant_products (plant_id, product_id) values (5, 5);
insert into plant_products (plant_id, product_id) values (6, 6);
insert into plant_products (plant_id, product_id) values (7, 7);
insert into plant_products (plant_id, product_id) values (8, 8);
insert into plant_products (plant_id, product_id) values (9, 9);
insert into plant_products (plant_id, product_id) values (10, 10);



CREATE TABLE page(
    name Varchar(30) not null primary key);

insert into page (name) values ('uecpwuvr');
insert into page (name) values ('qshdlfit');
insert into page (name) values ('wnpcayut');
insert into page (name) values ('xwhqrhkg');
insert into page (name) values ('mfruqlwp');
insert into page (name) values ('xsnjjnbu');
insert into page (name) values ('tesybeuk');
insert into page (name) values ('odqxpmkh');
insert into page (name) values ('muxxpwly');
insert into page (name) values ('nokxspid');

CREATE TABLE user_page(
    user_id int not null,
    page_name VARCHAR(30) not null,
    duration_min int,
    log_off_after BIT(1),
    visit_num int auto_increment,
    FOREIGN KEY user (user_id) references user(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY page (page_name) references page(name) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (visit_num, user_id));

insert into user_page (page_name, user_id) values ('uecpwuvr', 1);
insert into user_page (page_name, user_id) values ('qshdlfit', 2);
insert into user_page (page_name, user_id) values ('wnpcayut', 3);
insert into user_page (page_name, user_id) values ('xwhqrhkg', 4);
insert into user_page (page_name, user_id) values ('mfruqlwp', 5);
insert into user_page (page_name, user_id) values ('xsnjjnbu', 6);
insert into user_page (page_name, user_id) values ('tesybeuk', 7);
insert into user_page (page_name, user_id) values ('odqxpmkh', 8);
insert into user_page (page_name, user_id) values ('muxxpwly', 9);
insert into user_page (page_name, user_id) values ('nokxspid', 10);


