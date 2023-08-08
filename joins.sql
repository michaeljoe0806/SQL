/*Retrieve all columns from sales table*/
SELECT * from sales;

/*Retrieve all columns from people table*/
SELECT * from people;

/*Joining columns SaleDate, Amount, Salesperson, SPID, and spid from
both sales and people tables where the SPID values match*/
SELECT s.SaleDate, s.Amount, p.Salesperson, p.SPID, s.spid
from sales s
JOIN people p on p.SPID = s.SPID;

/*Joining columns SaleDate, Amount, and product from both
sales and products table where the pid values match*/
SELECT s.SaleDate, s.Amount, pr.product
from sales s
LEFT JOIN products pr on pr.pid = s.pid;

/*Joining columns SaleDate and Amount from sales table, and Salesperson and
team from people table where SPID values match, then joining the combined result
from previous join with product from products table where pid values match*/
SELECT s.SaleDate, s.Amount, p.Salesperson, pr.product, p.team
from sales s
JOIN people p on p.SPID = s.SPID
JOIN products pr on pr.pid = s.pid;

/*Joining columns SaleDate and Amount from sales table, and Salesperson and team
from people table where the SPID values match, then joining the combined result
from previous join with product from products table where pid values match, filtered
with Amount is less than 500 and belonging to Delish team*/
SELECT s.SaleDate, s.Amount, p.Salesperson, pr.product, p.team
from sales s
JOIN people p on p.SPID = s.SPID
JOIN products pr on pr.pid = s.pid
WHERE s.Amount <500
and p.team = 'Delish';

/*Joining columns SaleDate and Amount from sales table, and Salesperson and team
from people table where the SPID values match, then joining the combined result
from the previous join with product from products table where the pid values match,
filtered with Amount less than 500 and an empty team column*/
SELECT s.SaleDate, s.Amount, p.Salesperson, pr.product, p.team
from sales s
JOIN people p on p.SPID = s.SPID
JOIN products pr on pr.pid = s.pid
WHERE s.Amount <500
and p.team = '';

/*Joining columns SaleDate and Amount from sales table, and Salesperson and team
from people table where the SPID values match, then joining the combined result
from previous join with the product from products table where the pid values match,
then joining the second combined result from previous join with geo table based on
matching geoid values, then filtered with Amount less than 500, empty team column,
and geo matches New Zealand or India, then ordered by SaleDate in ascending order*/
SELECT s.SaleDate, s.Amount, p.Salesperson, pr.product, p.team
from sales s
JOIN people p on p.SPID = s.SPID
JOIN products pr on pr.pid = s.pid
JOIN geo g on g.geoid = s.geoid
WHERE s.Amount <500
and p.team = ''
and g.geo in ('New Zealand', 'India')
ORDER BY SaleDate;