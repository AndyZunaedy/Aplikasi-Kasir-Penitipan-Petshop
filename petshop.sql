-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Okt 2020 pada 03.15
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petshop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_grooming`
--

CREATE TABLE `data_grooming` (
  `id` varchar(11) NOT NULL,
  `id_transaksi` varchar(7) NOT NULL,
  `id_pelanggan` varchar(7) NOT NULL,
  `jenis_layanan` varchar(25) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `nama_kucing` varchar(50) NOT NULL,
  `nama_paket` varchar(35) NOT NULL,
  `sub_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_grooming`
--

INSERT INTO `data_grooming` (`id`, `id_transaksi`, `id_pelanggan`, `jenis_layanan`, `tanggal_masuk`, `nama_kucing`, `nama_paket`, `sub_total`) VALUES
('GRT001', 'TR001', 'P002', 'Grooming', '2020-09-21', 'cika', 'Grooming standart', 28000);

--
-- Trigger `data_grooming`
--
DELIMITER $$
CREATE TRIGGER `triger_grooming` AFTER INSERT ON `data_grooming` FOR EACH ROW INSERT INTO detail_transaksi
SET
id = NEW.id,
id_transaksi = NEW.id_transaksi,
id_pelanggan= NEW.id_pelanggan,
nama_kucing = NEW.nama_kucing,
tanggal_masuk = NEW.tanggal_masuk,
jenis_layanan = NEW.jenis_layanan,
nama_paket = NEW.nama_paket,
sub_total = NEW.sub_total
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_detail_transaksi` BEFORE UPDATE ON `data_grooming` FOR EACH ROW UPDATE detail_transaksi
SET

id_transaksi = NEW.id_transaksi,
id_pelanggan= NEW.id_pelanggan,
nama_kucing = NEW.nama_kucing,
tanggal_masuk = NEW.tanggal_masuk,
jenis_layanan = NEW.jenis_layanan,
nama_paket = NEW.nama_paket,
sub_total = NEW.sub_total
WHERE detail_transaksi.id = NEW.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_hewan`
--

CREATE TABLE `data_hewan` (
  `id_hewan` varchar(7) NOT NULL,
  `id_pelanggan` varchar(7) NOT NULL,
  `nama_kucing` varchar(50) NOT NULL,
  `ras_kucing` varchar(25) NOT NULL,
  `umur` varchar(25) NOT NULL,
  `deskripsi_kucing` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_hewan`
--

INSERT INTO `data_hewan` (`id_hewan`, `id_pelanggan`, `nama_kucing`, `ras_kucing`, `umur`, `deskripsi_kucing`) VALUES
('H001', 'P002', 'cika', 'lokal', '2 tahun', 'abu abu strip putih'),
('H002', 'P002', 'suti', 'anggora', '1 tahun', 'bulu orange');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_paket`
--

CREATE TABLE `data_paket` (
  `kode_paket` varchar(7) NOT NULL,
  `nama_paket` varchar(50) NOT NULL,
  `keterangan_paket` varchar(100) NOT NULL,
  `harga_paket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_paket`
--

INSERT INTO `data_paket` (`kode_paket`, `nama_paket`, `keterangan_paket`, `harga_paket`) VALUES
('GR001', 'Grooming standart', 'Mandi + rapikan rambut', 28000),
('GR002', 'Grooming full servis', 'Mandi + Gunting Kuku + Parfum + rapikan rambut', 50000),
('GR003', 'Grooming kutu', 'Mandi + Makan + Gunting Kuku + shampo kutu', 70000),
('GR004', 'Grooming spesial', 'Mandi + gunting kuku + shampoo kutu + bersihkan telinga', 80000),
('GR005', 'Grooming Kuku', 'Mandi + rapikan rambut + gunting kuku', 35000),
('GR007', 'Grooming biasa', 'Mandi + Rapihkan Rambut', 25000),
('PN001', 'Penitipan Mandiri', 'Pakan Sendiri (peralatan disediakan)', 9000),
('PN002', 'Penitipan Treatment', 'Pakan Sendiri + mandi 2x + peralatan disediakan', 15000),
('PN003', 'Penitipan Lengkap', 'Makan dan peralatan disediakan', 30000),
('PN004', 'Penitipan Grooming', 'semua disediakan petshop + mandi + bersihkan telinga + gunting kuku', 50000),
('PN005', 'Penitipan Grooming kutu', 'semua disediakan petshop + mandi + shampoo anti kutu + bersihkan telinga + gunting kuku', 55500),
('PN006', 'Penitipan spesial', 'pakan sendiri + peralatan disediakan + mandi 1x + gunting kuku', 25000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_penitipan`
--

