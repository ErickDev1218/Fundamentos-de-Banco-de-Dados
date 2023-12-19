select products.name, providers.name, products.price
from products, providers, categories
where products.price > 1000.00 and products.id_providers = providers.id and products.id_categories = categories.id and categories.name = 'Super Luxury'; 