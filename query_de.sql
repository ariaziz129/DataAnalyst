use DATA_TABUNGAN	

select a.[no_rekening], b.[id_transaksi]  
from [dbo].[Master_Data_Tabungan] a
JOIN [dbo].[saldo_sisa_tabungan] b  
ON a.no_rekening = b.no_rekening
JOIN [dbo].[transaksi_simpanan] c
on c.id_transaksi = b.id_transaksi
where c.waktu_transaksi >= '2021-05-10 00:00:00'

select a.[no_rekening], b.[tanggal_lahir]
from [dbo].[Master_Data_Tabungan] a
join [dbo].[Customers] b
on a.customer_id = b.customers_id
where b.[jenis_kelamin] = 'P'

select [id_transaksi], [jumlah_transaksi] from [dbo].[transaksi_simpanan]
ORDER BY [jumlah_transaksi] DESC

select a.[nama_customer]
from [dbo].[Customers] a
join [dbo].[Master_Data_Tabungan] b
on a.customers_id = b.customer_id
join [dbo].[lokasi_unit] c
on b.lokasi_pembuatan_rekening = c.id_unit
where c.kantor_wilayah = 'JAKARTA'

select a.[id_transaksi]
from [dbo].[saldo_sisa_tabungan] a
join [dbo].[Master_Data_Tabungan] b
on a.no_rekening = b.no_rekening
join [dbo].[Customers] c
on b.customer_id=c.customers_id
where c.status_nikah = 1

select a.[id_transaksi]
from [dbo].[saldo_sisa_tabungan] a
join [dbo].[Master_Data_Tabungan] b
on a.no_rekening = b.no_rekening
join [dbo].[Customers] c
on b.customer_id=c.customers_id
where c.provinsi_alamat = 'Jawa Barat' or c.provinsi_alamat = 'Jawa Timur'

select DISTINCT a.[nama_customer]
from [dbo].[Customers] a
join[dbo].[Master_Data_Tabungan] b
on a.customers_id = b.customer_id
join [dbo].[saldo_sisa_tabungan] c
on b.no_rekening = c.no_rekening
join [dbo].[transaksi_simpanan] d
on c.id_transaksi = d.id_transaksi
where d.waktu_transaksi >= '2021-05-09 00:00:00'

select DISTINCT b.[nama_customer],a.[no_rekening_pinjaman]
from [dbo].[master_data_pinjaman] a
join [dbo].[Customers] b
on a.customer_id= b.customers_id
join [dbo].[Master_Data_Tabungan] c
on b.customers_id = c.customer_id
join [dbo].[lokasi_unit] d
on c.lokasi_pembuatan_rekening = d.id_unit
where d.kantor_wilayah = 'JAKARTA'

SELECT b.[customers_id], a.[tanggal_buka_pinjaman]
from [dbo].[master_data_pinjaman] a
join [dbo].[Customers] b
on a.customer_id = b.customers_id
join [dbo].[Master_Data_Tabungan] c
on b.customers_id = c.customer_id
join [dbo].[detail_status_rekening] d
on c.[status_rekening] = d.id_status
join [dbo].[saldo_sisa_tabungan] e
on c.no_rekening = e.no_rekening
join [dbo].[transaksi_simpanan] f
on e.id_transaksi = f.id_transaksi
where f.waktu_transaksi >= '2021-05-09 00:00:00' and e.tipe_transaksi = 'Debit'

select max(a.[gaji])
from [dbo].[Customers] a
join [dbo].[Master_Data_Tabungan] b
on a.customers_id = b.customer_id
join [dbo].[saldo_sisa_tabungan] c
on b.no_rekening = c.no_rekening
join [dbo].[transaksi_simpanan] d
on c.id_transaksi = d.id_transaksi
where d.waktu_transaksi >= '2021-05-10 00:00:00'

select a.[no_rekening], b.[deskripsi_status]
from [dbo].[Master_Data_Tabungan] a
join [dbo].[detail_status_rekening] b
on a.status_rekening = b.id_status
join [dbo].[Customers] c
on a.customer_id = c.customers_id
join [dbo].[master_data_pinjaman] d
on c.customers_id = d.customer_id
where c.[tanggal_lahir] <= '1995-01-01'

