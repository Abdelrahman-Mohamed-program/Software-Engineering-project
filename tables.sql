-- Users Table
CREATE TABLE APP_Users (
    UserID    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Username  VARCHAR2(50) NOT NULL,
    Email     VARCHAR2(100) NOT NULL UNIQUE,
    Password  VARCHAR2(100) NOT NULL
);

-- Movies Table
CREATE TABLE APP_Movies (
    MovieID      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Title        VARCHAR2(200) NOT NULL,
    Genre        VARCHAR2(50),
    Description  VARCHAR2(500),
    ReleaseYear  NUMBER,
    AvgRating    NUMBER(3,1) DEFAULT 0
);

-- Ratings Table
CREATE TABLE APP_Ratings (
    RatingID     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    UserID       NUMBER REFERENCES APP_Users(UserID),
    MovieID      NUMBER REFERENCES APP_Movies(MovieID),
    RatingValue  NUMBER(2,0) CHECK (RatingValue BETWEEN 1 AND 10)
);

-- Reviews Table
CREATE TABLE APP_Reviews (
    ReviewID    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    UserID      NUMBER REFERENCES APP_Users(UserID),
    MovieID     NUMBER REFERENCES APP_Movies(MovieID),
    ReviewText  VARCHAR2(1000) NOT NULL
);


-- USERS (3 rows)
INSERT INTO APP_Users (Username, Email, Password)
VALUES ('Boody', 'boody@email.com', 'pass123');

INSERT INTO APP_Users (Username, Email, Password)
VALUES ('Ahmed', 'ahmed@email.com', 'pass456');

INSERT INTO APP_Users (Username, Email, Password)
VALUES ('Sara', 'sara@email.com', 'pass789');


-- MOVIES (3 rows)
INSERT INTO APP_Movies (Title, Genre, Description, ReleaseYear, AvgRating)
VALUES ('Inception', 'Sci-Fi', 'A thief who enters dreams', 2010, 0);

INSERT INTO APP_Movies (Title, Genre, Description, ReleaseYear, AvgRating)
VALUES ('Interstellar', 'Sci-Fi', 'Space exploration to save humanity', 2014, 0);

INSERT INTO APP_Movies (Title, Genre, Description, ReleaseYear, AvgRating)
VALUES ('Parasite', 'Thriller', 'A poor family infiltrates a rich household', 2019, 0);


-- RATINGS (3 rows) 
INSERT INTO APP_Ratings (UserID, MovieID, RatingValue)
SELECT u.UserID, m.MovieID, 9
FROM APP_Users u, APP_Movies m
WHERE u.Username = 'Boody' AND m.Title = 'Inception';

INSERT INTO APP_Ratings (UserID, MovieID, RatingValue)
SELECT u.UserID, m.MovieID, 10
FROM APP_Users u, APP_Movies m
WHERE u.Username = 'Ahmed' AND m.Title = 'Interstellar';

INSERT INTO APP_Ratings (UserID, MovieID, RatingValue)
SELECT u.UserID, m.MovieID, 8
FROM APP_Users u, APP_Movies m
WHERE u.Username = 'Sara' AND m.Title = 'Parasite';


-- REVIEWS (3 rows) 
INSERT INTO APP_Reviews (UserID, MovieID, ReviewText)
SELECT u.UserID, m.MovieID, 'Amazing concept and execution'
FROM APP_Users u, APP_Movies m
WHERE u.Username = 'Boody' AND m.Title = 'Inception';

INSERT INTO APP_Reviews (UserID, MovieID, ReviewText)
SELECT u.UserID, m.MovieID, 'Masterpiece with emotional depth'
FROM APP_Users u, APP_Movies m
WHERE u.Username = 'Ahmed' AND m.Title = 'Interstellar';

INSERT INTO APP_Reviews (UserID, MovieID, ReviewText)
SELECT u.UserID, m.MovieID, 'Very unique and thought-provoking'
FROM APP_Users u, APP_Movies m
WHERE u.Username = 'Sara' AND m.Title = 'Parasite';


COMMIT;