--Tarea 1 David Escobar
--	queries, mas queries y un poquito mas de queries

--prueba
select * from orders o ;

--1 Qué contactos de proveedores tienen la posición de sales representative?
select contact_name from suppliers s where (s.contact_title = 'Sales Representative');

--2 Qué contactos de proveedores no son marketing managers?
select contact_name from suppliers s where (s.contact_title != 'Marketing Manager');

--3 Cuales órdenes no vienen de clientes en Estados Unidos?
select o.* from orders o, customers c  where o.customer_id = c.customer_id and(c.country != 'USA');

--4 Qué productos de los que transportamos son quesos?
select distinct p.product_id, p.product_name 
from categories c join products p using (category_id)
join order_details od using (product_id)
join orders o using (order_id)
where shipped_date is not null 
and c.description = 'Cheeses';

--5 Qué ordenes van a Bélgica o Francia?
select distinct o.ship_country from orders o ;
select o.order_id from orders o where (ship_country = 'Belgium' or ship_country = 'France');

--6 Qué órdenes van a LATAM?
select distinct o.ship_region from orders o ;
select distinct o.ship_country from orders o ;
select o.order_id from orders o 
where (o.ship_country='Argentina' or o.ship_country='Venezuela' or o.ship_country= 'Mexico' or o.ship_country= 'Brazil');

--7 Qué órdenes no van a LATAM?
select o.order_id from orders o 
where (o.ship_country!='Argentina' and o.ship_country!='Venezuela' 
		and o.ship_country!= 'Mexico' and o.ship_country!= 'Brazil');

--8 Necesitamos los nombres completos de los empleados, nombres y apellidos unidos en un mismo registro
select CONCAT(e.first_name,' ',e.last_name) as nombres_completos from employees e;

--9 Cuánta lana tenemos en inventario?
select sum(p.unit_price*p.units_in_stock) as Lana_Inventario from products p;

--10 Cuantos clientes tenemos de cada país?
select c.country, count(customer_id) from customers c group by c.country;
--11 

--12 Obtener un reporte de edades de los empleados para checar su elegibilidad para seguro de gastos médicos menores.
select concat(e.first_name,' ',e.last_name) as nombres_completos , extract(year from current_timestamp)- extract ( year from e.birth_date) 
	as edades from employees e;
--13 De nuestros clientes, qué función desempeñan y cuántos son?
select c.contact_title as funciones_cliente , count(contact_title) as suma_clientes from customers c group by contact_title;

--14
select p.category_id , count(*) as suma_productos 
	from products p  group by p.category_id ;