
-- PROCEDURE 1: Search Movies (MULTIPLE ROWS)
-- Used in: Search Form
-- Uses: SysRefCursor (multiple rows)

CREATE OR REPLACE PROCEDURE SearchMovies
    (keyword IN VARCHAR2, results OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN results FOR
        SELECT MovieID, Title, Genre, ReleaseYear, AvgRating
        FROM Movies
        WHERE UPPER(Title) LIKE UPPER('%' || keyword || '%');
END;
/



-- PROCEDURE 2: Get Movie Details (ONE ROW)
-- Used in: Search Form (after selecting a movie)
-- Uses: OUT parameters, NO SysRefCursor

CREATE OR REPLACE PROCEDURE GetMovieDetails
    (MID       IN  NUMBER,
     MTitle    OUT VARCHAR2,
     MGenre    OUT VARCHAR2,
     MDesc     OUT VARCHAR2,
     MYear     OUT NUMBER,
     MRating   OUT NUMBER)
AS
BEGIN
    SELECT Title, Genre, Description, ReleaseYear, AvgRating
    INTO MTitle, MGenre, MDesc, MYear, MRating
    FROM Movies
    WHERE MovieID = MID;
END;
/



-- PROCEDURE 3: Get Reviews for a Movie (MULTIPLE ROWS)
-- Used in: Search Form (view reviews section)
-- Uses: SysRefCursor (multiple rows)

CREATE OR REPLACE PROCEDURE GetMovieReviews
    (MID IN NUMBER, ReviewList OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN ReviewList FOR
        SELECT U.Username, R.ReviewText
        FROM Reviews R, Users U
        WHERE R.UserID = U.UserID
          AND R.MovieID = MID;
END;
/



-- PROCEDURE 4: Get Max RatingID (ONE ROW / single value)
-- Used in: Rating Form (to generate new RatingID)
-- Uses: OUT parameter, NO SysRefCursor

CREATE OR REPLACE PROCEDURE GetMaxRatingID
    (RID OUT NUMBER)
AS
BEGIN
   SELECT NVL(MAX(RatingID), 0)
INTO RID
FROM Ratings;
END;
/

  

-- PROCEDURE 5: Get Max ReviewID (ONE ROW / single value)
-- Used in: Review Form (to generate new ReviewID)
-- Uses: OUT parameter, NO SysRefCursor

CREATE OR REPLACE PROCEDURE GetMaxReviewID
    (RID OUT NUMBER)
AS
BEGIN
    SELECT NVL(MAX(ReviewID), 0)
    INTO RID
    FROM Reviews;
END;
/



-- PROCEDURE 6: Insert New Rating
-- Used in: Rating Form (Rent button equivalent)

CREATE OR REPLACE PROCEDURE InsertRating
    (RID NUMBER, UID NUMBER, MID NUMBER, RVal NUMBER)
AS
BEGIN
    INSERT INTO Ratings (RatingID, UserID, MovieID, RatingValue)
    VALUES (RID, UID, MID, RVal);

    -- Also update the AvgRating in Movies table
    UPDATE Movies
    SET AvgRating = (
        SELECT AVG(RatingValue)
        FROM Ratings
        WHERE MovieID = MID
    )
    WHERE MovieID = MID;
END;
/



-- PROCEDURE 7: Insert New Review
-- Used in: Review Form

CREATE OR REPLACE PROCEDURE InsertReview
    (RID NUMBER, UID NUMBER, MID NUMBER, RTxt VARCHAR2)
AS
BEGIN
    INSERT INTO Reviews (ReviewID, UserID, MovieID, ReviewText)
    VALUES (RID, UID, MID, RTxt);
END;
/



-- PROCEDURE 8: Get All Movies (MULTIPLE ROWS)
-- Used in: both forms to load movie lists
-- Uses: SysRefCursor

CREATE OR REPLACE PROCEDURE GetAllMovies
    (MovieList OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN MovieList FOR
        SELECT MovieID, Title, Genre, ReleaseYear, AvgRating
        FROM Movies
        ORDER BY AvgRating DESC;
END;
/

COMMIT;