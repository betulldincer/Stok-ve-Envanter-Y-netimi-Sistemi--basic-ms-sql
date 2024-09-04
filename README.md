# Stok ve Envanter Yönetim Sistemi

Bu proje, stok ve envanter yönetimi için geliþtirilmiþ bir SQL veritabaný uygulamasýdýr. Proje kapsamýnda oluþturulan veritabaný tablolarý, iliþkiler, stored procedure'ler ve trigger'lar ile sistemin çalýþma mantýðý açýklanmýþtýr.

## Proje Ýçeriði

- **Tablolar:**
  - Ürünler (Products)
  - Tedarikçiler (Suppliers)
  - Sipariþler (Orders)
  - Müþteriler (Customers)
  
- **Stored Procedure’ler:**
  - Stok Güncelleme (UpdateStockOnOrder)
  - Düþük Stok Kontrolü (CheckLowStock)
  
- **Trigger’lar:**
  - Sipariþ Üzerine Stok Güncelleme

## Kurulum Adýmlarý

1. **SQL Server Yükleyin**: Projeyi çalýþtýrmak için SQL Server gerekmektedir.
2. **Veritabanýný Yükleyin**: `Proje_Script.sql` dosyasýný kullanarak veritabanýný oluþturun.
3. **Stored Procedure ve Trigger’larý Ekleyin**: SQL scriptlerini çalýþtýrarak ilgili prosedür ve trigger’larý oluþturun.

## Kullaným

- Sistemde sipariþ verildiðinde otomatik olarak stok miktarý güncellenir.
- Stok azaldýðýnda uyarý verir ve düþük stok raporu oluþturur.

## Lisans

Bu proje MIT lisansý altýndadýr.