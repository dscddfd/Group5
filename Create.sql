CREATE TABLE Campgrounds(
CampGroundId INT PRIMARY KEY IDENTITY(1,1),
FullName varchar(30),
Phone varchar(30),
FullAddress varchar(255)
)


CREATE TABLE Campsites(
CampsiteId INT PRIMARY KEY IDENTITY(1,1),
CampgroundId INT FOREIGN KEY REFERENCES Campgrounds(CampgroundId),
CampsiteAmenityId INT FOREIGN KEY REFERENCES CampsiteToAmenity(CampsiteAmenityId),
FullName varchar(30),
Capacity INT,
HasShade varchar(3),
Price float
)

CREATE TABLE CampsiteToAmenity(
  CampsiteAmenityId INT PRIMARY KEY IDENTITY(1,1),
  CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
  AmenityId INT FOREIGN KEY REFERENCES Amenity(AmenityId)
  )
  
  

CREATE TABLE Amenity(
AmenityId INT PRIMARY KEY IDENTITY(1,1),
AmenitySet varchar(255),
)

CREATE TABLE CampType(
CampTypeId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
Types varchar(255)
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

CREATE TABLE Photos(
PhotoId INT PRIMARY KEY IDENTITY(1,1),
CampsiteId INT FOREIGN KEY REFERENCES Campsites(CampsiteId),
FileLocation varchar(255)
)
