-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 18 Des 2019 pada 05.39
-- Versi Server: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_commerce`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(4) NOT NULL,
  `kd_diskon` int(4) NOT NULL,
  `kode_barang` varchar(10) DEFAULT NULL,
  `kd_kategori` int(4) NOT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `stok` int(9) NOT NULL,
  `harga` varchar(9) DEFAULT NULL,
  `deskripsi` text,
  `foto` varchar(225) DEFAULT NULL,
  `kd_status_barang` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `kd_diskon`, `kode_barang`, `kd_kategori`, `nama_barang`, `stok`, `harga`, `deskripsi`, `foto`, `kd_status_barang`) VALUES
(1, 0, '1', 3, 'Swallow', 2, '100000', 'Hanya Untuk Sultan', 'file_1575904939.png', 2),
(2, 0, '2', 1, 'Nike', 1, '200000', 'Hanya', 'file_1575904977.png', 2),
(3, 0, '3', 2, 'Baju Apa aja deh', 4, '240000', 'Halo', 'file_1575905014.jpg', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `no_rekening` int(20) NOT NULL,
  `tempat_lahir` varchar(40) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text,
  `foto` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `id_user`, `no_rekening`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `foto`) VALUES
(1, 25, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `diskon`
--

CREATE TABLE `diskon` (
  `kd_diskon` int(4) NOT NULL,
  `diskon` varchar(10) DEFAULT NULL,
  `kategori_diskon` varchar(50) NOT NULL,
  `tanggal_awal` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `faqs`
--

CREATE TABLE `faqs` (
  `kd_faqs` int(4) NOT NULL,
  `faqs` text,
  `jawab` text,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto_b`
--

