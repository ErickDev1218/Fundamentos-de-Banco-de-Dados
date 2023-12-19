select candidate.name, round((score.math*2 + score.specific*3 + score.project_plan*5)/10.0 ,2) as media
from candidate join score on candidate.id = score.candidate_id
order by media Desc;