--
--tarea2:  4 queries sakila
--

--Nombres y correos de clientes canadienses
select c.first_name, c.last_name, c.email from customer c join address a on(c.address_id=a.address_id) join city c2 on (a.city_id=c2.city_id) join country c3 on (c2.country_id =c3.country_id)
where c3.country_id = 20;

--cliente ha rentado mas de secc de adultos
select c.customer_id, concat(c.first_name, ' ', c.last_name) "name", count(f.film_id) 
from customer c join rental r on(c.customer_id=r.customer_id) join inventory i on(r.inventory_id=i.inventory_id) join film f on(i.film_id=f.film_id) 
where f.rating = 'NC-17' group by c.customer_id order by count(f.film_id) desc limit 1 ;

--película mas rentadas en todas nuestras stores
select f.title, count(f.film_id)
from rental r join inventory i on(r.inventory_id=i.inventory_id) join film f on(i.film_id=f.film_id)
group by f.film_id order by count(f.film_id) desc limit 100;

--revenue por store
select s.store_id , sum(p.amount)from store s join staff s2 ON (s.store_id=s2.store_id) join payment p on(p.staff_id=s2.staff_id)
group by s.store_id ;