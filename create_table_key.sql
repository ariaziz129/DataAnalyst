USE DATA_TABUNGAN

CREATE TABLE detail_status_rekening(
id_status int PRIMARY KEY,
deskripsi_status char(20));

CREATE TABLE Master_Data_Tabungan(
no_rekening int PRIMARY KEY,
jenis_rekening char(20),
tanggal_buka_rekening datetime,
status_rekening int,
customer_id int,
lokasi_pembuatan_rekening int);

CREATE TABLE saldo_sisa_tabungan(
no_rekening int ,
id_transaksi int ,
tipe_transaksi char (10),
sisa_saldo decimal(19,2));

CREATE TABLE transaksi_simpanan(
id_transaksi int PRIMARY KEY,
jumlah_transaksi decimal(19,2),
waktu_transaksi datetime);

CREATE TABLE lokasi_unit(
id_unit int PRIMARY KEY,
nama_unit char(20),
nama_cabang char(30),
kantor_wilayah char(20));

CREATE TABLE Customers(
customers_id int PRIMARY KEY,
nama_customer char(50),
tanggal_lahir date,
provinsi_alamat char(30),
jenis_kelamin char(1),
status_nikah char(1),
gaji int);

CREATE TABLE master_data_pinjaman(
no_rekening_pinjaman int PRIMARY KEY,
tanggal_buka_pinjaman datetime,
tanggal_berakhir_pinjaman datetime,
customer_id int);


alter table Master_Data_Tabungan add foreign key (status_rekening) references detail_status_rekening(id_status);
alter table Master_Data_Tabungan add foreign key (customer_id) references Customers(customers_id);
alter table Master_Data_Tabungan add foreign key (lokasi_pembuatan_rekening) references lokasi_unit(id_unit);
alter table saldo_sisa_tabungan add foreign key (no_rekening) references Master_Data_Tabungan(no_rekening);
alter table saldo_sisa_tabungan add foreign key (id_transaksi) references transaksi_simpanan(id_transaksi);
alter table Master_Data_Pinjaman add foreign key (customer_id) references Customers(customers_id);
