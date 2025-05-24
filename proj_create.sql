CREATE DATABASE floatingmoon;

Create table Member (
memberID numeric(10) unique not null primary key,
accountName varchar(20) unique not null,
accountPassword varchar(20) not null,
phoneNumber numeric(6),
email varchar(20)
);

Create table Staff ( 
staffID 		numeric(10)		unique not null primary key, 
name			varchar(20)		not null, 
dateOfBirth		datetime		not null, 
email			varchar(20)		not null, 
phoneNumber 	numeric(6), 
position		varchar(10)		not null, 
salary			numeric(10)		not null, 
hireDate		datetime		not null 
); 

Create table Item ( 
itemID			numeric(10)		unique not null primary key, 
title			varchar(50)		not null, 
category		varchar(10)		not null, 
collection		varchar(10), 
author			varchar(20)		not null, 
releaseDate		datetime, 
format			varchar(10) 
); 

Create table BorrowItem ( 
itemID			numeric(10)		unique not null primary key, 
fileSize		numeric(10)		not null, 
Foreign key (itemID) references Item(itemID) 
); 

Create table StreamItem ( 
itemID			numeric(10)		unique not null primary key, 
duration		numeric(10)		not null, 
Foreign key (itemID) references Item (itemID) 
); 
 
Create table Subscription ( 
subscriptionID	numeric(10)		unique not null primary key, 
outletName		varchar(20)		not null, 
discountedPrice	numeric(10), 
duration		datetime, 
accessLink		varchar(20)	unique 
); 

Create table Profile ( 
profileID		numeric(10)		unique not null primary key, 
name			varchar(10)		not null, 
language		varchar(10)		not null, 
memberID		numeric(10)		not null, 
itemID			numeric(10), 
subscriptionID	numeric(10), 
Foreign key (memberID) references Member (memberID), 
Foreign key (itemID) references Item (itemID), 
Foreign key (subscriptionID) references Subscription (subscriptionID) 
); 

Create table Profile_likedItems ( 
profileID		numeric(10)		not null, 
likedItem		varchar(50), 
Primary key (profileID, likedItem), 
Foreign key (profileID) references Profile (profileID) 
); 

Create table Reserve ( 
reservationID 	numeric(10)		unique not null primary key, 
reserveDate		datetime		not null, 
pickupDate		datetime		not null, 
returnDate		datetime		not null, 
itemID			numeric(10)		not null, 
profileID		numeric(10)		not null, 
Foreign key (profileID) references Profile (profileID), 
Foreign key (itemID) references Item (itemID) 
); 

Create table Donation ( 
donationID		numeric(10)		unique not null primary key, 
donorName		varchar(20), 
amount			numeric(10)		not null, 
date			datetime		not null, 
paymentMethod	varchar(5)		not null, 
purpose			varchar(20), 
acknowledgement	varchar(20), 
memberID		numeric(10)		not null, 
staffID 		numeric(10)		not null, 
FOREIGN KEY (memberID) REFERENCES Member (memberID),  
FOREIGN KEY (staffID) REFERENCES Staff (staffID) 
); 
 
