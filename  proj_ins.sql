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
