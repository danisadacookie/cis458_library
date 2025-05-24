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