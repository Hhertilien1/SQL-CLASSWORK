-- /* joins: select all the computers from the products table: using the products table and the categories table, return the product name and the category name */

SELECT p.Name, c.Name from products as p
inner join categories as c
on p.CategoryID = c.CategoryID
where c.CategoryID = 1;
 
-- /* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select p.Name, p.Price, r.Rating from products as p
inner join reviews as r
on p.ProductID = r.ProductID
where r.Rating = 5;
 
-- /* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select SUM(quantity) as total, e.Firstname, e.LastName, e.employeeID
from sales as s
inner join employees as e
on s.EmployeeID = e.employeeID
group by s.employeeID
order by total desc
limit 2;


-- /* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name, c.Name from departments as d
inner join categories as c
on d.DepartmentID = c.DepartmentID
where c.CategoryID in (2,8);

/* joins: find the product name, total # sold, and total price sold,
for Eagles: Hotel California --You may need to use SUM() */
select p.Name, Sum(s.quantity) as "Total_Sales", Sum(s.quantity * s.PricePerUnit) as "Total_Price" from sales as s
inner join products as p
on s.ProductID = p.ProductID
Where p.Name like "%Hotel%"
group by p.ProductID;


-- /* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name, r.reviewer, r.Rating, r.Comment from reviews as r
inner join products as p
on r.ProductID = p.ProductID
where name like "Visio%";





-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

select e.employeeID, e.FirstName, e.LastName, p.Name, s.Quantity from employees as e
inner join sales as s
on s.EmployeeID = e.EmployeeID
inner join products as p
on s.ProductID = p.ProductID;


