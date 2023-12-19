select products.name, providers.name
from products join providers on products.id_categories = 6 and products.id_providers = providers.id;