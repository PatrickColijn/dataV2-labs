![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | My first queries

Please, connect to the Data Bootcamp Google Database using the credentials provided in class. Choose the database called *appleStore*. Use the *data* table to query the data about Apple Store Apps and answer the following questions: 

**1. What are the different genres?**

SELECT DISTINCT prime_genre
FROM app;

Games
Productivity
Weather
Shopping
Reference
Finance
Music
Utilities
Travel
Social Networking
Sports
Business
Health & Fitness
Entertainment
Photo & Video
Navigation
Education
Lifestyle
Food & Drink
News
Book
Medical
Catalogs

**2. Which is the genre with the most apps rated?**
SELECT prime_genre, rating_count_tot
FROM app
ORDER BY rating_count_tot DESC
LIMIT 3;

Social Networking	2974676
Photo & Video	2161558
Games	2130805

**3. Which is the genre with most apps?**

SELECT prime_genre, COUNT(id)
FROM app
GROUP BY prime_genre
ORDER BY COUNT(id) DESC;

Games	3862
Entertainment	535
Education	453

**4. Which is the one with least?**
SELECT prime_genre, COUNT(id)
FROM app
GROUP BY prime_genre
ORDER BY COUNT(id) ASC
LIMIT 3;

Catalogs	10
Medical	23
Navigation	46

**5. Find the top 10 apps most rated.**

SELECT track_name, rating_count_tot
FROM app
ORDER BY rating_count_tot DESC
LIMIT 10;

Facebook	2974676
Instagram	2161558
Clash of Clans	2130805
Temple Run	1724546
Pandora - Music & Radio	1126879
Pinterest	1061624
Bible	985920
Candy Crush Saga	961794
Spotify Music	878563
Angry Birds	824451

**6. Find the top 10 apps best rated by users.**

SELECT track_name, user_rating_ver, rating_count_tot
FROM app
WHERE user_rating_ver = 5
ORDER BY rating_count_tot DESC
LIMIT 10;

Bible	5	985920
Head Soccer	5	481564
Bike Race - Top Motorcycle Racing Games	5	405007
Sniper 3D Assassin: Shoot to Kill Gun Game	5	386521
���Sudoku	5	359832
Infinity Blade	5	326482
Fandango Movies - Times + Tickets	5	291787
CSR Racing 2	5	257100
IMDb Movies & TV - Trailers and Showtimes	5	183425
AdVenture Capitalist	5	181359

SELECT track_name, price
FROM app
ORDER BY rating_count_tot DESC
LIMIT 10;

Facebook	0
Instagram	0
Clash of Clans	0
Temple Run	0
Pandora - Music & Radio	0
Pinterest	0
Bible	0
Candy Crush Saga	0
Spotify Music	0
Angry Birds	0


**7. Take a look at the data you retrieved in question 5. Give some insights.**
Facebook is the most rated app and probably therefor the most downloaded applications from the app store

**8. Take a look at the data you retrieved in question 6. Give some insights.**
The bible is the highest rated app based on it's rating and number of times rated 

**9. Now compare the data from questions 5 and 6. What do you see?**

The top 10 of the most rated apps are not in the list of best rated apps (vice-versa)
Except the bible app.

**10. How could you take the top 3 regarding both user ratings and number of votes?**

SELECT track_name, user_rating_ver, rating_count_tot
FROM app
WHERE user_rating_ver = 5
ORDER BY rating_count_tot DESC
LIMIT 3;

**11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

Based on the top 10 best rated apps and top 10 most rated apps, which accumulates to around 20.000.000 of the total of 92.790.253, we find that around 95% is free and assume there is a correlation between price and number of downloads

SELECT SUM(rating_count_tot)
FROM app

Total number of downloads = 92.790.253
CREATE TABLE Cars (
	ID int,
    VIN varchar(255),
    Manufacturer varchar(255),
    Model varchar(255),
    Year YEAR,
    Color varchar(255),
    PRIMARY KEY (ID, VIN)
);

CREATE TABLE Customers (
	ID int,
    Customer_ID int(10),
    Customer_name varchar(255),
    Phone_number varchar(10),
    Email varchar(255),
    Address varchar(255),
    City varchar(255),
    State_Province varchar(255),
    Country varchar(255),
    Zip_code varchar(8), 
    PRIMARY KEY (ID, Customer_ID)
);

CREATE TABLE Sales_Person (
	ID int,
    STAFF_ID INT(6),
    Staff_name varchar(255),
    Store varchar(10),
    PRIMARY KEY (ID, STAFF_ID)
);

CREATE TABLE Invoices (
	ID INT,
    Invoice_number int (32),
    DATE DATE,
    carsVIN varchar(255),
    Customer_ID INT,
    STAFF_ID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (carsVIN) REFERENCES Cars(VIN),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (STAFF_ID) REFERENCES Sales_Person(STAFF_ID)
);

INSERT INTO cars.Cars
VALUES 	(0, '3K096I98581DHSNUP', 'Volkswagen', 	'Tiguan',				2019, 	'Blue'),
		(1,	'ZM8G7BEUQZ97IH46V', 'Peugeot',		'Rifter', 				2019, 	'Red'),
		(2,	'RKXVNNIHLVVZOUB4M', 'Ford',		'Fusion'				2018,	'White'),
		(3,	'HKNDGS7CU31E9Z7JW', 'Toyota',		'RAV4'					2018,	'Silver'),
		(4,	'DAM41UDN3CHU2WVF6', 'Volvo',		'V60',					2019,	'Gray'),
		(5,	'DAM41UDN3CHU2WVF6', 'Volvo',		'V60 Cross Country',	2019,	'Gray');
		
INSERT INTO cars.Customers
VALUES (

(0,	10001,	'Pablo Picasso',		'+34 636 17 63 82',		'-',	'Paseo de la Chopera, 14',	'Madrid',	'Madrid',		'Spain',			28045),
(1,	20001,	'Abraham Lincoln',		'+1 305 907 7086',		'-',	'120 SW 8th St',			'Miami',	'Florida',		'United States',	33130),
(2,	30001,	'Napoléon Bonaparte',	'+33 1 79 75 40 00',	'-',	'40 Rue du Colisée',		'Paris',	'Île-de-France', 			,			);


INSERT INTO cars.Sales_Person
VALUES (
(0,	00001,	'Pete, Cruiser',	'Madrid'),
(1,	00002,	'Anna Sthesia',		'Barcelona'),
(2,	00003,	'Paul Molive',		'Berlin'),
(3,	00004,	'Gail Forcewind',	'Paris'),
(4,	00005,	'Paige Turner',		'Mimia'),
(5,	00006,	'Bob Frapples',		'Mexico City'),
(6,	00007,	'Walter Melon',		'Amsterdam'),
(7,	00008,	'Shonda Leer',		'São Paulo');

INSERT INTO cars.Invoices
VALUES (
(0,	852399038,	22-08-2018,	0,	1,	3),
(1,	731166526,	31-12-2018,	3,	0,	5),
(2,	271135104,	22-01-2019,	2,	2,	7);

SELECT track_name, user_rating_ver, rating_count_tot, price
FROM app
WHERE user_rating_ver = 5
ORDER BY rating_count_tot DESC
LIMIT 10;

Bible	5	985920	0
Head Soccer	5	481564	0
Bike Race - Top Motorcycle Racing Games	5	405007	0
Sniper 3D Assassin: Shoot to Kill Gun Game	5	386521	0
���Sudoku	5	359832	0
Infinity Blade	5	326482	0.99
Fandango Movies - Times + Tickets	5	291787	0
CSR Racing 2	5	257100	0
IMDb Movies & TV - Trailers and Showtimes	5	183425	0
AdVenture Capitalist	5	181359	0

SELECT track_name, user_rating_ver, rating_count_tot, price
FROM app
WHERE user_rating_ver = 5
ORDER BY rating_count_tot DESC
LIMIT 10;

Facebook	0
Instagram	0
Clash of Clans	0
Temple Run	0
Pandora - Music & Radio	0
Pinterest	0
Bible	0
Candy Crush Saga	0
Spotify Music	0
Angry Birds	0

## Deliverables 
You need to submit a `.sql` file that includes the queries used to answer the questions above, as well as an `.md` file including your answers. 
