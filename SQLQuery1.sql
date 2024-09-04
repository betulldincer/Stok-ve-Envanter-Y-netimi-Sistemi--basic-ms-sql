
--t�m �r�nleri listelemek istedim
select*
from tblProducts


-- Stoktaki �r�nlerimi listelemek istedim
select productName, quantityInStock
from tblProducts
where quantityInStock>0



---sipari� detaylar�n� g�r�nt�lemek

SELECT 
    o.OrderID			, 
    p.ProductName		, 
    o.OrderQuantity		, 
    o.OrderStatus
FROM tblOrders AS o
JOIN tblProducts AS p ON o.ProductID = p.ProductID;

-- stok i�lemlerini g�r�nt�lemek
SELECT s.transactionID			, 
	   tblProducts.productName  ,
	   s.TransactionType		, 
       s.Quantity				, 
	   s.TransactionDate		,
	   s.Remarks
FROM tblStockTransactions as s
JOIN tblProducts ON s.ProductID = tblProducts.ProductID;


-- tedarik�ilerin sa�lad��� �r�nler 

select s.supplierID		,
	   s.supplierName	,
	   tblProducts.productName
from tblSuppliers as s 
join tblProducts on s.supplierID=tblProducts.supplierID


--sipari�lerin tarihlere g�re da��l�m�
select  o.orderDate  ,
		count(o.orderID) as TotalOrders
from tblOrders as o
group by o.orderDate
order by o.orderDate

-- belirli bir sipari� i�in 
select o.orderDate		,
	   o.orderQuantity	,
	   o.orderStatus
from tblOrders as o 
where o.orderID=2



--- Order tablosuna yeni kay�t eklendi�inde ilgili �r�n�n sto�unu azaltacak bir trigger ekleyelim .

CREATE TRIGGER UpdateStockOnOrder
ON tblOrders
AFTER INSERT
AS
BEGIN
--- Yeni eklenen sipari� kay�tlar�n� tutan inserted tablosu ile Products tablosunu g�ncelliyoruz
    UPDATE tblProducts
    SET quantityInStock = quantityInStock- i.OrderQuantity
    FROM tblProducts p
    JOIN inserted i ON p.ProductID = i.ProductID;
END;



--- stored proc olu�tural�m. 
CREATE PROCEDURE CreateOrder
    @ProductID INT,
    @OrderQuantity DECIMAL(10, 2),
    @OrderStatus NVARCHAR(50)
AS
BEGIN
    -- Sto�un yeterli olup olmad���n� kontrol et
    DECLARE @quantityInStock DECIMAL(10, 5);
    SELECT @quantityInStock = quantityInStock
    FROM tblProducts
    WHERE ProductID = @ProductID;

    -- E�er stok miktar� yeterli de�ilse hata mesaj� ver
    IF @quantityInStock < @OrderQuantity
    BEGIN
        PRINT 'Yeterli stok bulunmamaktad�r.'
        RETURN;
    END

    -- Sipari�i ekle
    INSERT INTO tblOrders (ProductID, OrderQuantity, OrderStatus)
    VALUES (@ProductID, @OrderQuantity, @OrderStatus);

    PRINT 'Sipari� ba�ar�yla olu�turuldu.'
END;


--- tablonun kolay okunabilmesi i�in view olu�tural�m ve bunu product ile order tablolar�nda yapal�m,

CREATE VIEW OrderDetailsView AS
SELECT 
    o.OrderID AS Sipari�ID,
    p.ProductName AS �r�nAd�,
    o.OrderQuantity AS Sipari�Miktar�,
    o.OrderStatus AS Sipari�Durumu,
    p.UnitPrice AS BirimFiyat,
    (o.OrderQuantity * p.UnitPrice) AS ToplamTutar
FROM 
    tblOrders AS o
JOIN 
    tblProducts AS p ON o.ProductID = p.ProductID

-- �imdi �al��t�ral�m ve daha anla��l�r bir tablo g�relim
select *
from OrderDetailsView



--- �imdi stok seviyemizi kontrol edecek stored proc olu�tural�m
CREATE PROCEDURE CheckLowStockControl
    @MinStockLevel DECIMAL(10, 5)  -- Minimum stok seviyesi parametresi
AS
BEGIN
    -- Belirtilen minimum seviyenin alt�ndaki �r�nleri se�
    SELECT 
        ProductID AS �r�nID				,
        ProductName AS �r�nAd�			,
        quantityInStock AS MevcutStok	,
        UnitPrice AS BirimFiyat
    FROM 
        tblProducts
    WHERE 
        quantityInStock < @MinStockLevel	

    -- E�er stok seviyesi d���k �r�nler varsa uyar� ver
    IF EXISTS (SELECT 1 FROM tblProducts WHERE quantityInStock < @MinStockLevel)
    BEGIN
        PRINT 'Uyar�: Baz� �r�nlerin stok seviyesi d���k!';
    END
    ELSE
    BEGIN
        PRINT 'T�m �r�nlerin stok seviyeleri yeterli.';
    END
END;

--- �imdi stored procedur�m�z� �al��t�ral�m
EXEC CheckLowStockControl @MinStockLevel = 10;  -- Minimum stok seviyesini 10 olarak belirledim