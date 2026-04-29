-- PROCEDURE 1: Search Movies
CREATE OR REPLACE PROCEDURE APP_SearchMovies
    (p_keyword IN VARCHAR2, p_results OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_results FOR
        SELECT MovieID, Title, Genre, ReleaseYear, AvgRating
        FROM APP_Movies
        WHERE UPPER(Title) LIKE UPPER('%' || p_keyword || '%');
END;
/

-- PROCEDURE 2: Get Movie Details
CREATE OR REPLACE PROCEDURE APP_GetMovieDetails
    (p_MID       IN  NUMBER,
     p_Title     OUT VARCHAR2,
     p_Genre     OUT VARCHAR2,
     p_Desc      OUT VARCHAR2,
     p_Year      OUT NUMBER,
     p_Rating    OUT NUMBER)
AS
BEGIN
    SELECT Title, Genre, Description, ReleaseYear, AvgRating
    INTO p_Title, p_Genre, p_Desc, p_Year, p_Rating
    FROM APP_Movies
    WHERE MovieID = p_MID;
END;
/

-- PROCEDURE 3: Get Movie Reviews
CREATE OR REPLACE PROCEDURE APP_GetMovieReviews
    (p_MID IN NUMBER, p_ReviewList OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_ReviewList FOR
        SELECT U.Username, R.ReviewText
        FROM APP_Reviews R
        JOIN APP_Users U ON R.UserID = U.UserID
        WHERE R.MovieID = p_MID;
END;
/

-- PROCEDURE 4: Get Max RatingID (kept as requested)
CREATE OR REPLACE PROCEDURE APP_GetMaxRatingID
    (p_RID OUT NUMBER)
AS
BEGIN
    SELECT NVL(MAX(RatingID), 0)
    INTO p_RID
    FROM APP_Ratings;
END;
/

-- PROCEDURE 5: Get Max ReviewID (kept as requested)
CREATE OR REPLACE PROCEDURE APP_GetMaxReviewID
    (p_RID OUT NUMBER)
AS
BEGIN
    SELECT NVL(MAX(ReviewID), 0)
    INTO p_RID
    FROM APP_Reviews;
END;
/

-- PROCEDURE 6: Insert Rating (FIXED - no ID)
CREATE OR REPLACE PROCEDURE APP_InsertRating
    (p_UID NUMBER, p_MID NUMBER, p_RVal NUMBER)
AS
BEGIN
    INSERT INTO APP_Ratings (UserID, MovieID, RatingValue)
    VALUES (p_UID, p_MID, p_RVal);

    UPDATE APP_Movies
    SET AvgRating = (
        SELECT AVG(RatingValue)
        FROM APP_Ratings
        WHERE MovieID = p_MID
    )
    WHERE MovieID = p_MID;
END;
/

-- PROCEDURE 7: Insert Review (FIXED - no ID)
CREATE OR REPLACE PROCEDURE APP_InsertReview
    (p_UID NUMBER, p_MID NUMBER, p_Text VARCHAR2)
AS
BEGIN
    INSERT INTO APP_Reviews (UserID, MovieID, ReviewText)
    VALUES (p_UID, p_MID, p_Text);
END;
/

-- PROCEDURE 8: Get All Movies
CREATE OR REPLACE PROCEDURE APP_GetAllMovies
    (p_MovieList OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_MovieList FOR
        SELECT MovieID, Title, Genre, ReleaseYear, AvgRating
        FROM APP_Movies
        ORDER BY AvgRating DESC;
END;
/
COMMIT;