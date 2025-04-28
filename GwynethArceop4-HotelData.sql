-- 1. Query to return a list of reservations that end in July 2023, including guest name, room number, and reservation dates
SELECT 
    g.FirstName, 
    g.LastName, 
    r.RoomNumber, 
    res.CheckInDate, 
    res.CheckOutDate
FROM 
    reservation res
JOIN 
    guest g ON res.GuestID = g.GuestID
JOIN 
    room r ON res.RoomID = r.RoomID
WHERE 
    MONTH(res.CheckOutDate) = 7
    AND YEAR(res.CheckOutDate) = 2023;


-- 2. Query to return a list of all reservations for rooms with a jacuzzi, displaying guest name, room number, and dates
SELECT 
    g.FirstName, 
    g.LastName, 
    r.RoomNumber, 
    res.CheckInDate, 
    res.CheckOutDate
FROM 
    reservation res
JOIN 
    guest g ON res.GuestID = g.GuestID
JOIN 
    room r ON res.RoomID = r.RoomID
WHERE 
    r.RoomType LIKE '%jacuzzi%';


-- 3. Query to return all rooms reserved for a specific guest, including name, room(s), start date, and number of guests
-- (Example guest: Jeremiah Pendergrass)
SELECT 
    g.FirstName, 
    g.LastName, 
    r.RoomNumber, 
    res.CheckInDate, 
    res.NumberOfGuest
FROM 
    reservation res
JOIN 
    guest g ON res.GuestID = g.GuestID
JOIN 
    room r ON res.RoomID = r.RoomID
WHERE 
    g.FirstName = 'Jeremiah' 
    AND g.LastName = 'Pendergrass';


-- 4. Query to return a list of rooms, reservation ID, and per-room cost, including rooms without reservations
SELECT 
    r.RoomNumber,
    res.ReservationID,
    r.PricePerNight
FROM 
    room r
LEFT JOIN 
    reservation res ON r.RoomID = res.RoomID;



-- 5. Query to return all rooms with a capacity of 3 or more beds, reserved on any date in April 2023
SELECT 
    DISTINCT r.RoomNumber
FROM 
    reservation res
JOIN 
    room r ON res.RoomID = r.RoomID
WHERE 
    r.BedCount >= 3
    AND (
        (MONTH(res.CheckInDate) = 4 AND YEAR(res.CheckInDate) = 2023) 
        OR 
        (MONTH(res.CheckOutDate) = 4 AND YEAR(res.CheckOutDate) = 2023)
    );

-- Results:
-- (Fill in results after running)

---------------------------------------------------------------------

-- 6. Query to return list of all guest names and number of reservations per guest, sorted by most reservations
SELECT 
    g.FirstName, 
    g.LastName, 
    COUNT(res.ReservationID) AS ReservationCount
FROM 
    guest g
LEFT JOIN 
    reservation res ON g.GuestID = res.GuestID
GROUP BY 
    g.GuestID, g.FirstName, g.LastName
ORDER BY 
    ReservationCount DESC, g.LastName ASC;





-- 7. Query to display guest's name, address (using Email), and phone number based on phone number
-- (Example phone number: 555-123-4567)
SELECT 
    FirstName, 
    LastName, 
    Email AS Address, 
    PhoneNumber
FROM 
    guest
WHERE 
    PhoneNumber = '555-123-4567';


