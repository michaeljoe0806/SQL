/*Retrieving columns geoID, calculated sum of Amount, calculated average
of Amount, and calculate sum of Boxes from sales table, the grouped based
on the unique values of geoID*/
SELECT geoID, sum(amount), avg(amount), sum(boxes)
from sales
GROUP BY geoID;

/*Retrieving columns Geo, calculated sum of Amount, calculated average of
Amount, and calculated sum of Boxes where sales table and geo table are
joined based on matching geoID values, then grouped based on the unique
values of geoID*/
SELECT g.geo, sum(amount), avg(amount), sum(boxes)
from sales s
JOIN geo g on s.geoID = g.geoID
GROUP BY g.geo;

/*Retrieving columns category, team, calculated sum of boxes, and calculated
sum of amount where sales table and products table where joined based on matching
spid values, then joining the combined result from previous join with products
table based on matching pid values, then grouped by unique combinations of category
values from products table and team values from people table*/
SELECT pr.category, p.team, sum(boxes), sum(amount)
from sales s
JOIN people p on p.spid = s.spid
JOIN products pr on pr.pid = s.pid
GROUP BY pr.category, p.team;

/*Retrieving columns category, team, calculated sum of boxes, and calculated of
amount where sales table and people table where joined based on matching spid values,
then joining the combined result from previous join with the products tables based on
matching pid values, then grouped by unique combinations of category values from products
table and team values from people table, then sorts the results in ascending order based
on the Category and team column*/
SELECT pr.category, p.team, sum(boxes), sum(amount)
from sales s
JOIN people p on p.spid = s.spid
JOIN products pr on pr.pid = s.pid
WHERE p.team <> ''
GROUP BY pr.category, p.team
ORDER BY pr.category, p.team;

/*Retrieves sales data and calculates the total sales amount for each product,
then grouped by product and sorted in descending order based on the total amount*/
SELECT pr.Product, sum(s.amount) as 'Total Amount'
from sales s
JOIN products pr on pr.pid = s.pid
GROUP BY pr.Product
ORDER BY sum(s.amount) desc;

/*Retrieves sales data, calculates the total sales amount for each product,
and present the top 10 products with the highest total sales amount*/
SELECT pr.Product, sum(s.amount) as 'Total Amount'
from sales s
JOIN products pr on pr.pid = s.pid
GROUP BY pr.Product
ORDER BY sum(s.amount) desc
limit 10;