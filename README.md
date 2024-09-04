# Stok ve Envanter Y�netim Sistemi

Bu proje, stok ve envanter y�netimi i�in geli�tirilmi� bir SQL veritaban� uygulamas�d�r. Proje kapsam�nda olu�turulan veritaban� tablolar�, ili�kiler, stored procedure'ler ve trigger'lar ile sistemin �al��ma mant��� a��klanm��t�r.

## Proje ��eri�i

- **Tablolar:**
  - �r�nler (Products)
  - Tedarik�iler (Suppliers)
  - Sipari�ler (Orders)
  - M��teriler (Customers)
  
- **Stored Procedure�ler:**
  - Stok G�ncelleme (UpdateStockOnOrder)
  - D���k Stok Kontrol� (CheckLowStock)
  
- **Trigger�lar:**
  - Sipari� �zerine Stok G�ncelleme

## Kurulum Ad�mlar�

1. **SQL Server Y�kleyin**: Projeyi �al��t�rmak i�in SQL Server gerekmektedir.
2. **Veritaban�n� Y�kleyin**: `Proje_Script.sql` dosyas�n� kullanarak veritaban�n� olu�turun.
3. **Stored Procedure ve Trigger�lar� Ekleyin**: SQL scriptlerini �al��t�rarak ilgili prosed�r ve trigger�lar� olu�turun.

## Kullan�m

- Sistemde sipari� verildi�inde otomatik olarak stok miktar� g�ncellenir.
- Stok azald���nda uyar� verir ve d���k stok raporu olu�turur.

## Lisans

Bu proje MIT lisans� alt�ndad�r.