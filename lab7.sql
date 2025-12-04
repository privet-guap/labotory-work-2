CREATE TABLE Tours (

  Tour_ID INT PRIMARY KEY,

  Route_ID SMALLINT NOT NULL,

  Client_ID INT NOT NULL,

  Departure_Date DATE NOT NULL,

  Duration SMALLINT NOT NULL

);

 

INSERT INTO Tours (Tour_ID, Route_ID, Client_ID, Departure_Date, Duration)

VALUES

  (1, 1, 101, '2023-07-01', 7),

  (2, 2, 102, '2023-07-10', 5),

  (3, 3, 103, '2023-07-15', 4),

  (4, 4, 104, '2023-07-20', 10),

  (5, 5, 105, '2023-07-25', 14),

  (6, 6, 106, '2023-08-01', 7);

SELECT * FROM Tours;