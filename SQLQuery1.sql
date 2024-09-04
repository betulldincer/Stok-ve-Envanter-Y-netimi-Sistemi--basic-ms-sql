
--tüm ürünleri listelemek istedim
select*
from tblProducts


-- Stoktaki ürünlerimi listelemek istedim
select productName, quantityInStock
from tblProducts
where quantityInStock>0



---sipariþ detaylarýný görüntülemek

SELECT 
    o.OrderID			, 
    p.ProductName		, 
    o.OrderQuantity		, 
    o.OrderStatus
FROM tblOrders AS o
JOIN tblProducts AS p ON o.ProductID = p.ProductID;

-- stok iþlemlerini görüntülemek
SELECT s.transactionID			, 
	   tblProducts.productName  ,
	   s.TransactionType		, 
       s.Quantity				, 
	   s.TransactionDate		,
	   s.Remarks
FROM tblStockTransactions as s
JOIN tblProducts ON s.ProductID = tblProducts.ProductID;


-- tedarikçilerin saðladýðý ürünler 

select s.supplierID		,
	   s.supplierName	,
	   tblProducts.productName
from tblSuppliers as s 
join tblProducts on s.supplierID=tblProducts.supplierID


--sipariþlerin tarihlere göre daðýlýmý
select  o.orderDate  ,
		count(o.orderID) as TotalOrders
from tblOrders as o
group by o.orderDate
order by o.orderDate

-- belirli bir sipariþ için 
select o.orderDate		,
	   o.orderQuantity	,
	   o.orderStatus
from tblOrders as o 
where o.orderID=2



--- Order tablosuna yeni kayýt eklendiðinde ilgili ürünün stoðunu azaltacak bir trigger ekleyelim .

CREATE TRIGGER UpdateStockOnOrder
ON tblOrders
AFTER INSERT
AS
BEGIN
--- Yeni eklenen sipariþ kayýtlarýný tutan inserted tablosu ile Products tablosunu güncelliyoruz
    UPDATE tblProducts
    SET quantityInStock = quantityInStock- i.OrderQuantity
    FROM tblProducts p
    JOIN inserted i ON p.ProductID = i.ProductID;
END;



--- stored proc oluþturalým. 
CREATE PROCEDURE CreateOrder
    @ProductID INT,
    @OrderQuantity DECIMAL(10, 2),
    @OrderStatus NVARCHAR(50)
AS
BEGIN
    -- Stoðun yeterli olup olmadýðýný kontrol et
    DECLARE @quantityInStock DECIMAL(10, 5);
    SELECT @quantityInStock = quantityInStock
    FROM tblProducts
    WHERE ProductID = @ProductID;

    -- Eðer stok miktarý yeterli deðilse hata mesajý ver
    IF @quantityInStock < @OrderQuantity
    BEGIN
        PRINT 'Yeterli stok bulunmamaktadýr.'
        RETURN;
    END

    -- Sipariþi ekle
    INSERT INTO tblOrders (ProductID, OrderQuantity, OrderStatus)
    VALUES (@ProductID, @OrderQuantity, @OrderStatus);

    PRINT 'Sipariþ baþarýyla oluþturuldu.'
END;


--- tablonun kolay okunabilmesi için view oluþturalým ve bunu product ile order tablolarýnda yapalým,

CREATE VIEW OrderDetailsView AS
SELECT 
    o.OrderID AS SipariþID,
    p.ProductName AS ÜrünAdý,
    o.OrderQuantity AS SipariþMiktarý,
    o.OrderStatus AS SipariþDurumu,
    p.UnitPrice AS BirimFiyat,
    (o.OrderQuantity * p.UnitPrice) AS ToplamTutar
FROM 
    tblOrders AS o
JOIN 
    tblProducts AS p ON o.ProductID = p.ProductID

-- þimdi çalýþtýralým ve daha anlaþýlýr bir tablo görelim
select *
from OrderDetailsView



--- þimdi stok seviyemizi kontrol edecek stored proc oluþturalým
CREATE PROCEDURE CheckLowStockControl
    @MinStockLevel DECIMAL(10, 5)  -- Minimum stok seviyesi parametresi
AS
BEGIN
    -- Belirtilen minimum seviyenin altýndaki ürünleri seç
    SELECT 
        ProductID AS ÜrünID				,
        ProductName AS ÜrünAdý			,
        quantityInStock AS MevcutStok	,
        UnitPrice AS BirimFiyat
    FROM 
        tblProducts
    WHERE 
        quantityInStock < @MinStockLevel	

    -- Eðer stok seviyesi düþük ürünler varsa uyarý ver
    IF EXISTS (SELECT 1 FROM tblProducts WHERE quantityInStock < @MinStockLevel)
    BEGIN
        PRINT 'Uyarý: Bazý ürünlerin stok seviyesi düþük!';
    END
    ELSE
    BEGIN
        PRINT 'Tüm ürünlerin stok seviyeleri yeterli.';
    END
END;

--- þimdi stored procedurümüzü çalýþtýralým
EXEC CheckLowStockControl @MinStockLevel = 10;  -- Minimum stok seviyesini 10 olarak belirledim