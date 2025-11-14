--Data viewing 
--Show the tables 
SELECT * FROM Users;
SELECT * FROM Movies;
SELECT * FROM Ratings;

--1. Check Row Counts
SELECT COUNT(*) AS user_count FROM Users;
SELECT COUNT(*) AS movie_count FROM Movies;
SELECT COUNT(*) AS rating_count FROM Ratings;

--2. Preview Data in Each Table
SELECT * FROM Users LIMIT 5;
SELECT * FROM Movies LIMIT 5;
SELECT * FROM Ratings LIMIT 5;


--Data understanding 

--3. Join Tables: Who Rated Which Movie? (first 10 ratings)

SELECT Ratings.user_id, Ratings.movie_id, Users.gender, Users.location, Movies.title, Movies.genre,
       Ratings.rating, Ratings.review_text, Ratings.date_rated
FROM Ratings
JOIN Users ON Ratings.user_id = Users.user_id
JOIN Movies ON Ratings.movie_id = Movies.movie_id
LIMIT 10;

--4. Aggregate: Average Rating Per Movie(Most-rated or best-rated movies:)

SELECT Movies.title, AVG(Ratings.rating) AS avg_rating, COUNT(*) AS num_ratings
FROM Ratings
JOIN Movies ON Ratings.movie_id = Movies.movie_id
GROUP BY Ratings.movie_id
ORDER BY avg_rating DESC
LIMIT 10;

--5. Breakdown by User Location (Which locations are most active?)

SELECT Users.location, COUNT(*) AS total_ratings
FROM Ratings
JOIN Users ON Ratings.user_id = Users.user_id
GROUP BY Users.location
ORDER BY total_ratings DESC;


--6. Popular Genre by Ratings (Genres with most total ratings)

SELECT Movies.genre, COUNT(*) AS total_ratings
FROM Ratings
JOIN Movies ON Ratings.movie_id = Movies.movie_id
GROUP BY Movies.genre
ORDER BY total_ratings DESC;


--7. Distribution of Ratings ( How are ratings distributed? )

SELECT rating, COUNT(*) AS count
FROM Ratings
GROUP BY rating
ORDER BY rating;

--- Data preprocessing (how many missing values are in each column)
---- For Users Table
SELECT 
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS missing_location,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS missing_age
FROM Users;

--For Movies Table
SELECT 
    SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) AS missing_title,
    SUM(CASE WHEN genre IS NULL THEN 1 ELSE 0 END) AS missing_genre,
    SUM(CASE WHEN release_year IS NULL THEN 1 ELSE 0 END) AS missing_release_year,
    SUM(CASE WHEN duration_minutes IS NULL THEN 1 ELSE 0 END) AS missing_duration_minutes
FROM Movies;

--For Ratings Table
SELECT 
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS missing_rating,
    SUM(CASE WHEN review_text IS NULL THEN 1 ELSE 0 END) AS missing_review_text,
    SUM(CASE WHEN date_rated IS NULL THEN 1 ELSE 0 END) AS missing_date_rated,
    SUM(CASE WHEN minutes_watched IS NULL THEN 1 ELSE 0 END) AS missing_minutes_watched
FROM Ratings;

--missing values row and its column in table (before treating them)
SELECT * FROM Users WHERE gender IS NULL OR location IS NULL OR age IS NULL;
SELECT * FROM Movies WHERE title IS NULL OR genre IS NULL OR release_year IS NULL OR duration_minutes IS NULL;
SELECT * FROM Ratings WHERE rating IS NULL OR review_text IS NULL OR date_rated IS NULL OR minutes_watched IS NULL;



--1. For Numeric Columns — Replace NULL with 0
UPDATE Users SET age = 0 WHERE age IS NULL;
UPDATE Movies SET release_year = 0 WHERE release_year IS NULL;
UPDATE Movies SET duration_minutes = 0 WHERE duration_minutes IS NULL;
UPDATE Ratings SET rating = 0 WHERE rating IS NULL;
UPDATE Ratings SET minutes_watched = 0 WHERE minutes_watched IS NULL;

--2. For Text Columns — Replace NULL with "unknown"
UPDATE Users SET gender = 'unknown' WHERE gender IS NULL;
UPDATE Users SET location = 'unknown' WHERE location IS NULL;
UPDATE Movies SET title = 'unknown' WHERE title IS NULL;
UPDATE Movies SET genre = 'unknown' WHERE genre IS NULL;

UPDATE Ratings SET review_text = 'unknown' WHERE review_text IS NULL;
UPDATE Ratings SET date_rated = 'unknown' WHERE date_rated IS NULL;

----If you want to check which rows still have missing data ( after treating missing values):
SELECT * FROM Users WHERE age IS NULL OR gender IS NULL OR location IS NULL;
SELECT * FROM Movies WHERE title IS NULL OR genre IS NULL OR release_year IS NULL OR duration_minutes IS NULL;
SELECT * FROM Ratings WHERE rating IS NULL OR review_text IS NULL OR date_rated IS NULL OR minutes_watched IS NULL;


--check if the missing values is replaced with unknown and 0
SELECT * FROM Users WHERE gender = 'unknown' OR location = 'unknown' OR age = '0';




