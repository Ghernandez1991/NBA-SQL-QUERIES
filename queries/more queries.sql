select * from stats 

select * AVG g
from stats 

SELECT AVG(pts) , player
FROM stats
where tm = 'LAL'


SELECT AVG(pts), tm
FROM stats 
GROUP BY tm
ORDER BY AVG(pts) DESC;


--find points per game ordered descending
SELECT player,  (pts) / ( g)
from stats
order by  (pts) / ( g) desc;

--find the average mins per game and group by team descending from highest to lowest

select avg(mp)/avg(g), tm
from stats
group by tm
order by avg(mp)/avg(g) desc;

--find average shooting percentage by team and order descending
select avg(fgpercent)* 100, tm
from stats 
group by tm
order by avg(fgpercent) desc

--average team age

select avg(age) , tm
from stats
group by tm
order by avg(age) desc; 


--descrete median points
select percentile_disc(0.5) within group (order by stats.pts)
from stats

--calculate percentiles for points per game over 82 games
select
  percentile_disc(0.25) within group (order by stats.pts)/ 82,
  percentile_disc(0.5) within group (order by stats.pts)/ 82,
  percentile_disc(0.75) within group (order by stats.pts)/ 82,
   percentile_disc(0.90) within group (order by stats.pts)/ 82,
   percentile_disc(0.95) within group (order by stats.pts)/ 82,
   percentile_disc(0.99) within group (order by stats.pts)/ 82,
   percentile_disc(0.9975) within group (order by stats.pts)/ 82,
   percentile_disc(0.9999) within group (order by stats.pts)/ 82
from stats
--players who made the most three pointers
select player, threepoint as three_pointers_made 
from stats
order by threepoint desc;

-teams that made the most three pointers
select tm as team, threepoint as three_pointers_made 
from stats
order by threepoint desc;
