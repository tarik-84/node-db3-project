-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
    SELECT "ProductName", "CategoryName"
    FROM "ProductDetails_V";

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
    SELECT "OrderId", "ShipName", "OrderDate"
    FROM "Order"
    WHERE "OrderDate" < 2012-08-09;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
    SELECT o."OrderId", o."Quantity", p."ProductName"
    FROM "OrderDetail" as o
    JOIN "Product" as p on o."ProductId" = p.id
    WHERE "OrderId" = 10251; 

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
    SELECT o."id", c."CompanyName", e."LastName"
    FROM "Order" as o
    JOIN "Customer" as c on o."CustomerId" = c."id"
    JOIN "Employee" as e on o."EmployeeId" = e."id";

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
    SELECT "CategoryID" as "CategoryName", COUNT(productId)
    FROM "Products"
    GROUP BY "CategoryName";

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
    SELECT o."OrderID", od."ProductID" as "ItemCount"
    FROM "Orders" as o
    JOIN "OrderDetails" as od on  o."OrderID" = od."OrderID"
    GROUP BY o."OrderID";