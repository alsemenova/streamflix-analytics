SELECT COUNT(*)
FROM Movies;
SELECT COUNT(*)
FROM Users;
SELECT COUNT(*)
FROM Ratings;
SELECT *
FROM Ratings
LIMIT 5;
SELECT u.UserID,
    u.Country,
    m.Title,
    r.Rating
FROM Ratings r
    JOIN Users u ON r.UserID = u.UserID
    JOIN Movies m ON r.MovieID = m.MovieID
LIMIT 10;