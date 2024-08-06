CREATE DATABASE AutomotiveDB;

USE AutomotiveDB;

CREATE TABLE UnnormalizedCars (
    CarID INT,
    CarModel VARCHAR(100),
    OwnerName VARCHAR(100),
    OwnerAddress VARCHAR(255),
    OwnerPhone VARCHAR(20),
    ServiceDates VARCHAR(255),
    ServiceDescriptions VARCHAR(255),
    TotalServiceCost DECIMAL(10, 2)
);

INSERT INTO UnnormalizedCars(CarID, CarModel, OwnerName, OwnerAddress, OwnerPhone, ServiceDates, ServiceDescriptions, TotalServiceCost) VALUES
(1, 'Toyota Camry', 'John Doe', '123 Elm St', '555-1234', '2021-01-10,2021-06-15', 'Oil Change,Tire Rotation', 150.00),
(2, 'Honda Accord', 'Alice Johnson', '456 Oak St', '555-8765', '2021-02-20,2021-08-30', 'Brake Inspection,Battery Replacement', 200.00),
(3, 'Ford Focus', 'Chris Evans', '789 Pine St', '555-6789', '2021-03-15', 'Transmission Repair', 500.00),
(4, 'Chevrolet Malibu', 'Emily Davis', '101 Maple St', '555-9876', '2021-04-25,2021-09-10', 'Engine Tune-Up,Alignment', 300.00),
(5, 'Nissan Altima', 'David Wilson', '202 Birch St', '555-2468', '2021-05-05,2021-11-20', 'Oil Change,Brake Replacement', 250.00),
(6, 'Hyundai Elantra', 'Susan Clark', '304 Cherry St', '555-3322', '2021-04-20,2021-10-10', 'Oil Change,Air Filter', 130.00),
(7, 'BMW 320i', 'Michael Brown', '987 Walnut St', '555-7788', '2021-02-28,2021-08-05', 'Brake Inspection,Transmission Repair', 650.00),
(8, 'Audi A4', 'Jennifer Lopez', '402 Cedar St', '555-9988', '2021-03-22,2021-09-12', 'Battery Replacement,Tire Rotation', 200.00),
(9, 'Mercedes C-Class', 'Robert King', '123 Oak St', '555-5544', '2021-05-18,2021-12-01', 'Engine Tune-Up,Alignment', 450.00),
(10, 'Volkswagen Passat', 'Emily Johnson', '456 Pine St', '555-1239', '2021-06-10,2021-11-20', 'Oil Change,Brake Replacement', 300.00);

SELECT * FROM UnnormalizedCars;

CREATE TABLE Cars1NF(
carID int,
carModel varchar(100),
OwnerName varchar(100),
ownerAddress varchar(100),
ownerPhone varchar(100),
primary key (carID)
);

create table Service1NF(
serviceID int,
carID int,
serviceDate varchar(100),
serviceDescription varchar(100),
serviceCost decimal(10,2),
primary key (serviceID),
foreign key (carID) references cars1NF (carID)
);

insert into Cars1NF (carID, carModel, OwnerName, ownerAddress, ownerPhone) value
(1,	'Toyota Camry',	'John Doe',	'123 Elm St', '555-1234'),
(2,	'Honda Accord',	'Alice Johnson',	'456 Oak St', '555-8765');

select * from Cars1nf;

insert into service1nf (serviceid, carid, servicedate, servicedescription, servicecost) values 
(1,	1,	'2021-01-10', 'Oil Change',	50.00),
(2,	1,	'2021-06-15',	'Tire Rotation', 100.00),
(3,	2,	'2021-02-20',	'Brake Inspection',	100.00);

select * from service1nf;

create table owners(
ownerid int,
ownername varchar(100),
owneraddress varchar (100),
ownerphone varchar(100)
);

insert into owners(ownerid, ownername, owneraddress,ownerphone) value
(1,	'John Doe',	'123 Elm St',	'555-1234'),
(2,	'Alice Johnson',	'456 Oak St',	'555-8765');

select * from owners;

CREATE TABLE Cars2NF(
carID int,
ownerid int,
carModel varchar(100),
primary key (carID),
foreign key (ownerid) references owners (ownerid)
);

insert into cars2nf (carid, ownerid, carmodel) values
(1,	1, 'Toyota Camry'),
(2,2,	'Honda Accord');

select * from cars2nf;

create table Service2NF(
serviceID int,
carID int,
serviceDate varchar(100),
serviceDescription varchar(100),
serviceCost decimal(10,2),
primary key (serviceID),
foreign key (carID) references cars2NF (carID)
);

insert into service2nf (serviceid, carid, servicedate, servicedescription, servicecost) values 
(1,	1,	'2021-01-10', 'Oil Change',	50.00),
(2,	1,	'2021-06-15',	'Tire Rotation', 100.00),
(3,	2,	'2021-02-20',	'Brake Inspection',	100.00);

select * from service2nf;

create table servicetype (
servicetypeid int,
servicedescription varchar(100),
servicecost decimal(10,2),
primary key (servicetypeid)
);

insert into servicetype (servicetypeid,servicedescription, servicecost) values
(1,	'Oil Change',	50.00),
(2,	'Tire Rotation',	100.00);

select * from servicetype;

create table service3nf(
serviceID int,
carID int,
serviceDate varchar(100),
servicetypeid int,
primary key (serviceID),
foreign key (carID) references cars2NF (carID),
foreign key (servicetypeid) references servicetype (servicetypeid)
);



insert into service3nf (serviceid, carid, servicedate,servicetypeid) values 
(1,	1,	'2021-01-10',	1),
(2,	1,	'2021-06-15',	2);

select * from service3nf;



INSERT INTO Owners (OwnerID, OwnerName, OwnerAddress, OwnerPhone) VALUES
(1, 'John Doe', '123 Elm St', '555-1234'),
(2, 'Alice Johnson', '456 Oak St', '555-8765'),
(3, 'Chris Evans', '789 Pine St', '555-6789'),
(4, 'Emily Davis', '101 Maple St', '555-9876'),
(5, 'David Wilson', '202 Birch St', '555-2468'),
(6, 'Susan Clark', '304 Cherry St', '555-3322'),
(7, 'Michael Brown', '987 Walnut St', '555-7788'),
(8, 'Jennifer Lopez', '402 Cedar St', '555-9988'),
(9, 'Robert King', '123 Oak St', '555-5544'),
(10, 'Emily Johnson', '456 Pine St', '555-1239');