CREATE TABLE `data_penitipan` (
  `id` varchar(11) NOT NULL,
  `id_transaksi` varchar(7) NOT NULL,
  `id_pelanggan` varchar(7) NOT NULL,
  `jenis_layanan` varchar(20) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `lama_penitipan` int(11) NOT NULL,
  `nama_kucing` varchar(50) NOT NULL,
  `no_kandang` varchar(5) NOT NULL,
  `nama_paket` varchar(35) NOT NULL,
  `sub_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_penitipan`
--

INSERT INTO `data_penitipan` (`id`, `id_transaksi`, `id_pelanggan`, `jenis_layanan`, `tanggal_masuk`, `tanggal_keluar`, `lama_penitipan`, `nama_kucing`, `no_kandang`, `nama_paket`, `sub_total`) VALUES
('01A001', 'TR001', 'P002', 'Penitipan', '2020-09-21', '2020-09-23', 2, 'suti', 'KD003', 'Penitipan Mandiri', 18000),
('01A002', 'TR002', 'P002', 'Penitipan', '2020-09-21', '2020-09-25', 4, 'cika', 'KD001', 'Penitipan Lengkap', 120000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` varchar(11) NOT NULL,
  `id_transaksi` varchar(7) NOT NULL,
  `id_pelanggan` varchar(7) NOT NULL,
  `nama_kucing` varchar(50) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `jenis_layanan` varchar(20) NOT NULL,
  `nama_paket` varchar(35) NOT NULL,
  `sub_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kandang`
--

CREATE TABLE `kandang` (
  `nomor_kandang` varchar(15) NOT NULL,
  `status_kandang` varchar(15) NOT NULL,
  `deskripsi_kandang` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kandang`
--

INSERT INTO `kandang` (`nomor_kandang`, `status_kandang`, `deskripsi_kandang`) VALUES
('KD001', 'Tersedia', 'Kandang Warna Merah'),
('KD002', 'Tersedia', 'Kandang Berwarna Hijau'),
('KD003', 'Tersedia', 'Kandang Berwarna Biru'),
('KD004', 'Tersedia', 'Kandang Berwarna Hitam'),
('KD005', 'Tersedia', 'Kandang Berwarna Hijau muda'),
('KD007', 'Tersedia', 'Kandang Warna Coklat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(7) NOT NULL,
  `nama` varchar(75) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telpon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama`, `username`, `password`, `status`, `alamat`, `no_telpon`) VALUES
('KY001', 'Andy', 'andy', '27071997', 'Karyawan', 'Tlogoadi Mlati Sleman', '081296797295'),
('KY005', 'suradi', 'suradi', '123456', 'Admin', 'Jl, Kronggahan 3', '081298678943'),
('KY006', 'farras', 'farras', '12345', 'Admin', 'Kronggahan', '0812978859');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(7) NOT NULL,
  `nama_pelanggan` varchar(75) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `no_telpon`, `alamat`) VALUES
('P001', 'Alfian', '082225829349', 'Sleman'),
('P002', 'Alfian', '081296779678', 'Mlati Kronggahan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `room`
--

CREATE TABLE `room` (
  `id` varchar(11) NOT NULL,
  `id_transaksi` varchar(7) NOT NULL,
  `id_pelanggan` varchar(7) NOT NULL,
  `jenis_layanan` varchar(20) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `lama_penitipan` int(11) NOT NULL,
  `nama_kucing` varchar(50) NOT NULL,
  `no_kandang` varchar(5) NOT NULL,
  `nama_paket` varchar(35) NOT NULL,
  `sub_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `room`
--
DELIMITER $$
CREATE TRIGGER `triger_peniitpian` AFTER INSERT ON `room` FOR EACH ROW INSERT INTO detail_transaksi
SET
id = NEW.id,
id_transaksi = NEW.id_transaksi,
id_pelanggan= NEW.id_pelanggan,
nama_kucing = NEW.nama_kucing,
tanggal_masuk = NEW.tanggal_masuk,
jenis_layanan = NEW.jenis_layanan,
nama_paket = NEW.nama_paket,
sub_total = NEW.sub_total
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `triger_update_room` BEFORE UPDATE ON `room` FOR EACH ROW UPDATE detail_transaksi
SET

id_transaksi = NEW.id_transaksi,
id_pelanggan= NEW.id_pelanggan,
nama_kucing = NEW.nama_kucing,
tanggal_masuk = NEW.tanggal_masuk,
jenis_layanan = NEW.jenis_layanan,
nama_paket = NEW.nama_paket,
sub_total = NEW.sub_total
WHERE detail_transaksi.id = NEW.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(7) NOT NULL,
  `nama_pelanggan` varchar(75) NOT NULL,
  `tanggal` date NOT NULL,
  `total` double NOT NULL,
  `bayar` double NOT NULL,
  `kembalian` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `nama_pelanggan`, `tanggal`, `total`, `bayar`, `kembalian`) VALUES
('TR001', 'Alfian', '2020-09-21', 46000, 100000, 54000),
('TR002', 'Alfian', '2020-09-21', 120000, 130000, 10000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_grooming`
--
ALTER TABLE `data_grooming`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_hewan`
--
ALTER TABLE `data_hewan`
  ADD PRIMARY KEY (`id_hewan`);

--
-- Indeks untuk tabel `data_paket`
--
ALTER TABLE `data_paket`
  ADD PRIMARY KEY (`kode_paket`);

--
-- Indeks untuk tabel `data_penitipan`
--
ALTER TABLE `data_penitipan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kandang`
--
ALTER TABLE `kandang`
  ADD PRIMARY KEY (`nomor_kandang`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
