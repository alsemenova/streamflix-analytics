USE streamflix_db;
## Dropping existing tables if they exist
DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Movies;
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255),
    Year INT,
    Genres VARCHAR(100),
    Language VARCHAR(50),
    Country VARCHAR(100),
    TotalViews INT
);
CREATE TABLE Users (
    UserID VARCHAR(20) PRIMARY KEY,
    Age INT,
    Gender VARCHAR(50),
    Country VARCHAR(100),
    SubscriptionStatus VARCHAR(50),
    TotalWatchTime DECIMAL(10, 2),
    Device VARCHAR(50)
);
CREATE TABLE Ratings (
    RatingID INT PRIMARY KEY,
    UserID VARCHAR(20),
    MovieID INT,
    Rating DECIMAL(2, 1),
    Timestamp DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);