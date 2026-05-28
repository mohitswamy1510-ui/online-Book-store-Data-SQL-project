-- Create Database

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

1. --retrive all books in the 'fiction', genre
select book_id,title,author,genre from books 
where genre='Fiction'; 

2.--find books Published after the year 1950
select * from books
where published_year>'1950'; 

3.--list all the customers from canada 
select customer_id,name from customers
where country='Canada'; 

4.--show orders placed in nov 2023
select * from orders
where order_date between '2023-11-01' and '2023-11-30'; 

5.--retrive the total stock of books available 
select sum(stock) as total_stock
from books; 

6.--find the details of most expensive book
select * from books
where price=(select max(price) 
from books ); 

7.--show all customers who entered more than 1 quantity of a book
select * from orders 
where quantity>'1'; 

8.--Retrive all orders where the total amount exceeds $20
select * from orders
where total_amount>'20';

9.--list all genre available in the books table
select distinct genre from books; 

10.--find the book with lowest stcok 
select * from books order by stock asc limit 1; 

11.--total revenus
select sum(total_amount) as Reveue
from orders; 


--Advanced Queries(9)
1.--retrive the total numbers of books sold for each
select b.genre,sum(o.quantity) as book_sold_genre
from orders o
join books b on o.book_id=b.book_id
group by b.genre;

2.--find the average price of books in 'fantacy' genre 

select AVG(price)  as average_fantacy from books
where genre='Fantasy'; 

3.---list customers who have placed at least 2 orders 
select customer_id,count(order_id) as order_count
from orders
group by customer_id
Having count(order_id)>='2'; 

4.--find the most frequently ordered book
select o.book_id, b.title, count(o.order_id) as orderd_book
from orders o
join books b on o.book_id=b.book_id
group by o.book_id, b.title
order by orderd_book desc limit 1;

5.--show the top 3 most expensive books of fantasy genre
select * from books
where genre='Fantasy'
order by price desc limit 3;

6.--retrive the total quantity of books sold by each author
select b.author,sum(o.quantity) as total_book_sold
from orders o
join books b on o.book_id=b.book_id
group by b.author; 

7.--list the cities where customers who spnet over $30 are located 
select distinct c.city,total_amount
from orders o
join customers c on o.customer_id=c.customer_id
where o.total_amount>30; 

8.--find the customers who spend the most
select c.customer_id,c.name,sum(o.total_amount) as spent
from orders o
join customers c on c.customer_id=o.customer_id
group by c.customer_id,c.name
order by spent desc limit 1; 








select * from Books; 
select* from orders;
select * from customers; 




