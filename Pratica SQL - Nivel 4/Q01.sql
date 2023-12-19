select products.name
from products,providers
where products.amount between 10 and 20 and providers.name like 'P%'
and products.id_providers = providers.id;