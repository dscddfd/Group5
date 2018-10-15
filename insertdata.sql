/*GROUP FIVE
Group Assignment Two

Ben
Chao
Mackenzie
*/



/*-------------------TABLES-------------------------------- */

CREATE TABLE Campgrounds(
CampGroundId INT PRIMARY KEY IDENTITY(1,1),
CampGroundName varchar(30),
Phone varchar(30),
HouseNumber varchar(30),
Street varchar(30),
City varchar(30),
StateProvince varchar(30),
ZipPostalCode varchar(30)
)
SET IDENTITY_INSERT dbo.Campgrounds ON;
INSERT CAMPGROUNDS (CampGroundId, CampGroundName, Phone, HouseNumber, Street, City, StateProvince, ZipPostalCode) 
			VALUES ('1','Monte Cristo','801-745-3215','45 S','100 W','Woodruff','UT','84086'),
				   ('2','Bridger Bay Campground','801-773-2941','4528 W','1700 S','Syracuse','UT','84075');
SET IDENTITY_INSERT dbo.Campgrounds OFF;
/*SELECT
*
FROM
Campgrounds*/

CREATE TABLE CampHost(
CampHostId INT PRIMARY KEY IDENTITY(1,1),
CampgroundId INT FOREIGN KEY REFERENCES Campgrounds(CampgroundId),
HostPhoneNum varchar(250),
HostFirstName varchar(250),
HostLastName varchar(250)
)
SET IDENTITY_INSERT dbo.CampHost ON;
INSERT 
	CampHost(CampHostId, CampgroundId, HostPhoneNum, HostFirstName, HostLastName) 
VALUES 
	('801','1','801-555-1234','Daniel','Ocean'),
	('802','2','801-555-5678','Ellen','Ripley');
SET IDENTITY_INSERT dbo.CampHost OFF;


CREATE TABLE Campsites(
CampsiteId INT PRIMARY KEY IDENTITY(1,1),
--CampsiteAmenityId INT FOREIGN KEY REFERENCES CampsiteToAmenity(CampsiteAmenityId),
CampsiteName varchar(30),
Capacity INT,
HasShade varchar(3),
Price float,
CampgroundId INT FOREIGN KEY REFERENCES Campgrounds(CampgroundId),
CampTypeId INT
)
SET IDENTITY_INSERT dbo.Campsites ON;
INSERT CAMPSITES (CampsiteId, CampsiteName, Capacity, HasShade, Price, CampgroundId, CampTypeId) 
VALUES 
('1','Single Site One','10','Y','23','1','201'),
('2','Single Site Two','5','Y','23','1','202'),
('3','Single Site Three','15','N','23','1','202'),
('4','Single Site Four','5','Y','23','1','201'),
('5','Group Site Five','80','N','210','1','202'),
('6','Group Site Six','100','Y','210','1','201'),
('7','Bridger Bay 01','80','N','20','2','201'),
('8','Bridger Bay 02','8','N','20','2','201'),
('9','Bridger Bay 03','8','N','20','2','201'),
('10','Bridger Bay 04','8','N','20','2','201'),
('11','Bridger Bay 05','8','N','20','2','201')
SET IDENTITY_INSERT dbo.Campsites OFF;

/*SELECT *
FROM Campsites*/



CREATE TABLE Amenity(
AmenityId INT PRIMARY KEY IDENTITY(1,1),
AmenityDescription varchar(255),
)
SET IDENTITY_INSERT dbo.Amenity ON;
INSERT Amenity (AmenityId, AmenityDescription) 
VALUES ('100','Fire Pit'),
('101','Showers'),
('102','Flush Toilets'),
('103','Full Hookups'),
('104','Partial Hookups'),
('105','Pools'),
('106','Laundry'),
('107','Pet Friendly'),
('108','Group Options'),
('109','Electric Hookup'),
('110','Pit Toilets'),
('111','Wood'),
('112','Handicap Accessible');

SET IDENTITY_INSERT dbo.Amenity OFF;
/*
SELECT * 
FROM Amenity
*/


CREATE TABLE CampsitesToAmenities(
  CampsiteAmenityId INT PRIMARY KEY IDENTITY(1,1),
  CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
  AmenityId INT FOREIGN KEY REFERENCES Amenity(AmenityId)
  )
SET IDENTITY_INSERT dbo.CampsitesToAmenities ON;
INSERT CampsitesToAmenities (CampsiteAmenityId, CampsiteId, AmenityId) 
VALUES ('700','1','100'),
('701','1','101'),
('702','1','102'),
('703','1','103'),
('704','1','107'),
('705','1','105'),
('706','2','100'),
('707','2','101'),
('708','2','110'),
('709','2','104'),
('710','3','107'),
('711','3','106'),
('712','3','100'),
('713','3','102'),
('714','4','107'),
('715','4','100'),
('716','4','105'),
('717','4','104'),
('718','4','109'),
('719','4','101'),
('720','4','111'),
('721','5','104'),
('722','5','100'),
('723','5','105'),
('724','5','110'),
('725','6','110'),
('726','6','100'),
('727','6','108'),
('728','6','104'),
('732','7','100'),
('733','8','100'),
('734','9','100'),
('735','10','100'),
('736','11','100'),
('747','7','110'),
('748','8','110'),
('749','9','110'),
('750','10','110'),
('751','11','110'),
('762','7','107'),
('763','8','107'),
('764','9','107'),
('765','10','107'),
('766','11','107')

