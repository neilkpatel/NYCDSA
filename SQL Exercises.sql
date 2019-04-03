SHOW databases;
USE movies_db;
SHOW tables; 
SELECT 
	movie_title as title, 
	budget/1000000 as budget_in_millions, 
    gross/1000000,
    budget - gross as profit
FROM movies;

SELECT movie_title, gross > budget FROM movies;

SELECT movie_title,
	CASE 
		WHEN title_year > 2014 THEN 'new'
        WHEN title_year BETWEEN 2012 and 2014 THEN 'new-ish'
        ELSE 'old'
	END AS movie_age
FROM movies; 

SELECT movie_title as title,
	CASE
		WHEN country = "USA" THEN "USA"
        ELSE "Not USA"
	END AS USA_OR_BUST, 
    CASE # language is reserved keyword
		WHEN language != 'English' and content_rating = 'PG-13' THEN 'Non-English PG-13'
		ELSE 'Other'
	END AS Foreign_PG_13_Films
FROM movies;

SELECT movie_title as title, title_year, 
	CASE 
		WHEN title_year LIKE "19%" THEN title_year
        ELSE 9999
        END AS TITLE_YEAR

FROM movies;

SELECT movie_title FROM movies LIMIT 5;

SELECT movie_title, title_year
FROM movies
WHERE YEAR(current_date()) - title_year <= 3;

select * from movies WHERE country = "South Korea";
select * from movies WHERE color != "Color" OR color is null;
select movie_title, gross/budget from movies where gross/budget >20; 
select movie_title from movies WHERE char_length(movie_title) = 5; 

select movie_title, imdb_score from movies where (gross-budget)/budget > 20 AND imdb_score < 5;

describe movies;

use movies_db;

select country, budget from movies order by country, budget;
select country, avg(budget) from movies group by country order by avg(budget) desc;

# noice
select language, count(*) from movies group by language order by count(*) desc;

select movie_title, title_year, director_name from movies where title_year = 1972
UNION
select movie_title, title_year, director_name from movies where title_year = 1974;



-- SELECT movie_title, year, director
-- FROM movies
-- WHERE year = 1972
-- UNION
-- SELECT movie_title, year, director
-- FROM movies
-- WHERE year = 1942;

select count(*) from (select name, birthday from actors
union all
select name, birthday from directors) as X;

select count(*) from directors inner join actors on directors.name = actors.name;

describe movies;
--
show databases;
select count(*) from movies; 

-- This is a comment. Very cool comment this is. 

select movie_title, language, genres, imdb_score from movies order by imdb_score desc;
select budget /100000 as sup from movies;

select movie_title as da_title, gross-budget as profit from movies where gross-budget < 0 order by gross-budget asc; -- where budget-gross != null order by net_loss asc;

select actors.name, directors.name, movie_title from actors join directors on directors.name = actors.name join movies on movies.director_name = directors.name;

select genres, sum(gross) from movies group by genres order by sum(gross) desc;

select movie_title as title, 
	CASE 
		WHEN country = "USA" THEN "USA"
        ELSE "Not USA"
	END as USA_or_bust,
    CASE 
		WHEN language != "English" and content_rating = "PG-13" THEN "no ingles y no PG-13"
        ELSE "Other"
	END as "foreign_PG13_lefilms"
from movies; 

select country, country like "U__" from movies;