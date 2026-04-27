-- Users Table
CREATE TABLE APP_Users (
    UserID    NUMBER PRIMARY KEY,
    Username  VARCHAR2(50) NOT NULL,
    Email     VARCHAR2(100) NOT NULL UNIQUE,
    Password  VARCHAR2(100) NOT NULL
);

-- Movies Table
CREATE TABLE APP_Movies (
    MovieID      NUMBER PRIMARY KEY,
    Title        VARCHAR2(200) NOT NULL,
    Genre        VARCHAR2(50),
    Description  VARCHAR2(500),
    ReleaseYear  NUMBER,
    AvgRating    NUMBER(3,1) DEFAULT 0
);

-- Ratings Table
CREATE TABLE APP_Ratings (
    RatingID     NUMBER PRIMARY KEY,
    UserID       NUMBER REFERENCES APP_Users(UserID),
    MovieID      NUMBER REFERENCES APP_Movies(MovieID),
    RatingValue  NUMBER(2,0) CHECK (RatingValue BETWEEN 1 AND 10)
);

-- Reviews Table
CREATE TABLE APP_Reviews (
    ReviewID    NUMBER PRIMARY KEY,
    UserID      NUMBER REFERENCES APP_Users(UserID),
    MovieID     NUMBER REFERENCES APP_Movies(MovieID),
    ReviewText  VARCHAR2(1000) NOT NULL
);

-- Sample Data

INSERT INTO APP_Movies VALUES (1, 'Inception', 'Sci-Fi', 
    'A thief who enters dreams', 2010, 0);

INSERT INTO APP_Movies VALUES (2, 'The Dark Knight', 'Action', 
    'Batman vs Joker', 2008, 0);

INSERT INTO APP_Movies VALUES (3, 'Interstellar', 'Sci-Fi', 
    'Space exploration to save humanity', 2014, 0);

INSERT INTO APP_Movies VALUES (4, 'Parasite', 'Thriller', 
    'A poor family infiltrates a rich household', 2019, 0);

INSERT INTO APP_Movies VALUES (5, 'The Godfather', 'Crime', 
    'A powerful mafia family story', 1972, 0);

INSERT INTO APP_Users VALUES (1, 'Boody', 'boody@email.com', 'pass123');
INSERT INTO APP_Users VALUES (2, 'Ahmed', 'ahmed@email.com', 'pass456');

COMMIT;