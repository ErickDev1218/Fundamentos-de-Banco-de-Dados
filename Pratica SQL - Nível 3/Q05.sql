select customers.name, orders.id
from customers,orders
where orders.orders_date between '2016-01-00' and '2016-06-30' and customers.id = orders.id_customers;