use  v_art;


# 1
insert into artist(fname,mname,lname,dob,dod,country,local) values('Johannes', null, 'Vermeer', 1632, 1974, 'Netherlands', 'n');

# 2

select * from artist order by lname;


# 3 
update artist set dod = 1674 where lname = 'Vermeer' and fname = 'Johannes';

# 4

delete from artist where artist_id = 13;


use bike;

# 5

select first_name, last_name, phone, city from customer where city like '%Houston%';

# 6



select product_name, list_price, list_price - 500 as 'Discount Price' from product order by list_price desc;

# 7
select * from staff where store_id != 1 ;

# 8
select product_name, model_year, list_price from product where product_name  like '%Spider%'; 

#9

select product_name, list_price from product where list_price between 500 and 550 order by list_price; 

#10
SELECT 
    first_name, last_name, phone, street, city, state, zip_code
FROM
    customer
WHERE
    phone IS NOT NULL
        AND (city LIKE '%ach%' or city like '%och%')
        OR last_name = 'William'
LIMIT 5;

SELECT 
    product_id,
    TRIM(TRAILING '- 2016' FROM (SUBSTRING_INDEX(product_name, '-', 2))) AS 'product name without year'
FROM
    product
ORDER BY product_id
LIMIT 14;


# 12

SELECT 
    product_name,
    model_year,
    CONCAT('$', ROUND(list_price / 3, 2)) AS 'One of 3 Payments'
FROM
    product
WHERE
    model_year = '2019';
    
#13
use magazine;

select * from magazine;

SELECT 
    magazineName,
    ROUND(magazinePrice - (magazinePrice * 3 / 100),
            2) AS amount_to_remove
FROM
    magazine;

#14


SELECT 
    subscriberKey,
    ROUND(ABS(DATEDIFF(subscriptionStartDate, '2020-12-20') / 365)) AS now
FROM
    subscription;
    
#15 



SELECT 
    subscriptionStartDate,
    subscriptionLength,
    DATE_FORMAT(ADDDATE(subscriptionStartDate,
        INTERVAL subscriptionLength MONTH), '%M %e %Y') AS 'Subscription end'
FROM
    subscription;




