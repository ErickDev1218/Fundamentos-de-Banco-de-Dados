select people.name, round(people.salary * 0.1,2) 
from people
where people.salary > 3000.00