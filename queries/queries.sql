create table stats2018_19(
Rk INT,
Player VARCHAR(50),
Pos VARCHAR(10),
Age INT,
Tm VARCHAR(30),
G INT,
GS INT,
MP INT,
FG INT,
FGA INT,
FGpercent float,
threepoint INT,
threePA INT,
threePpercent	float,
twoP	INT,
twoPA	INT,
twoPpercent	float,
eFGpercent	float,
FT INT ,
FTA INT,
FTpercent float,
ORB INT,
DRB INT,
TRB INT,
AST INT,
STL INT,
BLK INT,
TOV INT,
PF INT,
PTS INT 
);

create table stats2017_18(
Rk INT,
Player VARCHAR(50),
Pos VARCHAR(10),
Age INT,
Tm VARCHAR(30),
G INT,
GS INT,
MP INT,
FG INT,
FGA INT,
FGpercent float,
threepoint INT,
threePA INT,
threePpercent	float,
twoP	INT,
twoPA	INT,
twoPpercent	float,
eFGpercent	float,
FT INT ,
FTA INT,
FTpercent float,
ORB INT,
DRB INT,
TRB INT,
AST INT,
STL INT,
BLK INT,
TOV INT,
PF INT,
PTS INT 
);














--select the whole table 
select * from stats2018_19
--select a column from the table and rename it using the as clause
select player as "name"
from stats2018_19
--distinct- find the unique values
select distinct tm 
from stats2018_19
--where clause use to fliter rows that match a certain condition 
select player, age
from stats2018_19
where age > 35

--The like operator can be used to match/ filter for items similar to something
select player
from stats2018_19 
where player like 'Ryan%'
-- the _ wildcard can be used to match a single unspecific character. For example justin can be written,as _ustin
select player 
from stats2018_19 
where player like '_on';
---% wildcard can be used in a like operator to match zero or more unspecified characters
Select player 
from stats2018_19
where player like 'La%';
--null values- can be used to find where null values exist, or where they do not
select g, player
from stats2018_19
where threepa is  null;
---between operator used to select for values between a certain range
select player, threeppercent
from stats2018_19
where threeppercent between 0.400 and 0.500 
--use order by to sort either ascending or descending
order by threeppercent desc;

--and operator allows multiple conditions to be combined results must match both conditions to be included in the result set
select player, gs from stats2018_19
where tm = 'OKC'
and gs > 75

--or operator allows multiple conditions to be combined, results can match either condition to be included in the data set
select player, tm 
from stats2018_19 
where tm = 'OKC'
or tm = 'ATL'

--limit is used to limit the number of results returned from a query 
select player
from stats2018_19
where tm = 'LAL'
limit (10)

--count() returns the total number of rows that match the specified criteria. 
select count(player)
from stats2018_19
where pts >2500 


--sum() takes the name of a column and returns the sum of all value in that column- how many three pointers were attempted
select sum(threepoint)
from stats2018_19;

select sum(twop)
from stats;

--avg() returns the average value in the column- what is the average fg percentage
select avg(fgpercent)
from stats2018_19;

-- who are the highest scoring players named josh

select player, pts/g as ppg
from stats2018_19 
where player like 'Josh%'

--most common name of player--these players have been traded a number of times 
SELECT       player,
             COUNT(player) AS name
    FROM     stats2018_19
    GROUP BY player
    ORDER BY name DESC

--which player had the most defensive rebounds
select max(drb) as most_defensive_rebounds, player, tm
from stats2018_19
group by player,tm
order by most_defensive_rebounds desc


--find players that changed teams , list their 2017 team and 18 team and respective points 
SELECT stats2017_18.player, stats2017_18.tm as team2017, stats2018_19.tm as team2018,   stats2017_18.pts as pts2017, stats2018_19.pts as pts2018
FROM stats2017_18
INNER JOIN stats2018_19 ON stats2017_18.player=stats2018_19.player
where stats2017_18.tm <> stats2018_19.tm ;