select c.[customers_id], sum(a.[sisa_saldo]) as total_saldo, count(a.[id_transaksi]) as frekuensi_transaksi
from [dbo].[saldo_sisa_tabungan] a
join [dbo].[Master_Data_Tabungan] b
on a.no_rekening = b.no_rekening
join [dbo].[Customers] c
on b.[customer_id] = c.[customers_id]
where a.tipe_transaksi = 'Debit'
group by c.customers_id
order by c.customers_id

select c.[customers_id], a.[sisa_saldo], a.[id_transaksi]
from [dbo].[saldo_sisa_tabungan] a
join [dbo].[Master_Data_Tabungan] b
on a.no_rekening = b.no_rekening
join [dbo].[Customers] c
on b.[customer_id] = c.[customers_id]
where a.tipe_transaksi = 'Debit'
--group by c.customers_id
--order by c.customers_id

select a.[tanggal_lahir]
from [dbo].[Customers] a
join [dbo].[Master_Data_Tabungan] b
on a.customers_id = b.customer_id
join [dbo].[saldo_sisa_tabungan] c
on b.no_rekening = c.no_rekening
join [dbo].[transaksi_simpanan] d
on c.id_transaksi = d.id_transaksi
where d.waktu_transaksi >= '2021-05-09 00:00:00' and d.waktu_transaksi < '2021-05-10 00:00:00' and c.sisa_saldo < 1000000

select DISTINCT a.[nama_customer]
from [dbo].[Customers] a
join[dbo].[Master_Data_Tabungan] b
on a.customers_id = b.customer_id
join [dbo].[saldo_sisa_tabungan] c
on b.no_rekening = c.no_rekening
join [dbo].[transaksi_simpanan] d
on c.id_transaksi = d.id_transaksi
where d.waktu_transaksi >= '2021-05-09 00:00:00' and d.waktu_transaksi < '2021-05-10 00:00:00'

select a.[nama_customer], c.[no_rekening], d.[tanggal_buka_pinjaman]
from [dbo].[Customers] a
join [dbo].[Master_Data_Tabungan] b
on a.customers_id = b.customer_id
join [dbo].[saldo_sisa_tabungan] c
on b.no_rekening = c.no_rekening
join [dbo].[master_data_pinjaman] d
on a.customers_id = d.customer_id

select a.[id_transaksi],b.[jumlah_transaksi], d.[nama_customer], d.[tanggal_lahir]
from [dbo].[saldo_sisa_tabungan] a
join [dbo].[transaksi_simpanan] b
on a.id_transaksi = b.id_transaksi
join [dbo].[Master_Data_Tabungan] c
on a.no_rekening = c.no_rekening
join [dbo].[Customers] d
on c.customer_id = d.customers_id
ORDER BY d.[tanggal_lahir] ASC

select distinct a.[no_rekening]
from [dbo].[Master_Data_Tabungan] a
join [dbo].[Customers] b
on a.customer_id = b.customers_id
join [dbo].[master_data_pinjaman] c
on a.customer_id != c.customer_id


select [id_transaksi], [waktu_transaksi]
from [dbo].[transaksi_simpanan]
where [waktu_transaksi] = '2021-05-09 10:30:00.000' or [waktu_transaksi] = '2021-05-10 10:40:00.000'
order by [waktu_transaksi]

select distinct a.[nama_customer], c.[no_rekening], d.[tanggal_buka_pinjaman]
from [dbo].[Customers] a
join [dbo].[Master_Data_Tabungan] b
on a.customers_id = b.customer_id
join [dbo].[saldo_sisa_tabungan] c
on b.no_rekening = c.no_rekening
join [dbo].[master_data_pinjaman] d
on a.customers_id = d.customer_id

select distinct (a.[no_rekening])
from [dbo].[Master_Data_Tabungan] a
join [dbo].[Customers] b
on a.customer_id = b.customers_id
right join [dbo].[master_data_pinjaman] c
on b.customers_id != c.customer_id

SELECT waktu_transaksi FROM (
  SELECT
    ROW_NUMBER() OVER (ORDER BY waktu_transaksi ASC) AS rownumber, waktu_transaksi
    FROM dbo.transaksi_simpanan
)  AS waktu
WHERE rownumber = 2






select a.[nama_customer], b.[no_rekening], min(c.[sisa_saldo]) as saldo_terkecil
from [dbo].[Customers] a
join [dbo].[Master_Data_Tabungan] b
on a.customers_id = b.customer_id
join [dbo].[saldo_sisa_tabungan] c
on b.no_rekening = c.no_rekening
group by a.[nama_customer], b.[no_rekening]
