-- Analysis of the data

-- Look at the data
-- Box Office
select * from box_office;

-- Streaming
select * from streaming;

-- Count of observations from box_office is 10000
select count(*) from box_office;

-- Count of observations from streaming is 16744
select count(*) from streaming;

-- Count of Streaming movies on Netflix is 3560
SELECT COUNT(*) FROM streaming WHERE netflix = 'Yes';

-- Count of Streaming movies on Hulu is 903
SELECT COUNT(*) FROM streaming WHERE hulu = 'Yes'

-- Count of Streaming movies on Prime Video is 12354
SELECT COUNT(*) FROM streaming WHERE prime_video = 'Yes';

-- Count of Streaming movies on Disney Plus is 564
SELECT COUNT(*) FROM streaming WHERE disney_plus = 'Yes';

-- Review movies on Netflix sorted by descending imdb rating
SELECT 
	A.*
	,B.netflix
	,B.suggested_viewing_age
	,B.imdb
	,B.rotten_tomatoes
	,B.directors
	,B.genres
	,B.language
	,B.runtime
FROM box_office AS a 
	LEFT JOIN streaming AS b ON A.movie = B.title
		AND A.released = B.released
WHERE B.netflix = 'Yes'
	AND imdb IS NOT NULL
ORDER BY imdb DESC
;

-- Review movies on Hulu sorted by descending total_box_office rating
SELECT 
	A.*
	,B.hulu
	,B.suggested_viewing_age
	,B.imdb
	,B.rotten_tomatoes
	,B.directors
	,B.genres
	,B.language
	,B.runtime
FROM box_office AS a 
	LEFT JOIN streaming AS b ON A.movie = B.title
		AND A.released = B.released
WHERE B.hulu = 'Yes'
	AND total_box_office IS NOT NULL
ORDER BY total_box_office DESC
;

-- Review movies on Prime Video sorted by descending rotten_tomatoes rating
SELECT 
	A.*
	,B.prime_video
	,B.suggested_viewing_age
	,B.imdb
	,B.rotten_tomatoes
	,B.directors
	,B.genres
	,B.language
	,B.runtime
FROM box_office AS a 
	LEFT JOIN streaming AS b ON A.movie = B.title
		AND A.released = B.released
WHERE B.prime_video = 'Yes'
	AND rotten_tomatoes IS NOT NULL
ORDER BY rotten_tomatoes DESC
;

-- Review movies on Disney Plus that are age 7+ appropriate
SELECT 
	A.*
	,B.disney_plus
	,B.suggested_viewing_age
	,B.imdb
	,B.rotten_tomatoes
	,B.directors
	,B.genres
	,B.language
	,B.runtime
FROM box_office AS a 
	LEFT JOIN streaming AS b ON A.movie = B.title
		AND A.released = B.released
WHERE B.disney_plus = 'Yes'
	AND suggested_viewing_age = '7+'
;
