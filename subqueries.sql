use world;
-- Subquery Example 1 - Subquery in where clause;

select name, population from country where population > (select population from country where name = 'Russian Federation')
order by name;

select name, population from country where continent = 'Europe';


SELECT 
    name,
    CONCAT(ROUND(100 * population / (SELECT 
                            population
                        FROM
                            country
                        WHERE
                            name = 'Germany'),
                    3),
            '%') AS 'Percent'
FROM
    country
WHERE
    continent = 'Europe';
    
    -- Example 3 - Create and use a duplicate table
create  table city_bak
as select * from city;

SELECT 
    *
FROM
    city_bak
WHERE
    countrycode IN (SELECT 
            code
        FROM
            country
        WHERE
            region = 'Central Africa');
            
delete  from city_bak where countrycode in (select code  from country where region = 'Central Africa'); 
select * from city_bak where countrycode in (select code from country where region = 'Central Africa');
drop table city_bak







