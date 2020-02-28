'''Challenge 2 - Create the Database and Tables'''

CREATE TABLE Cars (
    VIN varchar(255),
    Manufacturer varchar(255),
    Model varchar(255),
    Year YEAR,
    Color varchar(255),
    PRIMARY KEY (VIN)
);

CREATE TABLE Customers (
    Customer_ID int(10),
    Customer_name varchar(255),
    Phone_number varchar(20),
    Email varchar(255),
    Address varchar(255),
    City varchar(255),
    State_Province varchar(255),
    Country varchar(255),
    Zip_code varchar(8), 
    PRIMARY KEY (Customer_ID)
);

CREATE TABLE Sales_Person (
    STAFF_ID INT(6),
    Staff_name varchar(255),
    Store varchar(255),
    PRIMARY KEY (STAFF_ID)
);

CREATE TABLE Invoices (
    Invoice_number int (32),
    Invoice_date DATE,
    carsVIN varchar(255),
    Customer_ID INT,
    STAFF_ID INT,
    PRIMARY KEY (Invoice_number),
    FOREIGN KEY (carsVIN) REFERENCES Cars(VIN),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (STAFF_ID) REFERENCES Sales_Person(STAFF_ID)
);

'''Changed the VIN of the last VOLVO from DAM41UDN3CHU2WVF6 to DAM41UDN3CHU2WVF5 as this is a unique key and therefor must be a mistake in the data (see bonus question, MySQL did not accept duplicate values to insert because I mention it as a primary key)''';

INSERT INTO cars.Cars
VALUES 	
('3K096I98581DHSNUP', 'Volkswagen', 	'Tiguan',				2019, 	'Blue'),
('ZM8G7BEUQZ97IH46V', 'Peugeot',		'Rifter', 				2019, 	'Red'),
('RKXVNNIHLVVZOUB4M', 'Ford',			'Fusion',				2018,	'White'),
('HKNDGS7CU31E9Z7JW', 'Toyota',			'RAV4',					2018,	'Silver'),
('DAM41UDN3CHU2WVF6', 'Volvo',			'V60',					2019,	'Gray'),
('DAM41UDN3CHU2WVF5', 'Volvo',			'V60 Cross Country',	2019,	'Gray');
		
INSERT INTO cars.Customers
VALUES 
(10001,	'Pablo Picasso',		'+34 636 17 63 82',		'-',	'Paseo de la Chopera, 14',	'Madrid',	'Madrid',			'Spain',			28045),
(20001,	'Abraham Lincoln',		'+1 305 907 7086',		'-',	'120 SW 8th St',			'Miami',	'Florida',			'United States',	33130),
(30001,	'Napoléon Bonaparte',	'+33 1 79 75 40 00',	'-',	'40 Rue du Colisée',		'Paris',	'Île-de-France', 	'France', 			75008);


INSERT INTO cars.Sales_Person
VALUES 
(00001,	'Pete, Cruiser',	'Madrid'),
(00002,	'Anna Sthesia',		'Barcelona'),
(00003,	'Paul Molive',		'Berlin'),
(00004,	'Gail Forcewind',	'Paris'),
(00005,	'Paige Turner',		'Mimia'),
(00006,	'Bob Frapples',		'Mexico City'),
(00007,	'Walter Melon',		'Amsterdam'),
(00008,	'Shonda Leer',		'São Paulo');

INSERT INTO cars.Invoices
VALUES 	
(852399038,	'2018-08-22',	'3K096I98581DHSNUP', 20001,	00004),
(731166526,	'2018-12-31',	'HKNDGS7CU31E9Z7JW', 10001,	00005),
(271135104,	'2019-01-22',	'ZM8G7BEUQZ97IH46V', 30001,	00007);


'''Bonus'''
