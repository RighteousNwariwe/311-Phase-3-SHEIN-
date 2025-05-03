CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Phone VARCHAR2(20),
    Address VARCHAR2(200)
);

CREATE TABLE Product (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100) NOT NULL,
    Product_Description VARCHAR2(255),
    Price NUMBER(10,2) NOT NULL,
    CONSTRAINT chk_price CHECK (Price > 0)
);

CREATE TABLE Orders (
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER NOT NULL,
    Order_Date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_order_customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Order_Items (
    Order_Item_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER NOT NULL,
    Product_ID NUMBER NOT NULL,
    Quantity NUMBER NOT NULL,
    CONSTRAINT fk_orderitems_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT fk_orderitems_product FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    CONSTRAINT chk_quantity CHECK (Quantity > 0)
);

CREATE TABLE Payments (
    Payment_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER NOT NULL,
    Payment_Date DATE DEFAULT SYSDATE,
    Amount NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_payment_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT chk_amount CHECK (Amount > 0)
);

CREATE TABLE Shipping (
    Shipping_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER NOT NULL,
    Shipping_Date DATE,
    Shipping_Method VARCHAR2(50),
    Shipping_Address VARCHAR2(200),
    CONSTRAINT fk_shipping_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);