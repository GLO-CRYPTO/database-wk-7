use salesdb;
-- question 1 --
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);

INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

select * from productDetail_1NF;

-- Question 2 --
DESCRIBE OrderDetails;
CREATE TABLE IF NOT EXISTS Orders (
    orderNumber INT PRIMARY KEY

);
CREATE TABLE IF NOT EXISTS OrderProducts (
    orderNumber INT,
    productCode VARCHAR(15),
    quantityOrdered INT,
    priceEach DECIMAL(10,2),
    orderLineNumber SMALLINT,
    PRIMARY KEY (orderNumber, productCode)
);

-- Orders table
INSERT INTO Orders (orderNumber)
SELECT DISTINCT orderNumber
FROM OrderDetails;

-- OrderProducts table
INSERT INTO OrderProducts (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
SELECT orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
FROM OrderDetails;


