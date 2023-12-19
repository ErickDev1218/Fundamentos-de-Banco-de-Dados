select 'Podium: '|| team
from (
        select team
        from league
        limit 3)
union all
select 'Demoted: '|| team
from(
        select team
        from league
        where position > (select count(*) from league) -2
        );
