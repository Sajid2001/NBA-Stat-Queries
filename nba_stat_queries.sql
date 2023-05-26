#full table
select * 
from nba_regular_season_stats;

#best scorers in the nba
select name,team,PPG,TS,eFG,ORtg, USG 
from nba_regular_season_stats 
where PPG > 20 
ORDER BY PPG desc LIMIT 10;

#best floor spacers in the league
select name,team, 3P,3PA,ORtg,TS, round(3P * 3PA) as EstimatedPointsGeneratedFromThree 
from nba_regular_season_stats 
where 3P > 0.35 and 3PA > 500 
ORDER BY 3P desc LIMIT 10;

#most impactful defenders in the NBA
select name,team, DRtg, BPG, SPG, VI
from nba_regular_season_stats 
Where DRtg != 0 and MPG > 25 and GP > 60 
ORDER BY DRtg Limit 15;

#most impactful offensive star in the nba
select name,team, ORtg, APG, 2PA, 2P, 3PA, 3P, eFG, TS, PPG, RPG, (PPG + (2*APG)) as PointsGenerated
from nba_regular_season_stats 
where MPG > 30 and GP > 60 and PPG > 20 
order by PointsGenerated desc limit 10;

#best offensive players in the league
select name,team, ORtg, APG, 2PA, 2P, 3PA, 3P, eFG, TS, PPG, RPG
from nba_regular_season_stats 
where MPG > 30 and GP > 60 and PPG > 20 
order by ORtg desc limit 10;

#most efficient scorers in the nba
select name,team, ORtg, APG, 2PA, 2P, 3PA, 3P, eFG, TS, PPG, RPG
from nba_regular_season_stats 
where MPG > 30 and GP > 60 and PPG > 20 
order by TS desc limit 10;

#points + rebounds + assists
select name,team, ORtg, APG, 2PA, 2P, 3PA, 3P, eFG, TS, PPG, RPG, 
(round(PPG) + round(RPG) + round(APG)) as PRA
from nba_regular_season_stats 
where MPG > 30 and GP > 60 and PPG > 20 and TS > .6 
order by PRA desc limit 10;

#trying to find the best all around player in the nba
select name,team, PPG, APG, RPG, SPG, BPG,eFG,FT,TPG, GP, 
(PPG + RPG + APG + SPG + BPG - (1-eFG) - (1-FT) - TPG) / GP as PER
from nba_regular_season_stats 
where MPG > 30 and GP > 60 and PPG > 20 
order by PER desc limit 10;

#trying to find the best bench player in the league
select name,team, MPG, PPG, APG, RPG, SPG, BPG,eFG,FT,TPG, GP, 
(PPG + RPG + APG + SPG + BPG - (1-eFG) - (1-FT) - TPG) / GP as PER
from nba_regular_season_stats 
where MPG > 20 and MPG <=26 and GP > 60 
order by PER desc limit 10;

#points + rebounds  assists for bench players
select name,team, ORtg, APG, 2PA, 2P, 3PA, 3P, eFG, TS, PPG, RPG, 
(round(PPG) + round(RPG) + round(APG)) as PRA
from nba_regular_season_stats 
where MPG > 20 and MPG <=26 and GP > 60 
order by PRA desc limit 10;


# --young players--

# finding the most impactful player under 22
select name, team, AGE, PPG, APG, RPG, SPG, BPG,eFG,FT,TPG, GP, 
(PPG + RPG + APG + SPG + BPG - (1-eFG) - (1-FT) - TPG) / GP as PER
from nba_regular_season_stats 
where MPG > 15 and GP > 60 and PPG > 15 and AGE < 22 
order by PER desc limit 10;

select name,team, ORtg, APG, 2PA, 2P, 3PA, 3P, eFG, TS, PPG, RPG, 
(round(PPG) + round(RPG) + round(APG)) as PRA
from nba_regular_season_stats 
where MPG > 15 and GP > 60 and PPG > 15 and AGE < 22 
order by PRA desc limit 10;

