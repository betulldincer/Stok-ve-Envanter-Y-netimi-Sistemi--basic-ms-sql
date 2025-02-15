USE [master]
GO
/****** Object:  Database [Stok ve Envanter Yönetim Sistemi]    Script Date: 4.09.2024 12:26:23 ******/
CREATE DATABASE [Stok ve Envanter Yönetim Sistemi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Stok ve Envanter Yönetim Sistemi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DATABASE24\MSSQL\DATA\Stok ve Envanter Yönetim Sistemi.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Stok ve Envanter Yönetim Sistemi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DATABASE24\MSSQL\DATA\Stok ve Envanter Yönetim Sistemi_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Stok ve Envanter Yönetim Sistemi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET  MULTI_USER 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Stok ve Envanter Yönetim Sistemi]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 4.09.2024 12:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[orderQuantity] [decimal](18, 3) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[orderStatus] [nchar](50) NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 4.09.2024 12:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [int] NOT NULL,
	[productName] [nvarchar](max) NOT NULL,
	[category] [nvarchar](100) NOT NULL,
	[unitPrice] [money] NOT NULL,
	[quantityInStock] [int] NOT NULL,
	[supplierID] [int] NOT NULL,
 CONSTRAINT [PK_ProductTable] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStockTransactions]    Script Date: 4.09.2024 12:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStockTransactions](
	[transactionID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[transactionType] [nvarchar](50) NOT NULL,
	[quantity] [decimal](18, 0) NOT NULL,
	[transactionDate] [datetime] NOT NULL,
	[remarks] [nvarchar](300) NULL,
 CONSTRAINT [PK_tblStockTransactions] PRIMARY KEY CLUSTERED 
(
	[transactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSuppliers]    Script Date: 4.09.2024 12:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSuppliers](
	[supplierID] [int] NOT NULL,
	[supplierName] [nvarchar](max) NOT NULL,
	[contactName] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](15) NOT NULL,
	[adress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblSuppliers] PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[OrderDetailsView]    Script Date: 4.09.2024 12:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrderDetailsView] AS
SELECT 
    o.OrderID AS SiparişID,
    p.ProductName AS ÜrünAdı,
    o.OrderQuantity AS SiparişMiktarı,
    o.OrderStatus AS SiparişDurumu,
    p.UnitPrice AS BirimFiyat,
    (o.OrderQuantity * p.UnitPrice) AS ToplamTutar
FROM 
    tblOrders AS o
JOIN 
    tblProducts AS p ON o.ProductID = p.ProductID;
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblProducts]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblSuppliers] FOREIGN KEY([supplierID])
REFERENCES [dbo].[tblSuppliers] ([supplierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblSuppliers]
GO
ALTER TABLE [dbo].[tblStockTransactions]  WITH CHECK ADD  CONSTRAINT [FK_tblStockTransactions_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblStockTransactions] CHECK CONSTRAINT [FK_tblStockTransactions_tblProducts]
GO
/****** Object:  StoredProcedure [dbo].[CheckLowStock]    Script Date: 4.09.2024 12:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- şimdi stok seviyemizi kontrol edecek stored proc oluşturalım
CREATE PROCEDURE [dbo].[CheckLowStock]
    @MinStockLevel DECIMAL(10, 5)  -- Minimum stok seviyesi parametresi
AS
BEGIN
    -- Belirtilen minimum seviyenin altındaki ürünleri seç
    SELECT 
        ProductID AS ÜrünID				,
        ProductName AS ÜrünAdı			,
        quantityInStock AS MevcutStok	,
        UnitPrice AS BirimFiyat
    FROM 
        tblProducts
    WHERE 
        quantityInStock < @MinStockLevel	

    -- Eğer stok seviyesi düşük ürünler varsa uyarı ver
    IF EXISTS (SELECT 1 FROM tblProducts WHERE quantityInStock < @MinStockLevel)
    BEGIN
        PRINT 'Uyarı: Bazı ürünlerin stok seviyesi düşük!';
    END
    ELSE
    BEGIN
        PRINT 'Tüm ürünlerin stok seviyeleri yeterli.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CheckLowStockControl]    Script Date: 4.09.2024 12:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckLowStockControl]
    @MinStockLevel DECIMAL(10, 5)  -- Minimum stok seviyesi parametresi
AS
BEGIN
    -- Belirtilen minimum seviyenin altındaki ürünleri seç
    SELECT 
        ProductID AS ÜrünID				,
        ProductName AS ÜrünAdı			,
        quantityInStock AS MevcutStok	,
        UnitPrice AS BirimFiyat
    FROM 
        tblProducts
    WHERE 
        quantityInStock < @MinStockLevel	

    -- Eğer stok seviyesi düşük ürünler varsa uyarı ver
    IF EXISTS (SELECT 1 FROM tblProducts WHERE quantityInStock < @MinStockLevel)
    BEGIN
        PRINT 'Uyarı: Bazı ürünlerin stok seviyesi düşük!';
    END
    ELSE
    BEGIN
        PRINT 'Tüm ürünlerin stok seviyeleri yeterli.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 4.09.2024 12:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- stored proc oluşturalım. 
CREATE PROCEDURE [dbo].[CreateOrder]
    @ProductID INT,
    @OrderQuantity DECIMAL(10, 2),
    @OrderStatus NVARCHAR(50)
AS
BEGIN
    -- Stoğun yeterli olup olmadığını kontrol et
    DECLARE @quantityInStock DECIMAL(10, 5);
    SELECT @quantityInStock = quantityInStock
    FROM tblProducts
    WHERE ProductID = @ProductID;

    -- Eğer stok miktarı yeterli değilse hata mesajı ver
    IF @quantityInStock < @OrderQuantity
    BEGIN
        PRINT 'Yeterli stok bulunmamaktadır.'
        RETURN;
    END

    -- Siparişi ekle
    INSERT INTO tblOrders (ProductID, OrderQuantity, OrderStatus)
    VALUES (@ProductID, @OrderQuantity, @OrderStatus);

    PRINT 'Sipariş başarıyla oluşturuldu.'
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sipariş kimlik numarası' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblOrders', @level2type=N'COLUMN',@level2name=N'orderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ürün kimliği' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblOrders', @level2type=N'COLUMN',@level2name=N'productID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sipariş miktarı' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblOrders', @level2type=N'COLUMN',@level2name=N'orderQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'sipariş tarihi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblOrders', @level2type=N'COLUMN',@level2name=N'orderDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sipariş durumu (tamamlandı/bekliyor)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblOrders', @level2type=N'COLUMN',@level2name=N'orderStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ürün kimlik numarası' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'productID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ürün adı' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'productName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ürün kategorisi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Birim fiyatı' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'unitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stoktaki Miktar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'quantityInStock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tedarikçi kimliği' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProducts', @level2type=N'COLUMN',@level2name=N'supplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'İşlem kimlik numarası' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStockTransactions', @level2type=N'COLUMN',@level2name=N'transactionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ürün kimliği' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStockTransactions', @level2type=N'COLUMN',@level2name=N'productID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'İşlem türü (Giriş/Çıkış)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStockTransactions', @level2type=N'COLUMN',@level2name=N'transactionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'İşlem miktarı' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStockTransactions', @level2type=N'COLUMN',@level2name=N'quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'İşlem tarihi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStockTransactions', @level2type=N'COLUMN',@level2name=N'transactionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Açıklama (opsiyonel)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStockTransactions', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tedarikçi kimlik numarası' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblSuppliers', @level2type=N'COLUMN',@level2name=N'supplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tedarikçi adı' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblSuppliers', @level2type=N'COLUMN',@level2name=N'supplierName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'İlgili kişi adı' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblSuppliers', @level2type=N'COLUMN',@level2name=N'contactName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefon numarası' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblSuppliers', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adres adı' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblSuppliers', @level2type=N'COLUMN',@level2name=N'adress'
GO
USE [master]
GO
ALTER DATABASE [Stok ve Envanter Yönetim Sistemi] SET  READ_WRITE 
GO