CREATE TABLE `foto_b` (
  `id_foto` int(4) NOT NULL,
  `id_barang` int(4) NOT NULL,
  `gallery` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `foto_b`
--

INSERT INTO `foto_b` (`id_foto`, `id_barang`, `gallery`) VALUES
(3, 2, 'file_1576037830.png'),
(4, 2, 'file_1576038035.jpg'),
(5, 2, 'file_1576038075.jpg'),
(6, 2, 'file_1576038369.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `info`
--

CREATE TABLE `info` (
  `kd_info` int(4) NOT NULL,
  `nama_info` varchar(60) DEFAULT NULL,
  `no_rek` varchar(30) DEFAULT NULL,
  `lokasi_info` text,
  `telephone` varchar(16) DEFAULT NULL,
  `tentang` text,
  `logo` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `info`
--

INSERT INTO `info` (`kd_info`, `nama_info`, `no_rek`, `lokasi_info`, `telephone`, `tentang`, `logo`) VALUES
(1, 'Hummasoft', '417227461', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3951.9521455537065!2d112.60469731402608!3d-7.900068680794556!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7881c2c4637501%3A0x10433eaf1fb2fb4c!2sHummasoft%20Komputindo!5e0!3m2!1sid!2sid!4v1576219698205!5m2!1sid!2sid', '02989184', 'jajdabj', 'file_1575991993.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kd_kategori` int(4) NOT NULL,
  `jenis_kategori` varchar(20) DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kd_kategori`, `jenis_kategori`, `status`) VALUES
(1, 'Sepatu', 1),
(2, 'Baju', 1),
(3, 'Sandal', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(4) NOT NULL,
  `id_barang` int(4) NOT NULL,
  `id_customer` int(4) NOT NULL,
  `kuantiti` int(4) NOT NULL,
  `status_k` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kritik`
--

CREATE TABLE `kritik` (
  `id_kritik` int(4) NOT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `kritik` text,
  `id_customer` int(4) NOT NULL,
  `id_barang` int(4) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fotok` varchar(225) DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `no_ktp` varchar(17) NOT NULL,
  `tempat_lahir` varchar(40) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `id_user`, `no_ktp`, `tempat_lahir`, `tanggal_lahir`, `alamat`) VALUES
(1, 1, '3511112206980002', 'Probolinggo', '1998-06-10', 'hsvadavsd'),
(14, 26, '3513056909980001', 'probolinggo', '1998-09-27', 'Jl. Ronggo Jalu Gg. Kyai Arjo No 220'),
(15, 27, '', NULL, NULL, NULL),
(16, 28, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `kd_pembayaran` int(4) NOT NULL,
  `id_customer` int(4) NOT NULL,
  `jenis_pembayaran` varchar(40) DEFAULT NULL,
  `biaya_admin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `kd_pembelian` int(4) NOT NULL,
  `kd_transaksi` int(4) NOT NULL,
  `kd_pembayaran` int(4) NOT NULL,
  `id_barang` int(4) NOT NULL,
  `kd_ongkir` int(4) NOT NULL,
  `jumlah_beli` int(9) NOT NULL,
  `tanggal_pembelian` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_b`
--

CREATE TABLE `riwayat_b` (
  `kd_riwayat` int(4) NOT NULL,
  `id_barang` int(4) NOT NULL,
  `stok_masuk` int(9) NOT NULL,
  `stok_keluar` int(9) NOT NULL,
  `tanggal_stok_masuk` date DEFAULT NULL,
  `tanggal_stok_keluar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_p`
--

CREATE TABLE `status_p` (
  `kd_status_pegawai` int(4) NOT NULL,
  `status_pegawai` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_pem`
--

CREATE TABLE `status_pem` (
  `id_status` int(4) NOT NULL,
  `kd_pembayaran` int(10) DEFAULT NULL,
  `status_bayar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_opname`
--

CREATE TABLE `stok_opname` (
  `id_stok_opname` int(10) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_barang` int(4) NOT NULL,
  `sisa` int(10) NOT NULL,
  `selisih` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_login`
--

CREATE TABLE `tb_login` (
  `id_user` int(4) NOT NULL,
  `nama` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `confirm_password` varchar(60) DEFAULT NULL,
  `tlp` varchar(15) DEFAULT NULL,
  `foto` varchar(225) NOT NULL,
  `cek` int(2) NOT NULL DEFAULT '0',
  `status_user` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_login`
--

INSERT INTO `tb_login` (`id_user`, `nama`, `email`, `password`, `confirm_password`, `tlp`, `foto`, `cek`, `status_user`) VALUES
(1, 'Teddi Juniarlaksono', 'tedyjuniarl@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'd033e22ae348aeb5660fc2140aec35850c4da997', '085204993385', 'default.png', 0, 1),
(25, 'Teddi Juniarlaksono', 'tedyjuniarl@gmail.com', '356a192b7913b04c54574d18c28d46e6395428ab', '356a192b7913b04c54574d18c28d46e6395428ab', '08520499338', 'default.png', 0, 4),
(26, 'Alda Gheauly', 'aldagheauly@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'd033e22ae348aeb5660fc2140aec35850c4da997', '08520499338', 'file_1576045903.png', 0, 2),
(27, 'Teddi Juniarlaksono', 'tedyjuniarl@gmail.com', '356a192b7913b04c54574d18c28d46e6395428ab', '356a192b7913b04c54574d18c28d46e6395428ab', '08520499338', 'default.png', 0, 2),
(28, 'Maulidiyawati', 'maulidiyawati@gmail.com', '356a192b7913b04c54574d18c28d46e6395428ab', '356a192b7913b04c54574d18c28d46e6395428ab', '123243', 'file_1576167670.png', 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(225) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `user_id`, `created`) VALUES
(1, '2b9b0acd3076920e24f54cbc2d1ecd', 1, '2019-12-13'),
(2, '77fb9bd6098bbd19baa3418d41d885', 1, '2019-12-13'),
(3, '558328facd277b2b0c2d2eb6542459', 1, '2019-12-13'),
(4, '5ed555f35f2530044694bc82890117', 1, '2019-12-13'),
(5, '3cca64d73b85e9079c7a3f06c191a5', 1, '2019-12-13'),
(6, '82c3c46cc8112407c3db679aeae52f', 1, '2019-12-13'),
(7, '4dd653a0da68f97d01b86148e6728f', 26, '2019-12-13'),
(8, '609eef99933f99e258667d2e97ef89', 26, '2019-12-13'),
(9, '8972c0bbc52cc684e509665e756b07', 1, '2019-12-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `kd_transaksi` int(4) NOT NULL,
  `id_customer` int(4) NOT NULL,
  `id_status` int(4) NOT NULL,
  `tanggal_pengiriman` date DEFAULT NULL,
  `tanggal_pembellian` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`kd_diskon`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`kd_faqs`);

--
-- Indexes for table `foto_b`
--
ALTER TABLE `foto_b`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`kd_info`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kd_kategori`);

--
-- Indexes for table `kritik`
--
ALTER TABLE `kritik`
  ADD PRIMARY KEY (`id_kritik`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`kd_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`kd_pembelian`);

--
-- Indexes for table `riwayat_b`
--
ALTER TABLE `riwayat_b`
  ADD PRIMARY KEY (`kd_riwayat`);

--
-- Indexes for table `status_p`
--
ALTER TABLE `status_p`
  ADD PRIMARY KEY (`kd_status_pegawai`);

--
-- Indexes for table `status_pem`
--
ALTER TABLE `status_pem`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `stok_opname`
--
ALTER TABLE `stok_opname`
  ADD PRIMARY KEY (`id_stok_opname`);

--
-- Indexes for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kd_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diskon`
--
ALTER TABLE `diskon`
  MODIFY `kd_diskon` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `kd_faqs` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `foto_b`
--
ALTER TABLE `foto_b`
  MODIFY `id_foto` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `kd_info` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kd_kategori` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `kritik`
--
ALTER TABLE `kritik`
  MODIFY `id_kritik` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `kd_pembayaran` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `kd_pembelian` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `id_user` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `kd_transaksi` int(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
