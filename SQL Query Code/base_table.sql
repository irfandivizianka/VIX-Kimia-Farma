CREATE TABLE base_table AS(SELECT
						   	pj.id_invoice ||''|| pj.id_barang AS id_penjualan,
						   	pj.id_invoice,
						   	pj.tanggal,
						   	pj.id_customer,
						   	pj.id_barang,
						   	pj.jumlah_barang,
						   	pj.unit,
						   	pj.harga,
						   	pj.mata_uang,
						   	pg.level,
						   	pg.nama,
						   	pg.id_cabang_sales,
						   	pg.cabang_sales,
						   	pg.id_distributor,
						   	pg.grup,
						   	brg.kode_barang,
						   	brg.nama_barang,
						   	brg.kemasan,
						   	brg.nama_tipe,
						   	brg.kode_brand,
						   	brg.brand
						   FROM penjualan AS pj
						   LEFT JOIN pelanggan AS pg ON pg.id_customer = pj.id_customer
						   LEFT JOIN barang AS brg ON brg.kode_barang = pj.id_barang
						   );
-- Determine Primary Key
ALTER TABLE base_table ADD PRIMARY KEY(id_penjualan);
-- Export Queries to CSV
COPY(SELECT *
	 FROM base_table
	) TO 'E:\Bootcamp\Kimia Farma\Task 5\base_table.csv' DELIMITER ',' CSV HEADER;