#best young defender
select name, team, DRtg, BPG, SPG, VI
from nba_regular_season_stats 
Where DRtg != 0 and AGE < 22 and MPG > 15 and GP > 40 
ORDER BY DRtg Limit 10;


#----playoff stats-------
select * 
from nba_playoff_stats;

#best scorers in the playoffs
select name,team,PPG,TS,eFG,ORtg, USG 
from nba_playoff_stats
where PPG > 20 and GP > 8 and MPG > 30
ORDER BY PPG desc LIMIT 10;

#best deep playoff scorers
select name,team,PPG,TS,eFG,ORtg, USG 
from nba_playoff_stats
where PPG > 20 and GP > 12 and MPG > 30
ORDER BY PPG desc LIMIT 10;

#highest PER in the playoffs
select name,team, PPG, APG, RPG, SPG, BPG,eFG,FT,TPG, GP, 
(PPG + RPG + APG + SPG + BPG - (1-eFG) - (1-FT) - TPG) / GP as PER
from nba_playoff_stats
where MPG > 30 and GP > 8 and PPG > 20 
order by PER desc limit 10;

#highest PER deep in the playoffs
select name,team, PPG, APG, RPG, SPG, BPG,eFG,FT,TPG, GP, 
(PPG + RPG + APG + SPG + BPG - (1-eFG) - (1-FT) - TPG) / GP as PER
from nba_playoff_stats
where MPG > 30 and GP > 12 and PPG > 20 
order by PER desc limit 10;

#trying to find the most impactful player in the playoffs
select name,team, ORtg, PPG, APG, 2PA, 2P, 3PA, 3P, eFG, TS, RPG, 
(round(PPG) + round(RPG) + round(APG)) as PRA
from nba_playoff_stats
where MPG > 30 and GP > 8 and PPG > 20 
order by PRA desc limit 10;

#points + rebounds + assists in the playoffs
select name,team, ORtg, PPG, APG, 2PA, 2P, 3PA, 3P, eFG, TS, RPG, 
(round(PPG) + round(RPG) + round(APG)) as PRA
from nba_playoff_stats play
where MPG > 30 and GP > 8 and PPG > 20 
order by PRA desc limit 10;

#best offensive rating in the playoffs
select name,team, ORtg, APG, 2PA, 2P, 3PA, 3P, eFG, TS, PPG, RPG
from nba_playoff_stats
where MPG > 30 and GP > 8 and PPG > 20 
order by ORtg desc limit 10;

#most impactful defenders in the playoffs
select name,team, DRtg, BPG, SPG, VI, GP
from nba_playoff_stats
Where DRtg != 0 and MPG > 25 and GP > 8
ORDER BY DRtg Limit 10;

#reg points,rebounds,assists, vs playoff points, rebounds, assists
select play.name,play.team, play.ORtg, play.PPG, play.APG, play.eFG, play.TS, play.RPG, 
reg.name,reg.team, reg.ORtg, reg.PPG, reg.APG, reg.eFG, reg.TS, reg.RPG, 
(round(play.PPG) + round(play.RPG) + round(play.APG)) as playPRA,
(round(reg.PPG) + round(reg.RPG) + round(reg.APG)) as regPRA,
(round(play.PPG) + round(play.RPG) + round(play.APG)) - 
(round(reg.PPG) + round(reg.RPG) + round(reg.APG)) as dropPRA
from nba_playoff_stats play
JOIN nba_regular_season_stats reg
ON play.name = reg.name
where play.MPG > 30 and play.GP > 8 and play.PPG > 20 
order by dropPRA desc limit 10;

#biggest playoff droppers and risers in PPG
select play.name,play.team, play.PPG, play.GP,
reg.PPG, reg.GP,
(play.PPG - reg.PPG) as dropPPG
from nba_playoff_stats play
JOIN nba_regular_season_stats reg
ON play.name = reg.name
where play.MPG > 30 and play.GP > 8 and reg.GP> 60 and reg.PPG > 20 
order by dropPPG desc limit 10;


