/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p. name as product, c. name as category 
From products as p
Inner Join categories As C
On c.categoryID = P.categoryID
Where c.name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 Select product.name, product. price, reviews.rating
 from products
 inner Join rivews ON reviews.porductID = products.productID
 Where reviews.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.firstname, e.lastname, sum (s.quanity) AS total
From sales as s
Inner Join employees as e ON e.EmployeeID = s.EmployeeID
group by e.EmployeeID 
order by Total desc
Limit 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
Select d.Name as 'Department Name', c.Name as 'Category Name ' From departments as d
Inner join categories AS C ON c.DepartmentID = d.DepartmentID
Where c.Name = 'Appliances' or c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
Select p.Name, Sum(s.Quantity) as 'Total Sold', Sum(s.Quantity * s.PricePerUnit) as 'Total Price'
From products as p
inner join sales as s on s.ProductID = p.ProductID
Where p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
Select p.Name, r.Review, r.Rating, r.Comment 
From products as p
inner join reviews as r On r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.EmployeeID, e.FirstName, e.LastName, p.Name, sum(s.Quantity) as TotalSold
From sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by e.FirstName;
