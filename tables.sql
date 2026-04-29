-- USERS TABLE
CREATE TABLE APP_Users (
    UserID    NUMBER PRIMARY KEY,
    Username  VARCHAR2(50) NOT NULL,
    Email     VARCHAR2(100) NOT NULL UNIQUE,
    Password  VARCHAR2(100) NOT NULL
);

-- MOVIES TABLE
CREATE TABLE APP_Movies (
    MovieID      NUMBER PRIMARY KEY,
    Title        VARCHAR2(200) NOT NULL,
    Genre        VARCHAR2(50),
    Description  VARCHAR2(500),
    ReleaseYear  NUMBER,
    AvgRating    NUMBER(3,1) DEFAULT 0
);

-- RATINGS TABLE
CREATE TABLE APP_Ratings (
    RatingID     NUMBER PRIMARY KEY,
    UserID       NUMBER REFERENCES APP_Users(UserID),
    MovieID      NUMBER REFERENCES APP_Movies(MovieID),
    RatingValue  NUMBER(2,0) CHECK (RatingValue BETWEEN 1 AND 10)
);

-- REVIEWS TABLE
CREATE TABLE APP_Reviews (
    ReviewID    NUMBER PRIMARY KEY,
    UserID      NUMBER REFERENCES APP_Users(UserID),
    MovieID     NUMBER REFERENCES APP_Movies(MovieID),
    ReviewText  VARCHAR2(1000) NOT NULL
);


----------------------------------------------------
-- USERS (3 rows)
----------------------------------------------------
INSERT INTO APP_Users VALUES (1, 'Boody', 'boody@email.com', 'pass123');
INSERT INTO APP_Users VALUES (2, 'Ahmed', 'ahmed@email.com', 'pass456');
INSERT INTO APP_Users VALUES (3, 'Sara',  'sara@email.com',  'pass789');


----------------------------------------------------
-- MOVIES (3 rows)
----------------------------------------------------
INSERT INTO APP_Movies VALUES (1, 'Inception', 'Sci-Fi', 'A thief who enters dreams', 2010, 0);
INSERT INTO APP_Movies VALUES (2, 'Interstellar', 'Sci-Fi', 'Space exploration to save humanity', 2014, 0);
INSERT INTO APP_Movies VALUES (3, 'Parasite', 'Thriller', 'A poor family infiltrates a rich household', 2019, 0);


----------------------------------------------------
-- RATINGS (3 rows)
----------------------------------------------------
INSERT INTO APP_Ratings VALUES (1,
    (SELECT UserID FROM APP_Users WHERE Username = 'Boody'),
    (SELECT MovieID FROM APP_Movies WHERE Title = 'Inception'),
    9
);

INSERT INTO APP_Ratings VALUES (2,
    (SELECT UserID FROM APP_Users WHERE Username = 'Ahmed'),
    (SELECT MovieID FROM APP_Movies WHERE Title = 'Interstellar'),
    10
);

INSERT INTO APP_Ratings VALUES (3,
    (SELECT UserID FROM APP_Users WHERE Username = 'Sara'),
    (SELECT MovieID FROM APP_Movies WHERE Title = 'Parasite'),
    8
);


----------------------------------------------------
-- REVIEWS (3 rows)
----------------------------------------------------
INSERT INTO APP_Reviews VALUES (1,
    (SELECT UserID FROM APP_Users WHERE Username = 'Boody'),
    (SELECT MovieID FROM APP_Movies WHERE Title = 'Inception'),
    'Amazing concept and execution'
);

INSERT INTO APP_Reviews VALUES (2,
    (SELECT UserID FROM APP_Users WHERE Username = 'Ahmed'),
    (SELECT MovieID FROM APP_Movies WHERE Title = 'Interstellar'),
    'Masterpiece with emotional depth'
);

INSERT INTO APP_Reviews VALUES (3,
    (SELECT UserID FROM APP_Users WHERE Username = 'Sara'),
    (SELECT MovieID FROM APP_Movies WHERE Title = 'Parasite'),
    'Very unique and thought-provoking'
);

COMMIT;