/*Посчитайте количество покупателей (customers) из каждой страны. 
Записи, где страна не указана, выводить не нужно.
В результирующей таблице – название страны и количество покупателей из этой страны.*/

SELECT cust_country as customer_country, count(*) as total from learnsql.customers
where cust_country is not null
group by cust_country;

/*Выведите все записи о вендорах (vendors), у которых нет ни одного продукта (products). 
В результирующей таблице – полная информация о вендорах.*/

select * from learnsql.vendors
where vend_id not in (select vend_id from products)

/*Посчитайте, кто из покупателей сделал самый дорогостоящий заказ в феврале 2020 года. 
В результирующей таблице – имя и email покупателя, а также стоимость самого дорогого заказа.*/

SELECT cust_name as customer_name, cust_email as customer_email, sum(quantity * item_price) as max_order_cost
from learnsql.customers
join learnsql.orders on customers.cust_id = orders.cust_id 
join learnsql.orderitems on orders.order_num = orderitems.order_num
WHERE order_date Between '2020-02-01' AND '2020-02-29'
group by cust_name, cust_email
order by max_order_cost desc
limit 1








-- 