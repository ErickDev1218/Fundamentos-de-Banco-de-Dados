select 'Approved: ', students.name, students.grade
from students
where students.grade >= 7.0
order by students.grade desc;