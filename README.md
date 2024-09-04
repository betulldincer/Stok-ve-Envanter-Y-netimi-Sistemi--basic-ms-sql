# Stok ve Envanter Yönetim Sistemi

Bu proje, stok ve envanter yönetimi için geliştirilmiş bir SQL veritabanı uygulamasıdır. Proje kapsamında oluşturulan veritabanı tabloları, ilişkiler, stored procedure'ler ve trigger'lar ile sistemin çalışma mantığı açıklanmıştır.

## Proje İçeriği

- **Tablolar:**
  - Ürünler (Products)
  - Tedarikçiler (Suppliers)
  - Siparişler (Orders)
  - Müşteriler (Customers)
  
- **Stored Procedure’ler:**
  - Stok Güncelleme (UpdateStockOnOrder)
  - Düşük Stok Kontrolü (CheckLowStock)
  
- **Trigger’lar:**
  - Sipariş Üzerine Stok Güncelleme

## Kurulum Adımları

1. **SQL Server Yükleyin**: Projeyi çalıştırmak için SQL Server gerekmektedir.
2. **Veritabanını Yükleyin**: `Proje_Script.sql` dosyasını kullanarak veritabanını oluşturun.
3. **Stored Procedure ve Trigger’ları Ekleyin**: SQL scriptlerini çalıştırarak ilgili prosedür ve trigger’ları oluşturun.

## Kullanım

- Sistemde sipariş verildiğinde otomatik olarak stok miktarı güncellenir.
- Stok azaldığında uyarı verir ve düşük stok raporu oluşturur.

## Lisans

Bu proje MIT lisansı altındadır.
