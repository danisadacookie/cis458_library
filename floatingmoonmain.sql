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
 
INSERT INTO Member (memberID, accountName, accountPassword) VALUES
('01','ppenguin','pppenguin123'),
('02','itskoala','kocakola123'),
('03','by.panda','pandada123'),
('04','bunbun','bunny123'),
('05','vixwn','vix123');

INSERT INTO Staff VALUES
('11','lotus','2000-01-01','lotus@gmail.com','001002','hr','50','2025-01-01'),
('12','hyacinth','2000-02-02','hya@gmail.com','002003','hr','50','2025-01-01'),
('13','rose','2000-03-03','rose@gmail.com','003004','it','60','2025-01-01'),
('14','cherry','2000-04-04','cherry@gmail.com','004005','it','60','2025-01-01'),
('15','violet','2000-05-05','violet@gmail.com','005006','pr','50','2025-01-01');

INSERT INTO Subscription (subscriptionID, outletName) VALUES
('91','Baltimore Banner'),
('92','Baltimore Watchdog'),
('93','Baltimore Fishbowl'),
('94','Baltimore Daily'),
('95','MyTV Baltimore');

INSERT INTO Profile VALUES
('031','pink panda','eng','03','501','91'),
('032','red panda','eng','03','502','92'),
('033','blue panda','eng','03','502','93'),
('051','dan vixen','eng','05','502','94'),
('052','lam vixen','eng','05','505','95');

INSERT INTO Profile_likedItems VALUES
('031','The high desert'),
('031','Why didnt we riot?'),
('031','This violent empire'),
('031','Between the World and Me'),
('031','Savage Inequalities'),
('031','Teaching Community');

INSERT INTO Item (itemID, title, category, author) VALUES
('501','Casual','music','Chappell Roan'),
('502','Hot to go','music','Chappell Roan'),
('503','Space Oddity','music','David Bowie'),
('504','Heroes','music','David Bowie'),
('505','Starman','music','David Bowie'),
('506','Why didnt we riot?','ebook','Issac J. Bailey'),
('507','My vanishing country : a memoir','ebook','Bakari Sellers'),
('508',' Only words','ebook','Catharine MacKinnon'),
('509','The high desert','ebook','James Spooner'),
('510','Academic outsider : stories of exclusion and hope','ebook','Victoria Reyes');

INSERT INTO StreamItem value
(501, 180),
(502, 180),
(503, 200),
(504, 190),
(505, 190);

INSERT INTO BorrowItem value
(506, 5),
(507, 5),
(508, 5),
(509, 5),
(510, 5);

INSERT INTO Donation (donationID, amount, date, paymentMethod, memberID, staffID)VALUES
('81','100','2025-02-01','check','01','15'),
('82','100','2025-02-01','check','01','15'),
('83','200','2025-02-01','check','02','15'),
('84','100','2025-02-01','cash','03','15'),
('85','100','2025-02-01','check','04','15');

INSERT INTO Reserve VALUES
(0101, '2025-01-02','2025-01-02','2025-03-11', 506, '031'),
(0102, '2025-01-02','2025-01-02','2025-02-01', 507, '032'),
(0103, '2025-01-02','2025-01-02','2025-03-01', 508, '033'),
(0104, '2025-01-02','2025-01-02','2025-02-15', 509, '051'),
(0105, '2025-01-02','2025-01-02','2025-02-28', 510, '052');


-- 1. Update the price as 5 and duration as 05/05/2025 for all subscription --
UPDATE Subscription SET discountedPrice=5 WHERE subscriptionID>0; 
UPDATE Subscription SET duration='2025-05-05' WHERE subscriptionID>0; 
SELECT * FROM Subscription;

-- 2. Update phone number to member ID 01, 03 and email to member ID 05 --
UPDATE Member SET phoneNumber=990456 WHERE memberID=01; 
UPDATE Member SET phoneNumber=990678 WHERE memberID=03; 
UPDATE Member SET email='vxcie@gmail.com' WHERE memberID=05; 
SELECT * FROM Member;

-- 3 . Show all of the profiles member --
SELECT Profile.*,Member.* FROM Member JOIN Profile WHERE Member.MemberID = Profile.MemberID; 

-- 4. Calculate the average duration of stream item --
SELECT AVG(duration) FROM StreamItem; 

-- 5. List items whose Subscriptionauthor is Chappel Roan --
SELECT * FROM Item WHERE author = 'Chappell Roan';

-- 6. Find the profiles that make the lastest return item --
SELECT Profile.* FROM Profile JOIN Reserve WHERE Reserve.returnDate = (SELECT MAX(returnDate) FROM Reserve) AND Reserve.ProfileID = Profile.ProfileID;

-- 7. Display the donation ID made by cash --
SELECT DonationID FROM Donation WHERE paymentMethod = 'cash';

-- 8. Find the profile name that subscribe to the Baltimore Watchdog --
SELECT Profile.Name FROM Profile JOIN Subscription WHERE outletName='Baltimore Watchdog' AND Subscription.SubscriptionID = Profile.SubscriptionID;

-- 9. Create a view to show all liked list of profile 031 -- 
CREATE VIEW 031_Llist AS (SELECT likedItem FROM Profile_likedItems WHERE profileID='031');
SELECT * FROM 031_Llist;

-- 10. Create a view to show all David Bowie music item id and tile-- 
CREATE VIEW David_Bowie AS (SELECT itemID, title FROM Item WHERE author='David Bowie');
SELECT * FROM David_Bowie;
