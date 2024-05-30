use art_gallery;

# 1
select file_name from file join art_work on 
 file.art_work_id = art_work.art_work_id where period Like 'Impressionism'; 
 
 
 #2 
 use v_art;
 SELECT 
    artfile
FROM
    artwork a
        JOIN
    artwork_keyword ak ON a.artwork_id = ak.artwork_id
        JOIN
    keyword k ON ak.keyword_id = k.keyword_id
 where keyword like 'flower%';
 
#3 
select fname, lname, title from 
artist a left join artwork aw 
on a.artist_id = aw.artist_id;


use magazine;
select * from magazine;
select * from subscription;
select * from subscriber;

select magazineName, subscriberLastName, subscriberFirstName 
from magazine m join subscription s on m.magazineKey = s.magazineKey
join subscriber ssb on s.subscriberKey = ssb.subscriberKey
order by m.magazineName;


#5
select magazineName from magazine m 
 join subscription s on m.magazineKey = s.magazineKey
join subscriber sub on s.subscriberKey = sub.subscriberKey
where sub.subscriberKey = 3;

#6
use  employees;


SELECT 
    first_name, last_name
FROM
    dept_emp dp
        JOIN
    employees e ON dp.emp_no = e.emp_no
        JOIN
    departments de ON dp.dept_no = de.dept_no
WHERE
    dept_name = 'Customer Service'
ORDER BY last_name
LIMIT 5; 

#7


SELECT 
    first_name, last_name, dept_name, salary, sa.from_date
FROM
    salaries sa
        JOIN
    employees e ON sa.emp_no = e.emp_no
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        JOIN
    departments dp ON dp.dept_no = de.dept_no
WHERE
    e.first_name = 'Berni'
        AND e.last_name = 'Genin'
ORDER BY sa.from_date DESC
LIMIT 1;

use bike;

#8
select ROUND(avg(quantity)) as 'Stock Average' from  stock;

#9

SELECT DISTINCT
    (product_name), store_name, quantity
FROM
    product p
        JOIN
    stock s ON p.product_id = s.product_id
        JOIN
    store st ON s.store_id = st.store_id
WHERE
    quantity < 1
ORDER BY product_name;

#10



 
SELECT 
    category_name, SUM(quantity) AS inStock
FROM
    stock s
        JOIN
    product p ON s.product_id = p.product_id
        JOIN
    category c ON p.category_id = c.category_id
        JOIN
    store st ON s.store_id = st.store_id
WHERE
    store_name = 'Baldwin Bikes'
GROUP BY category_name order by inStock; 

use employees;

#11
select count(*) as 'Number of Employees' from employees;

#12 

SELECT 
    dept_name, Format(ROUND(AVG(salary), 2), 2) AS average_salary
FROM
    departments dp
        JOIN
    dept_emp de ON dp.dept_no = de.dept_no
        JOIN
    employees e ON de.emp_no = e.emp_no
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY dept_name
HAVING AVG(salary) < 60000
ORDER BY average_salary ;





#13
select * from departments;
select * from employees;
select * from dept_emp;
select * from salaries;
use art_gallery;

# 1
select file_name from file join art_work on 
 file.art_work_id = art_work.art_work_id where period Like 'Impressionism'; 
 
 
 #2 
 use v_art;
 SELECT 
    artfile
FROM
    artwork a
        JOIN
    artwork_keyword ak ON a.artwork_id = ak.artwork_id
        JOIN
    keyword k ON ak.keyword_id = k.keyword_id
 where keyword like 'flower%';
 
#3 
select fname, lname, title from 
artist a left join artwork aw 
on a.artist_id = aw.artist_id;


use magazine;
select * from magazine;
select * from subscription;
select * from subscriber;

select magazineName, subscriberLastName, subscriberFirstName 
from magazine m join subscription s on m.magazineKey = s.magazineKey
join subscriber ssb on s.subscriberKey = ssb.subscriberKey
order by m.magazineName;


#5
select magazineName from magazine m 
 join subscription s on m.magazineKey = s.magazineKey
join subscriber sub on s.subscriberKey = sub.subscriberKey
where sub.subscriberKey = 3;

#6
use  employees;


SELECT 
    first_name, last_name
FROM
    dept_emp dp
        JOIN
    employees e ON dp.emp_no = e.emp_no
        JOIN
    departments de ON dp.dept_no = de.dept_no
WHERE
    dept_name = 'Customer Service'
ORDER BY last_name
LIMIT 5; 

#7


SELECT 
    first_name, last_name, dept_name, salary, sa.from_date
FROM
    salaries sa
        JOIN
    employees e ON sa.emp_no = e.emp_no
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        JOIN
    departments dp ON dp.dept_no = de.dept_no
WHERE
    e.first_name = 'Berni'
        AND e.last_name = 'Genin'
ORDER BY sa.from_date DESC
LIMIT 1;

use bike;

#8
select ROUND(avg(quantity)) as 'Stock Average' from  stock;

#9

SELECT DISTINCT
    (product_name), store_name, quantity
FROM
    product p
        JOIN
    stock s ON p.product_id = s.product_id
        JOIN
    store st ON s.store_id = st.store_id
WHERE
    quantity < 1
ORDER BY product_name;

#10



 
SELECT 
    category_name, SUM(quantity) AS inStock
FROM
    stock s
        JOIN
    product p ON s.product_id = p.product_id
        JOIN
    category c ON p.category_id = c.category_id
        JOIN
    store st ON s.store_id = st.store_id
WHERE
    store_name = 'Baldwin Bikes'
GROUP BY category_name order by inStock; 

use employees;

#11
select count(*) as 'Number of Employees' from employees;

#12 

SELECT 
    dept_name, Format(ROUND(AVG(salary), 2), 2) AS average_salary
FROM
    departments dp
        JOIN
    dept_emp de ON dp.dept_no = de.dept_no
        JOIN
    employees e ON de.emp_no = e.emp_no
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY dept_name
HAVING AVG(salary) < 60000
ORDER BY average_salary ;





#13
select * from departments;
select * from employees;
select * from dept_emp;
select * from salaries;

SELECT 
    dept_name,  count(gender)  AS 'NUMBER of FEmales' 
FROM
    departments dp
        JOIN
    dept_emp de ON dp.dept_no = de.dept_no
        JOIN
    employees e ON de.emp_no = e.emp_no
        
    where gender = 'F'
GROUP BY dept_name
order by dept_name;



 
 



 
 