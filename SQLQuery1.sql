
			--Sprawdzenie zawartoœc tabeli calendar
SELECT TOP (1000) [Date] FROM [Projekt2].[dbo].[calendar]

			--Czyszczenie danych tabeli sales --
  -- Sprawdzenie typów danych poszczególnych kolumn tabeli sales

EXEC sp_help sales;

  -- Zamiana typu danych kolumny Date z tabeli sales
SELECT Date,  CONVERT(Date, Date) FROM sales

UPDATE sales SET Date = CONVERT(Date, Date) 

ALTER TABLE sales Add DateConverted Date;

UPDATE sales SET DateConverted = CONVERT(Date, Date) 

	-- Zamiana typu danych kolumny Sale_ID, Store_ID, Units, Product_ID z tabeli sales z varchar na int

SELECT Sale_ID, Store_ID, Units, Product_ID,  CONVERT(int, Sale_ID), CONVERT(int, Store_ID), 
	CONVERT(int, Units) , CONVERT(int, Product_ID) 	FROM sales

UPDATE sales SET Sale_ID = CONVERT(int, Sale_ID) , Store_ID = CONVERT(int, Store_ID) , Units = CONVERT(int, Units) , 
	Product_ID = CONVERT(int, Product_ID) 

ALTER TABLE sales Add Sale_IDConverted int , Store_IDConverted int, UnitsConverted int, Product_IDConverted int ;


 UPDATE sales SET Sale_IDConverted = CONVERT(int, Sale_ID)  ,  Store_IDConverted = CONVERT(int, Store_ID) ,  
	    UnitsConverted = CONVERT(int, Units) , Product_IDConverted = CONVERT(int, Product_ID) 
	 
 
	 
	 --Usuniêcie kolumn o niew³aœciwych typach danych z tabeli sales
SELECT TOP (200) * FROM sales

ALTER TABLE sales DROP COLUMN Date, Sale_ID, Store_ID, Units, Product_ID;


				--Czyszczenie danych tabeli products --


	-- Sprawdzenie typów danych poszczególnych kolumn tabeli Products

  EXEC sp_help products;


  -- Zamiana typu danych kolumny Product_ID na int, Product_Cost na typ money, product_Price na typ money z tabeli products


  SELECT Product_ID, Product_Cost, Product_Price, CONVERT(int, Product_ID), CONVERT(money, Product_Cost), 
	    CONVERT(money, Product_Price) FROM products

UPDATE products SET Product_ID = CONVERT(int, Product_ID), Product_Cost = CONVERT(money, Product_Cost) , Product_Price = CONVERT(money, Product_Price)
	
	


ALTER TABLE products Add Product_IDConverted int , Product_CostConverted money, Product_PriceConverted money ;


UPDATE products SET Product_IDConverted = CONVERT(int, Product_ID)  ,  Product_CostConverted = CONVERT(money, Product_Cost) ,  
	Product_PriceConverted =  CONVERT(money, Product_Price)  
	 
SELECT Product_ID, Product_Cost ,  Product_Price ,  
	 Product_IDConverted, Product_CostConverted, Product_PriceConverted 	FROM products



--Usuniêcie kolumn o niew³aœciwych typach danych z tabeli products


ALTER TABLE products DROP COLUMN Product_ID, Product_Cost ,  Product_Price;
SELECT TOP (200) * FROM products


							--Czyszczenie danych tabeli stores --



--Sprawdzenie typów danych poszczególnych kolumn tabeli stores
  EXEC sp_help stores;

--Zamiana Store_ID na int , Store_Open_Date na date

  SELECT Store_ID, Store_Open_Date, CONVERT(int, Store_ID), CONVERT(Date, Store_Open_Date) 
	    FROM stores


UPDATE stores SET Store_ID = CONVERT(int, Store_ID), Store_Open_Date = CONVERT(Date, Store_Open_Date) FROM stores


ALTER TABLE Projekt2.dbo.stores Add Store_IDConverted int , Store_Open_DateConverted Date


UPDATE [Projekt2].[dbo].[stores] SET Store_IDConverted = CONVERT(int, Store_ID)  ,  Store_Open_DateConverted = CONVERT(Date, Store_Open_Date)
FROM [Projekt2].[dbo].[stores]

--Usuniêcie kolumn o niew³aœciwych typach danych z tabeli stores

ALTER TABLE stores DROP COLUMN Store_ID , Store_Open_Date;


SELECT  * FROM Projekt2.dbo.stores 