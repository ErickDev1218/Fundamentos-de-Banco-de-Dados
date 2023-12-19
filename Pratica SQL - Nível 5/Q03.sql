select life_registry.name, life_registry.omega*1.618 as x
from life_registry join dimensions on dimensions.id = life_registry.dimensions_id
where dimensions.name = 'C875' or dimensions.name = 'C774'
order by x asc;