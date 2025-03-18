/******************************************************************
Queries para practivar el filtrado
*******************************************************************/

-- 01 ¿Qué registros tienen un Status igual a 4 y un SubTotal mayor de 10,000?
SELECT * FROM Purchasing.PurchaseOrderHeader where Status=4 and subtotal > 10000;

-- 02 ¿Cuáles son las órdenes con una ShipMethodID igual a 5 y un TaxAmt inferior a 50?
SELECT * FROM Purchasing.PurchaseOrderHeader where ShipMethodID=5 and TaxAmt < 50;

-- 03 ¿Qué PurchaseOrderID tiene un TotalDue entre 1,000 y 2,000?
SELECT * FROM Purchasing.PurchaseOrderHeader where PurchaseOrderID >= 1000 and PurchaseOrderID <=2000;

-- 04 ¿Qué registros tienen un OrderDate posterior al 2012-01-01?
SELECT * FROM Purchasing.PurchaseOrderHeader where OrderDate < '2012-01-01';

-- 05 ¿Qué filas tienen un VendorID diferente a 1600?
SELECT * FROM Purchasing.PurchaseOrderHeader where VendorID != '1600';

-- 06 ¿Cuáles son las órdenes donde Freight es mayor que el 10% de SubTotal?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE Freight > (SubTotal * 0.1);

-- 06 bis ¿Cuáles son las órdenes donde Freight es mayor que el 1% de SubTotal?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE EmployeeID between 250 and 260;

-- 07 ¿Cuáles son las filas en las que el EmployeeID está en el rango de 250 a 260?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE PurchaseOrderID between 9 and 10;

-- 08 ¿Qué registros tienen un PurchaseOrderID igual a 9 o 10?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE ShipDate = ModifiedDate;

-- 09 ¿Qué filas tienen un ShipDate exactamente igual a la fecha de ModifiedDate?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE ShipDate <> ModifiedDate;

-- 09 BIS ¿Qué filas tienen un ShipDate distinto la fecha de ModifiedDate? (4012)
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE ShipDate <> ModifiedDate;

-- 10 ¿Qué filas tienen un SubTotal mayor o igual a 50,000 y un Freight menor o igual a 2,000?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE SubTotal >= 50000 and Freight <= 2000;

-- 11 ¿Qué filas tienen un TaxAmt superior a 10 y un TotalDue inferior a 1000?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE TaxAmt > 10 and TotalDue <= 100;

-- 12 ¿Qué filas tienen un Status que no es 4?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE Status != 4;

-- 13 ¿Cuáles son las órdenes donde ShipMethodID comienza por el número 2 (usa LIKE)?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE ShipMethodID LIKE '2%';

-- 14 ¿Qué registros tienen un OrderDate en 2011?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE YEAR (OrderDate) = 2011;

-- 15 ¿Qué filas tienen un SubTotal igual a la suma de TaxAmt y Freight?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE SubTotal = (TaxAmt + Freight);

-- 16 ¿Cuáles son las órdenes cuyo EmployeeID es mayor que 255 y cuyo ShipMethodID es igual a 5?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE EmployeeID > 255 and ShipMethodID = 5;

-- 17 ¿Qué órdenes tienen un VendorID entre 1500 y 1600?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE VendorID between 1500 and 1600;

-- 18 ¿Qué registros tienen un PurchaseOrderID mayor a 50 o un TotalDue menor que 500?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE PurchaseOrderID > 50 or TotalDue < 500;

-- 19 ¿Qué registros tienen un TaxAmt superior a 1 y un Freight entre 10 y 20?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE TaxAmt > 1 and Freight between 10 and 20;

-- 20 ¿Qué filas tienen un Status que sea 1, 3 o 5?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE Status IN (1 , 3 , 5);

-- 21 ¿Qué registros tienen un ShipDate que no sea NULL?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE ShipDate IS NOT NULL;

-- 22 ¿Qué filas tienen un ShipMethodID mayor que 3 y un OrderDate antes de 2012-01-01?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE ShipMethodID > 3 and OrderDate < '2012-01-01';

-- 23 ¿Qué registros tienen un ModifiedDate igual al ShipDate y un Status de 4?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE ModifiedDate = ShipDate and Status = 4;

-- 24 ¿Qué filas tienen un TotalDue superior a 25,000 y un PurchaseOrderID que finaliza en 5 (usa LIKE)?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE TotalDue > 25000 and PurchaseOrderID LIKE '%5';

-- 25 ¿Qué registros tienen un ShipDate al menos 10 días después del OrderDate?
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE ShipDate >= DATEADD(DAY,10,OrderDate);
