USE DATA_TABUNGAN

insert into Customers 
	values
	(123456, 'Ardi Jono', '2001-03-09', 'Jakarta', 'L', '0', 0),
	(123457, 'Hani Pulungan', '1987-01-23', 'Jawa Barat', 'P', '1', 25000000),
	(123458, 'Mutiara Rahayu', '1999-06-13', 'Sulawesi Tengah', 'P', '2', 5000000),
	(123459, 'Dian Kusuma', '1975-12-17', 'Jawa Timur', 'P', '0', 8000000),
	(123455, 'Febrian siregar', '1991-09-12', 'Sumatera Utara', 'L', '1', 3000000);

INSERT INTO master_data_pinjaman
	values
	(987654321, '2019-03-09 06:50:00', '2023-03-09 06:50:00' , 123455),
	(987654322, '2021-01-15 07:22:00', '2022-01-14 07:22:00', 123457),
	(987654323, '2020-06-27 08:45:00', '2025-06-26 08:45:00', 123458);

INSERT INTO Master_Data_Tabungan
	values
	(543219876, 'Konvensional', '2018-01-22 09:30:00', 3, 123456, 56),
	(543219875, 'Konvensional', '2018-02-23 09:33:00', 1, 123457, 57),
	(543219874, 'Giro', '2019-05-27 11:29:00', 2, 123458, 56),
	(543219873, 'Konvensional', '2019-07-30 12:01:00', 1, 123459, 58),
	(543219872, 'Konvensional', '2019-07-21 08:55:00', 1, 123455, 59),
	(543219871, 'Haji', '2019-012-28 14:24:00', 1, 123457, 57);

INSERT INTO saldo_sisa_tabungan
	values
	(543219873, 1598765432, 'Credit', 5000000),
	(543219875, 1598765433, 'Debit', 73000000),
	(543219871, 1598765434, 'Credit', 400000),
	(543219875, 1598765435, 'Credit', 74000000),
	(543219872, 1598765435, 'Debit', 150000),
	(543219871, 1598765436, 'Credit', 960000),
	(543219875, 1598765436, 'Debit', 73440000),
	(543219875, 1598765437, 'Credit', 73504296),
	(543219873, 1598765438, 'Debit', 4793998);

INSERT INTO transaksi_simpanan
	values
	(1598765432, 500000, '2021-05-09 09:30:00'),
	(1598765433, 25000, '2021-05-09 10:30:00'),
	(1598765434, 300000, '2021-05-09 12:20:00'),
	(1598765435, 1000000, '2021-05-09 15:10:00'),
	(1598765436, 560000, '2021-05-10 08:50:00'),
	(1598765437, 64296, '2021-05-10 10:40:00'),
	(1598765438, 206002, '2021-05-10 10:50:00');

INSERT INTO detail_status_rekening
	values
	(1, 'Aktif'),
	(2, 'Closed'),
	(3, 'Dormant');

INSERT INTO lokasi_unit
	values
	(55, 'Suralaya', 'Kanca Surabaya', 'Jawa Timur'),
	(56, 'Manggarai', 'Kanca Jakarta Selatan', 'Jakarta'),
	(57, 'Sudirman', 'Kanca Jakarta Pusat', 'Jakarta'),
	(58, 'Patihan', 'Kanca Palu', 'Sulawesi'),
	(59, 'Singgalok', 'Kanca Toba', 'Sumatera');