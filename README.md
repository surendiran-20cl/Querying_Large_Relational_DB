Querying a Large Relational Database Using SQL Server
Project Overview
This project demonstrates querying and analyzing data from a large relational database using Microsoft SQL Server Management Studio (SSMS). The AdventureWorks2012 sample database is used to simulate real-world scenarios such as retrieving customer information and generating sales insights through structured SQL queries.

Objectives
Restore and explore the AdventureWorks2012 database

Write and execute SQL queries to retrieve and analyze data

Practice using SQL joins, filtering, grouping, and aggregation

Generate insights on customer profiles and sales performance

Database Used
AdventureWorks2012

Official Microsoft sample database for SQL Server

Contains data related to a fictional bicycle manufacturing company

Includes tables for products, sales, customers, orders, and more

Tasks Completed
Database Setup

Downloaded and restored the AdventureWorks2012.bak file from Microsoft GitHub.

Verified the database structure and explored relevant tables.

SQL Queries

Retrieved customer details including email address, phone number, and phone type using multiple table joins.

Extracted sales order headers and order details for May 2011.

Computed total sales for May 2011.

Aggregated and ranked monthly sales for the year 2011.

Filtered and analyzed total sales for a specific customer, "Gustavo Achong".

SQL Concepts Applied
Joins: Used INNER JOIN across related tables to fetch combined data.

Filtering: Applied conditions with WHERE, BETWEEN, and YEAR().

Aggregation: Used SUM() to compute total sales figures.

Grouping and Ordering: Used GROUP BY and ORDER BY to organize results.

Files Included
queries.sql: SQL script file containing all queries with appropriate comments and documentation.

README.md: Project documentation file.

How to Use
Open Microsoft SQL Server Management Studio (SSMS).

Restore the AdventureWorks2012 database from the .bak file.

Open the queries.sql script file.

Execute the script in the context of the AdventureWorks2012 database.

Review the query outputs in the SSMS results pane.

Acknowledgements
Microsoft SQL Server Team for providing the AdventureWorks sample database.

Intellipaat SQL Certification Program for project guidance.