SET IDENTITY_INSERT dbo.CampsitesToAmenities OFF;

CREATE TABLE CampType(
CampTypeId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
TypeName varchar(255)
)

SET IDENTITY_INSERT dbo.CampType ON;
INSERT CAMPTYPE (CampTypeId, TypeName) 
VALUES 
('201','Tent Only'),
('202','Large Camper'),
('203','Small Camper'),
('204','Tent or Large Camper'),
('205','Tent or Small Camper');

SET IDENTITY_INSERT dbo.CampType OFF;


CREATE TABLE Users(
UserId INT PRIMARY KEY IDENTITY(1,1),
FullName varchar(30),
Email varchar(255),
PhoneNumber varchar(30),
RegistrationDate DATE
)
SET IDENTITY_INSERT dbo.Users ON;
INSERT USERS (UserId, FullName, Email, PhoneNumber, RegistrationDate) 
VALUES ('400','Ronald Regan','RRegan11@gmail.com','555-554-0001','2018-03-03'),
('401','Abraham Lincoln','AbeLincoln@aol.com','555-553-0002','2018-03-12'),
('402','Meredith Grey','MeredithGrey@gmail.com','555-552-0003','2018-06-22'),
('403','Derek Shepard','DrDerekShepard@yahoo.com','555-551-0009','2018-06-23'),
('404','Alex Karev','AlexKarev123@gmail.com','555-550-0010','2018-09-30'),
('405','Miranda Bailey','MBailey43@gmail.com','555-543-2314','2018-07-20'),
('406','Jackson Avery','JAveryMD@msn.com','555-626-8700','2018-05-01');

SET IDENTITY_INSERT dbo.Users OFF;




CREATE TABLE Reservations(
ResId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
UserId INT FOREIGN KEY REFERENCES Users(UserId),
ReservationDate DATE
)
--Drop table Reservations
SET IDENTITY_INSERT dbo.Reservations ON;
INSERT RESERVATIONS (ResId, CampsiteId, UserId, ReservationDate) 
VALUES ('500','1','400','2019-05-01'),
('501','1','400','2019-05-02'),
('502','1','400','2019-05-03'),
('503','1','400','2019-05-04'),
('504','2','401','2019-07-12'),
('505','2','401','2019-07-13'),
('506','2','401','2019-07-14'),
('507','2','401','2019-07-15'),
('508','3','402','2019-06-10'),
('509','3','402','2019-06-11'),
('510','4','403','2019-06-10'),
('511','4','403','2019-06-11'),
('512','4','403','2019-06-12'),
('513','5','405','2019-07-15'),
('514','5','405','2019-07-16'),
('515','5','405','2019-07-17'),
('516','5','405','2019-07-18'),
('517','5','405','2019-07-19'),
('518','6','406','2019-08-22'),
('519','6','406','2019-08-23'),
('520','6','406','2019-08-24'),
('521','1','400','2019-07-21'),
('522','1','400','2019-07-22'),
('523','3','403','2019-08-03'),
('524','3','403','2019-08-04'),
('525','2','404','2019-05-28'),
('526','2','404','2019-05-29'),
('527','10','400','2019-06-10'),
('528','10','400','2019-06-11'),
('529','10','400','2019-06-12'),
('530','11','402','2019-07-15'),
('531','11','402','2019-07-16'),
('532','11','402','2019-07-17'),
('533','11','402','2019-07-18'),
('534','11','402','2019-07-19')
SET IDENTITY_INSERT dbo.Reservations OFF;

CREATE TABLE Photos(
PhotoId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
CampgroundId INT FOREIGN KEY REFERENCES Campgrounds(CampgroundId),
FileLocation varchar(255)
)
SET IDENTITY_INSERT dbo.Photos ON;

INSERT PHOTOS (PhotoID, CampsiteID, CampgroundId, FileLocation) 
VALUES ('001','1','1','folder/photos/campground1/campsite1/pic1.jpg'),
('002','2','1','folder/photos/campground1/campsite2/pic2.jpg'),
('003','3','1','folder/photos/campground1/campsite3/pic3.jpg'),
('004','4','1','folder/photos/campground1/campsite4/pic4.jpg'),
('005','5','1','folder/photos/campground1/campsite5/pic5.jpg'),
('006','6','1','folder/photos/campground1/campsite6/pic6.jpg'),
('007','10','2','folder/photos/campground2/campsite10/pic7.jpg'),
('008','11','2','folder/photos/campground2/campsite11/pic8.jpg')


SET IDENTITY_INSERT dbo.Photos OFF;

DROP TABLE CampHost
DROP TABLE Campsites --1
DROP TABLE Campgrounds --2
DROP TABLE Users  --3
DROP TABLE Amenity --4
DROP TABLE CampType --t
DROP TABLE CampsitesToAmenities
DROP TABLE Reservations --t
DROP TABLE Photos --t


