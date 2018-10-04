CREATE TABLE Campgrounds(
CampGroundId INT PRIMARY KEY IDENTITY(1,1),
FullName varchar(30),
Phone varchar(30),
FullAddress varchar(255)
)

CREATE TABLE Amenity(
AmenityId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT,
AmenitySets varchar(255),
)

CREATE TABLE CampType(
CampTypeId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT,
Types varchar(255)
)

CREATE TABLE Campsites(
CampsiteId INT PRIMARY KEY IDENTITY(1,1),
CampgroundId INT FOREIGN KEY REFERENCES Campgrounds(CampgroundId),
FullName varchar(30),
CampTypeId INT FOREIGN KEY REFERENCES CampType(CampTypeId),
Capacity INT,
HasShade varchar(3),
ToAmenityId INT FOREIGN KEY REFERENCES Amenity(AmenityId),
Price float
)



CREATE TABLE Users(
UserId INT PRIMARY KEY IDENTITY(1,1),
FullName varchar(30),
Email varchar(255),
PhoneNumber varchar(30),
RegistrationdDate DATETIME DEFAULT GETDATE()
)

CREATE TABLE Reservations(
ResId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
UserId INT FOREIGN KEY REFERENCES Users(UserId),
ReservationdDate DATETIME DEFAULT GETDATE(),
ResDays INT
)
