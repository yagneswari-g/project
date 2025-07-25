create database Ariline;
use Ariline;
-- 1.flight table
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    FlightNumber VARCHAR(10) NOT NULL UNIQUE,
    Airline VARCHAR(50),
    Source VARCHAR(50),
    Destination VARCHAR(50),
    DepartureTime DATETIME,
    ArrivalTime DATETIME
);
show tables;
-- 2.customer table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);
-- 3.seats table
CREATE TABLE Seats (
    SeatID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    SeatNumber VARCHAR(10),
    Class ENUM('Economy', 'Business', 'First'),
    IsBooked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);
-- 4.Booking table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    SeatID INT,
    BookingDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Booked', 'Cancelled') DEFAULT 'Booked',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SeatID) REFERENCES Seats(SeatID)
);
-- data insertion into the tables
-- Sample Flights
INSERT INTO Flights (FlightNumber, Airline, Source, Destination, DepartureTime, ArrivalTime)
VALUES 
('AI101', 'Air India', 'Delhi', 'Mumbai', '2025-08-01 08:00:00', '2025-08-01 10:00:00'),
('6E202', 'IndiGo', 'Hyderabad', 'Chennai', '2025-08-01 09:30:00', '2025-08-01 11:00:00'),
('7E203', 'IndiGo', 'Hyderabad', 'Mumbai', '2025-08-01 09:30:00', '2025-08-01 11:00:00');

-- Sample Seats
INSERT INTO Seats (FlightID, SeatNumber, Class)
VALUES 
(1, '1A', 'Business'),
(1, '1B', 'Business'),
(1, '12C', 'Economy'),
(2, '10A', 'Economy');

-- Sample Customers
INSERT INTO Customers (FullName, Email, Phone)
VALUES 
('Ravi Kumar', 'ravi@example.com', '9876543210'),
('Sneha Reddy', 'sneha@example.com', '8765432109');

-- Sample Bookings
INSERT INTO Bookings (CustomerID, SeatID)
VALUES 
(1, 1),
(2, 4);
-- select 
select * from Flights;
select * from Customers;
select * from Seats;
select * from Bookings;

-- queries
-- 1.Available Seats in a Flight
SELECT s.SeatNumber, s.Class 
FROM Seats s 
JOIN Flights f ON s.FlightID = f.FlightID 
WHERE f.FlightNumber = 'AI101' AND s.IsBooked = FALSE;
-- 2.Flight Search by Source & Destination
SELECT * FROM Flights 
WHERE Source = 'Delhi' AND Destination = 'Mumbai';
-- 3.Booking Summary
SELECT c.FullName, f.FlightNumber, s.SeatNumber, b.BookingDate, b.Status
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN Seats s ON b.SeatID = s.SeatID
JOIN Flights f ON s.FlightID = f.FlightID;
-- Triggers
-- After Insert Booking → Mark Seat as Booked
DELIMITER //
CREATE TRIGGER AfterBookingInsert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
  UPDATE Seats SET IsBooked = TRUE WHERE SeatID = NEW.SeatID;
END;
//
DELIMITER ;
-- After Cancel Booking → Mark Seat as Available
DELIMITER //
CREATE TRIGGER AfterBookingCancel
AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
  IF NEW.Status = 'Cancelled' THEN
    UPDATE Seats SET IsBooked = FALSE WHERE SeatID = NEW.SeatID;
  END IF;
END;
//
DELIMITER ;
-- views
--  Available Flights and Seats
CREATE VIEW AvailableSeats AS
SELECT f.FlightNumber, s.SeatNumber, s.Class 
FROM Flights f
JOIN Seats s ON f.FlightID = s.FlightID
WHERE s.IsBooked = FALSE;
select * from AvailableSeats;








