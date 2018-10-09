/*GROUP FIVE
Group Assignment Two

Ben
Chao
Mackenzie
*/

DROP TABLE Campgrounds
DROP TABLE Campsites
DROP TABLE Amenity
DROP TABLE CampType
DROP TABLE Users
DROP TABLE Reservations
DROP TABLE Photos


/*-------------------TABLES-------------------------------- */

CREATE TABLE Campgrounds(
CampGroundId INT PRIMARY KEY IDENTITY(1,1),
FullName varchar(30),
Phone varchar(30),
FullAddress varchar(255)
)
INSERT INTO Campgrounds(FullName, Phone, FullAddress) VALUES('Monte Cristo', '801-745-3215','45 S 100 W, Woodruff, UT 84086');

CREATE TABLE Campsites(
CampsiteId INT PRIMARY KEY IDENTITY(1,1),
CampgroundId INT FOREIGN KEY REFERENCES Campgrounds(CampgroundId),
FullName varchar(30),
Capacity INT,
HasShade varchar(3),
Price float
)

INSERT INTO Campsites(FullName, Capacity, HasShade, Price) VALUES('Single Site One', 10, 'YES', 23.00);
INSERT INTO Campsites(FullName, Capacity, HasShade, Price) VALUES('Single Site Two', 5, 'YES', 23.00);
INSERT INTO Campsites(FullName, Capacity, HasShade, Price) VALUES('Single Site Three', 15, 'NO', 23.00);
INSERT INTO Campsites(FullName, Capacity, HasShade, Price) VALUES('Single Site Four', 5, 'YES', 23.00);
INSERT INTO Campsites(FullName, Capacity, HasShade, Price) VALUES('Group Site Five', 80, 'NO', 210.00);
INSERT INTO Campsites(FullName, Capacity, HasShade, Price) VALUES('Group Site Six', 100, 'YES', 210.00);

CREATE TABLE Amenity(
AmenityId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
AmenitySets varchar(255)
)

INSERT INTO Amenity(AmenitySets) VALUES('Fire Pit');
INSERT INTO Amenity(AmenitySets) VALUES('Showers');
INSERT INTO Amenity(AmenitySets) VALUES('Flush Toilets');
INSERT INTO Amenity(AmenitySets) VALUES('Full Hookups');
INSERT INTO Amenity(AmenitySets) VALUES('Parrtial Hookups');
INSERT INTO Amenity(AmenitySets) VALUES('Pools');
INSERT INTO Amenity(AmenitySets) VALUES('Laundry');
INSERT INTO Amenity(AmenitySets) VALUES('Pet Friendly');
INSERT INTO Amenity(AmenitySets) VALUES('Group Options');
INSERT INTO Amenity(AmenitySets) VALUES('Tents');
INSERT INTO Amenity(AmenitySets) VALUES('Camper');
INSERT INTO Amenity(AmenitySets) VALUES('Electric Hookup');

CREATE TABLE CampType(
CampTypeId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
Types varchar(255)
)

INSERT INTO CampType(Types)VALUES('Tent');
INSERT INTO CampType(Types)VALUES('Camper');

CREATE TABLE Users(
UserId INT PRIMARY KEY IDENTITY(1,1),
FullName varchar(30),
Email varchar(255),
PhoneNumber varchar(30),
RegistrationdDate DATETIME DEFAULT GETDATE() NULL
)
--INSERT INTO Users(FullName, Email, PhoneNumber, RegistrationDate)VALUES('Ronald Regan','RRegan11@gmail.com', '555-554-0001', NULL);
--INSERT INTO Users(FullName, Email, PhoneNumber, RegistrationDate)VALUES('Abraham Lincoln','AbeLincoln@aol.com', '555-553-0002', NULL);
--INSERT INTO Users(FullName, Email, PhoneNumber, RegistrationDate)VALUES('Meredith Grey','MeredithGrey@gmail.com', '555-551-0003', NULL);
--INSERT INTO Users(FullName, Email, PhoneNumber, RegistrationDate)VALUES('Derek Shepard','DerekShepard@yahoo.com', '555-550-0004', NULL);
--INSERT INTO Users(FullName, Email, PhoneNumber, RegistrationDate)VALUES('Alex Karev','AKarev552@gmail.com', '555-550-0005', NULL);



CREATE TABLE Reservations(
ResId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
UserId INT FOREIGN KEY REFERENCES Users(UserId),
ReservationdDate DATETIME DEFAULT GETDATE() NULL,
ResDays INT
)

INSERT INTO Reservations(ReservationdDate, ResDays)VALUES(NULL, 4);
INSERT INTO Reservations(ReservationdDate, ResDays)VALUES(NULL, 1);
INSERT INTO Reservations(ReservationdDate, ResDays)VALUES(NULL, 7);
INSERT INTO Reservations(ReservationdDate, ResDays)VALUES(NULL, 3);

CREATE TABLE Photos(
PhotoId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
FileLocation varchar(255)
)

--INSERT INTO Photos(FileLocation) VALUES();



