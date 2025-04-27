-- Step 1: Delete reservations related to Jeremiah
use yournamehoteldb;
-- Allow delete in safe mode
SET SQL_SAFE_UPDATES = 0;

-- Step 1: Delete reservations related to Jeremiah
DELETE FROM reservation
WHERE GuestID IN (
    SELECT GuestID 
    FROM guest 
    WHERE FirstName = 'Jeremiah' 
      AND LastName = 'Pendergrass'
);
-- Step 2: Delete Jeremiah from guest table
DELETE FROM guest
WHERE FirstName = 'Jeremiah' 
  AND LastName = 'Pendergrass';


