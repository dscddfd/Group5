

--Insert statements for 2 new users of your system
SET IDENTITY_INSERT dbo.Users ON;
INSERT USERS (UserId, FullName, Email, PhoneNumber, RegistrationDate) 
VALUES ('407','Bill Clinton','BillClinton@gmail.com','555-554-0330','2018-09-23'),
('408','Jimmy Carter','PresJimCarter@aol.com','555-553-0072','2018-02-22')

SET IDENTITY_INSERT dbo.Users OFF;

--Inert statments for reservations by these two new people for 4 day stays at one of your campgrounds


SET IDENTITY_INSERT dbo.Reservations ON;
INSERT RESERVATIONS (ResId, CampsiteId, UserId, ReservationDate) 
VALUES ('538','16','407','2019-05-01'),
('539','16','407','2019-05-02'),
('540','16','407','2019-05-03'),
('541','16','407','2019-05-04'),
('542','15','408','2019-07-12'),
('544','15','408','2019-05-13'),
('545','15','408','2019-05-14'),
('546','15','408','2019-05-15')
SET IDENTITY_INSERT dbo.RESERVATIONS OFF;
