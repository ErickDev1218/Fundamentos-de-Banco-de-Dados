update virus 
set name = replace(name,'H1','X')
where name like '%H1%';


select virus.name from virus;