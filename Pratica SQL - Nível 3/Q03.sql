select people.name,length(people.name) as x
from people
order by x desc;