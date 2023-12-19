select substr(natural_person.cpf,1,3) || "." || substr(natural_person.cpf,4,3) || "." || substr(natural_person.cpf,7,3) || "-" || substr(natural_person.cpf,10,2) 
from natural_person join customers
on customers.id = natural_person.id_customers;