select products.name, providers.name, categories.name
from products, providers, categories
where providers.name = 'Sansul SA' and categories.name = 'Imported'
and products.id_providers = providers.id and products.id_categories = categories.id;