/*Retrieve all columns from sales table*/
SELECT * from sales;

/*Retrieve specific columns from sales table*/
SELECT SaleDate, Amount, Customers from sales;
SELECT Amount, CUstomers, GeoID from sales;

/*Calculate the ratio of Amount to Boxes for each record in the sales table*/
SELECT SaleDate, Amount, Boxes, Amount / Boxes from sales;

/*Calculating the ratio of Amount to Boxes for record in the sales table and renames
the calculated column as Amount per Box*/
SELECT SaleDate, Amount, Boxes, Amount / Boxes as 'Amount per Box' from sales;

/*Retrieve rows from the sales table where the value in the amount column is greater than 10,000*/
SELECT * from sales
WHERE amount > 10000;

/*Retrieve rows from the sales table where the value in the amount column is greater
than 10,000, then order them in descending order based on amount column*/
SELECT * from sales
WHERE amount > 10000
ORDER BY amount desc;

/*Retrieve all columns from sales table where GeoID is equal to g1,
then sorted by PID and Amount columns in descending order*/
SELECT * from sales
WHERE GeoID='g1'
ORDER BY PID, Amount desc;

/*Retrieve all columns from sales table where Amount is greater
than 10,000 and SaleDate is on or after January 1, 2022*/
SELECT * from sales
WHERE Amount > 10000 and SaleDate >= '2022-01-01';

/*Retrieve only SaleDate and Amount columns from sales table where sales amount is greater than
10,000 and they year ofsale date is 2022. Sort the results in descending order based on sales amount*/
SELECT SaleDate, Amount from sales
WHERE amount > 10000 and year(SaleDate) = 2022
ORDER BY Amount desc;

/*Retrieve all columns from sales table where number of
boxes is greater than zero and is less than or equal to 50*/
SELECT * from sales
WHERE Boxes > 0 and Boxes <= 50;

/*Retrieve all columns from sales table where number of boxes falls between 1 to 50*/
SELECT * from sales
WHERE Boxes between 1 and 50;

/*Retrieve columns SaleDate, Amount, Boxes, and Day of Week where day of week is Friday*/
SELECT SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of week' from sales
WHERE weekday(SaleDate) = 4;

/*Retrieve all columns from people table*/
SELECT * from people;

/*Retrieve all columns from people table where team column matches either Delish or Juices*/
SELECT * from people
WHERE team = 'Delish' or team = 'Jucies'; 

/*Retrieve all columns from people table where team column matches either Delish or Juices*/
SELECT * from people
WHERE team in ('Delish', 'jucies');

/*Retrieve all columns from people table where Salesperson column contains values that start with B*/
SELECT * from people
WHERE Salesperson like 'B%';

/*Retrieve all columns from people table where Salesperson column contains
values that contains the letter B anywhere within the value*/
SELECT * from people
WHERE Salesperson like '%B%';

/*Retrieve all columns from sales table*/
SELECT * from sales;

/*Retrieve columns SaleDate and Amount from sales table, including the new column
Amount category that indicates the category to which each amount belongs*/
SELECT	SaleDate, Amount,
		case 	when amount < 1000 then 'Under 1k'
				when amount < 5000 then 'Under 5k'
                when amount < 10000 then 'Under 10k'
			else '10k or more'
		end as 'Amount category'
from sales;