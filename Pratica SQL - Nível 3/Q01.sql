select products.id, products.name
from products, categories
where products.id_categories = categories.id and categories.name like 'super%'; 