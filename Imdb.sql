#average rating ny series and number of episodes
select round (avg(rating),2) as average_rating, title, count(title) as number_of_episodes  
from new_schema.imdb_top_250_series_episode_ratings
group by title
order by average_rating desc
limit 10;

#max rated episode for each show and its number
select *
from 
(select Title, Episode,Rating
from new_schema.imdb_top_250_series_episode_ratings) E
inner join (
select Title, max(Rating) as max_rating
from new_schema.imdb_top_250_series_episode_ratings
group by Title
) sub 
on E.Title = sub.Title and E.Rating=sub.max_rating;

select max(rating) as max_rating,title
from new_schema.imdb_top_250_series_episode_ratings
group by Title
order by max_rating desc
;

select min(rating) as min_rating,title
from new_schema.imdb_top_250_series_episode_ratings
group by Title
order by min_rating
;

select *
from new_schema.imdb_top_250_series_episode_ratings
where title='Breaking Bad'
having rating>9
