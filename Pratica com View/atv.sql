create view Winners as
select Coalesce(count(matches.id),0) as qtd,teams.id from teams left join matches
on team_1 = teams.id and matches.team_1_goals > matches.team_2_goals 
or team_2 = teams.id and matches.team_2_goals > matches.team_1_goals
group by teams.id;

create view Losers as
select Coalesce(count(matches.id),0) as qtd,teams.id from teams left join matches
on team_1 = teams.id and matches.team_1_goals < matches.team_2_goals 
or team_2 = teams.id and matches.team_2_goals < matches.team_1_goals
group by teams.id;

create view Draws as
select Coalesce(count(matches.id),0) as qtd,teams.id from teams left join matches
on team_1 = teams.id and matches.team_1_goals = matches.team_2_goals 
or team_2 = teams.id and matches.team_2_goals = matches.team_1_goals
group by teams.id;

create view Part as
select count(*) as qtd, teams.id
from teams join matches on teams.id = matches.team_1 or teams.id = matches.team_2
group by teams.id;

select teams.name,Part.qtd,Winners.qtd,Losers.qtd,Draws.qtd,(3*Winners.qtd + 1*Draws.qtd)
from teams join Winners on teams.id = Winners.id
join Losers on Losers.id = teams.id
join Draws on Draws.id = teams.id
join Part on Part.id = teams.id
group by name
order by 4;

