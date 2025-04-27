-- Drop the database if it already exists
DROP DATABASE IF EXISTS GwynethArceoHotelDB;

-- Create a fresh database
CREATE DATABASE GwynethArceoHotelDB;

-- Use the new database
USE GwynethArceoHotelDB;

-- Create the Guest tableguest
CREATE TABLE Guest (
    GuestID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NULL,
    PhoneNumber VARCHAR(15) NULL
);

-- Create the Room table
CREATE TABLE Room (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber VARCHAR(10) NOT NULL,
    RoomType VARCHAR(50) NOT NULL,
    BedCount INT NOT NULL,
    PricePerNight DECIMAL(8,2) NOT NULL,
    IsAvailable BOOLEAN NOT NULL
);

-- Create the Reservation table
CREATE TABLE Reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    GuestID INT NOT NULL,
    RoomID INT NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    NumberOfGuests INT NOT NULL,
    
    -- Define the foreign keys
    CONSTRAINT FK_Reservation_Guest FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    CONSTRAINT FK_Reservation_Room FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);
