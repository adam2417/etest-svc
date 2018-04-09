-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2018 at 10:14 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_quisioner`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_catatan`
--

CREATE TABLE `tb_catatan` (
  `kd_lap` int(11) NOT NULL,
  `catatan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_catatan`
--

INSERT INTO `tb_catatan` (`kd_lap`, `catatan`) VALUES
(2, 'test catatan yang banyak ya');

-- --------------------------------------------------------

--
-- Table structure for table `tb_desa`
--

CREATE TABLE `tb_desa` (
  `kd_desa` int(11) NOT NULL,
  `nm_desa` varchar(100) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_grup_ikan`
--

CREATE TABLE `tb_grup_ikan` (
  `kd_grup` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_grup_ikan`
--

INSERT INTO `tb_grup_ikan` (`kd_grup`, `deskripsi`, `is_active`) VALUES
(511, 'Ikan Pelagis Kecil', 1),
(512, 'Ikan Pelagis Besar', 1),
(513, 'Ikan Demersal', 1),
(514, 'Ikan Karang', 1),
(515, 'Binatang Kulit Keras', 1),
(516, 'Binatang Lunak', 1),
(517, 'Biota Laut Lainnya', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_ikan`
--

CREATE TABLE `tb_jenis_ikan` (
  `kd_ikan` int(11) NOT NULL,
  `nama_ikan` text NOT NULL,
  `grup` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenis_ikan`
--

INSERT INTO `tb_jenis_ikan` (`kd_ikan`, `nama_ikan`, `grup`, `is_active`) VALUES
(51101, 'Banyar', 511, 1),
(51102, 'Belanak', 511, 1),
(51103, 'Betong', 511, 1),
(51104, 'Cendro', 511, 1),
(51105, 'Daun bambu/Talang-talang', 511, 1),
(51106, 'Ikan terbang', 511, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kabupaten`
--

CREATE TABLE `tb_kabupaten` (
  `kd_kab` int(11) NOT NULL,
  `nm_kab` varchar(100) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kabupaten`
--

INSERT INTO `tb_kabupaten` (`kd_kab`, `nm_kab`, `is_active`) VALUES
(1, 'Kab.Ternate', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kecamatan`
--

CREATE TABLE `tb_kecamatan` (
  `kd_kec` int(11) NOT NULL,
  `nm_kec` varchar(100) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kecamatan`
--

INSERT INTO `tb_kecamatan` (`kd_kec`, `nm_kec`, `is_active`) VALUES
(1, 'Kecamatan 1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kel`
--

CREATE TABLE `tb_kel` (
  `kd_kel` int(11) NOT NULL,
  `nm_kel` varchar(100) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ket_keg_pendaratan_ikan_hdr`
--

CREATE TABLE `tb_ket_keg_pendaratan_ikan_hdr` (
  `kd_ket` int(11) NOT NULL,
  `ket_kegiatan` text,
  `selection_list` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_ket_keg_pendaratan_ikan_hdr`
--

INSERT INTO `tb_ket_keg_pendaratan_ikan_hdr` (`kd_ket`, `ket_kegiatan`, `selection_list`) VALUES
(1, 'Apakah tempat pendaratan ikan ini dikelola oleh Dinas Perikanan setempat?', 'Ya#Tidak'),
(2, 'Jika tidak, (rincian 1 berkode 2) Apakah ada kelompok/perorangan yang mengelola nelayan', 'Ya#Tidak'),
(3, 'Apakah dipungut retribusi dari hasil tangkapan yang diperoleh?', 'Ya#Tidak'),
(4, 'Bila ada pungutan retribusi (R.3 kode 1)?', '#'),
(5, 'Penjualan hasil tangkapan yang didaratkan biasanya dilakukan secara', 'Sendiri#Berkelompok dan dikoordinir#~#Tidak dijual'),
(6, 'Bila nelayan melakukan penjualan hasil (Jika R.5 berkode selain 4), kemana sebagian besar ikan hasil\r\ntangkapan dijual?', 'Perusahaan#Tengkulak/Pengumpul#TPI Terdekat#Pasar#~'),
(7, 'Bila R.6 berkode 3, sebutkan nama dan alamat TPI yang dimaksud', '#'),
(8, 'Volume Ikan', '#');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ket_keg_pendaratan_ikan_sub`
--

CREATE TABLE `tb_ket_keg_pendaratan_ikan_sub` (
  `kd_sub` int(11) NOT NULL,
  `kd_ket` int(11) DEFAULT NULL,
  `ket` text,
  `selection` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_ket_keg_pendaratan_ikan_sub`
--

INSERT INTO `tb_ket_keg_pendaratan_ikan_sub` (`kd_sub`, `kd_ket`, `ket`, `selection`) VALUES
(1, 4, 'Siapa yang memungut retribusi?', 'PEMDA#Dinas Perikanan#Swasta#KUB#~'),
(2, 4, 'Berapa persen besarnya pungutan retribusi?', '~'),
(3, 7, 'Nama TPI', '~'),
(4, 7, 'Alamat TPI', '~'),
(5, 7, 'Jarak TPI dari lokasi / tempat pendaratan', '~'),
(6, 8, 'Volume ikan yang didaratkan pada triwulan ini dibanding triwulan sebelumnya', 'Meningkat#Sama Saja#Menurun'),
(7, 8, 'Jika kondisinya meningkat, sama saja, atau menurun berikan alasan penyebabnya', '~');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ket_ptgs_pemeriksa`
--

CREATE TABLE `tb_ket_ptgs_pemeriksa` (
  `kd_petugas` int(11) NOT NULL,
  `nm_petugas` text NOT NULL,
  `tgl_pemeriksaan` datetime DEFAULT CURRENT_TIMESTAMP,
  `kd_lap` int(11) NOT NULL,
  `checked` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ket_ptgs_pencacah`
--

CREATE TABLE `tb_ket_ptgs_pencacah` (
  `kd_petugas` int(11) NOT NULL,
  `nm_petugas` text NOT NULL,
  `tgl_pencacahan` datetime DEFAULT CURRENT_TIMESTAMP,
  `kd_lap` int(11) NOT NULL,
  `checked` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ket_tmp_pendaratan_ikan_trad`
--

CREATE TABLE `tb_ket_tmp_pendaratan_ikan_trad` (
  `kd_lap` int(11) NOT NULL,
  `triwulan_ke` int(11) DEFAULT NULL,
  `tahun_ke` int(11) DEFAULT NULL,
  `provinsi` int(11) DEFAULT NULL,
  `kabupaten` int(11) DEFAULT NULL,
  `kota` int(11) DEFAULT NULL,
  `kecamatan` int(11) DEFAULT NULL,
  `desa` int(11) DEFAULT NULL,
  `kelurahan` int(11) DEFAULT NULL,
  `no_urut_tempat` varchar(10) DEFAULT NULL,
  `nama_tempat` varchar(50) DEFAULT NULL,
  `alamat` varchar(2000) DEFAULT NULL,
  `kodepos` varchar(5) DEFAULT NULL,
  `kd_kondisi` int(11) DEFAULT NULL,
  `status_lap` varchar(1) NOT NULL DEFAULT 'O' COMMENT 'Status Laporan : O=Open; C=Closed/Telah diperiksa, D=Draft'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_ket_tmp_pendaratan_ikan_trad`
--

INSERT INTO `tb_ket_tmp_pendaratan_ikan_trad` (`kd_lap`, `triwulan_ke`, `tahun_ke`, `provinsi`, `kabupaten`, `kota`, `kecamatan`, `desa`, `kelurahan`, `no_urut_tempat`, `nama_tempat`, `alamat`, `kodepos`, `kd_kondisi`, `status_lap`) VALUES
(1, 2, 2017, 1, 1, 0, 1, 0, 0, '1', 'tes', 'adf', NULL, 1, 'C'),
(2, 2, 2017, 1, 1, 0, 1, 0, 0, '1', 'tes', 'tes', NULL, 1, 'O');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kol_hasil_tangkapan`
--

CREATE TABLE `tb_kol_hasil_tangkapan` (
  `kd_kolom` int(11) NOT NULL,
  `desc` text NOT NULL,
  `jm_hari` int(11) NOT NULL,
  `rerata_perahu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kol_hasil_tangkapan`
--

INSERT INTO `tb_kol_hasil_tangkapan` (`kd_kolom`, `desc`, `jm_hari`, `rerata_perahu`) VALUES
(1, 'Perahu Tanpa Motor', 0, 0),
(2, 'Perahu Motor Tempel', 0, 0),
(3, 'Kapal Motor', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kondisi_tempat`
--

CREATE TABLE `tb_kondisi_tempat` (
  `kd_kondisi` int(11) NOT NULL,
  `ket` varchar(100) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kondisi_tempat`
--

INSERT INTO `tb_kondisi_tempat` (`kd_kondisi`, `ket`, `is_active`) VALUES
(1, 'Aktif', 1),
(2, 'Tutup Sementara', 1),
(3, 'Tutup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kota`
--

CREATE TABLE `tb_kota` (
  `kd_kota` int(11) NOT NULL,
  `nm_kota` varchar(100) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE `tb_login` (
  `userid` varchar(25) NOT NULL,
  `pass` varchar(2000) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1',
  `last_login` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`userid`, `pass`, `is_active`, `last_login`) VALUES
('tes', '12345', 1, '2017-05-04 19:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `kd_petugas` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `nm_petugas` varchar(500) DEFAULT NULL,
  `jabatan` varchar(2000) NOT NULL,
  `is_active` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_provinsi`
--

CREATE TABLE `tb_provinsi` (
  `kd_prov` int(11) NOT NULL,
  `nm_prov` varchar(100) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_provinsi`
--

INSERT INTO `tb_provinsi` (`kd_prov`, `nm_prov`, `is_active`) VALUES
(1, 'Maluku Utara', 1),
(2, 'Maluku', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rerata_hasil_tangkapan`
--

CREATE TABLE `tb_rerata_hasil_tangkapan` (
  `kd_hasil` int(11) NOT NULL,
  `kd_ikan` int(11) NOT NULL,
  `kd_kol` int(11) NOT NULL,
  `kd_lap` int(11) NOT NULL,
  `volume_ikan` int(11) NOT NULL,
  `harga_ikan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rerata_hasil_tangkapan`
--

INSERT INTO `tb_rerata_hasil_tangkapan` (`kd_hasil`, `kd_ikan`, `kd_kol`, `kd_lap`, `volume_ikan`, `harga_ikan`) VALUES
(1, 51101, 1, 2, 0, 0),
(2, 51101, 2, 2, 0, 0),
(3, 51101, 3, 2, 20, 7),
(4, 51106, 1, 2, 125, 2),
(5, 51106, 2, 2, 0, 0),
(6, 51106, 3, 2, 35, 800);

-- --------------------------------------------------------

--
-- Table structure for table `tb_responden`
--

CREATE TABLE `tb_responden` (
  `kd_responden` int(11) NOT NULL,
  `nama_responden` text NOT NULL,
  `jabatan` text NOT NULL,
  `kd_lap` int(11) NOT NULL,
  `tgl_responden` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_responden`
--

INSERT INTO `tb_responden` (`kd_responden`, `nama_responden`, `jabatan`, `kd_lap`, `tgl_responden`) VALUES
(1, 'test', 'ada aja', 2, '2017-05-28 12:35:01');

-- --------------------------------------------------------

--
-- Table structure for table `tb_trx_kol_hsl`
--

CREATE TABLE `tb_trx_kol_hsl` (
  `kd_lap` int(11) NOT NULL,
  `kd_kol` int(11) NOT NULL,
  `jml_hari` int(11) NOT NULL,
  `rerata_perahu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_trx_kol_hsl`
--

INSERT INTO `tb_trx_kol_hsl` (`kd_lap`, `kd_kol`, `jml_hari`, `rerata_perahu`) VALUES
(2, 1, 6, 3),
(2, 2, 4, 2),
(2, 3, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_ket_info_pendaratan_ikan`
--

CREATE TABLE `tb_user_ket_info_pendaratan_ikan` (
  `kd_ket_user` int(11) NOT NULL,
  `kd_ket` int(11) DEFAULT NULL,
  `kd_sub` int(11) DEFAULT NULL,
  `kd_user` varchar(150) DEFAULT NULL,
  `kd_lap` int(11) NOT NULL,
  `user_selection` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_ket_info_pendaratan_ikan`
--

INSERT INTO `tb_user_ket_info_pendaratan_ikan` (`kd_ket_user`, `kd_ket`, `kd_sub`, `kd_user`, `kd_lap`, `user_selection`) VALUES
(1, 1, NULL, '0', 1, 'Ya'),
(2, 2, NULL, '0', 1, 'Tidak'),
(3, 3, NULL, '0', 1, 'Tidak'),
(4, 4, 1, '0', 1, 'PEMDA'),
(5, 4, 1, '0', 1, 'PEMDA'),
(6, 4, 2, '0', 1, '100 %'),
(7, 5, 2, '0', 1, 'Sendiri'),
(8, 5, 2, '0', 1, 'Sendiri'),
(9, 6, 2, '0', 1, 'Perusahaan'),
(10, 6, 2, '0', 1, 'Perusahaan'),
(11, 7, 3, '0', 1, 'tes'),
(12, 7, 4, '0', 1, 'TES'),
(13, 7, 5, '0', 1, '123 KM'),
(14, 8, 6, '0', 1, 'Meningkat'),
(15, 8, 7, '0', 1, 'TES'),
(16, 1, NULL, '0', 1, 'Tidak'),
(17, 2, NULL, '0', 1, 'Ya'),
(18, 3, NULL, '0', 1, 'Tidak'),
(19, 4, 1, '0', 1, 'PEMDA'),
(20, 4, 1, '0', 1, 'PEMDA'),
(21, 4, 2, '0', 1, '100 %'),
(22, 5, 2, '0', 1, 'Sendiri'),
(23, 5, 2, '0', 1, 'Sendiri'),
(24, 6, 2, '0', 1, 'Perusahaan'),
(25, 6, 2, '0', 1, 'Perusahaan'),
(26, 7, 3, '0', 1, 'tes'),
(27, 7, 4, '0', 1, 'TES'),
(28, 7, 5, '0', 1, '123 KM'),
(29, 8, 6, '0', 1, 'Meningkat'),
(30, 8, 7, '0', 1, 'TES');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_catatan`
--
ALTER TABLE `tb_catatan`
  ADD PRIMARY KEY (`kd_lap`);

--
-- Indexes for table `tb_desa`
--
ALTER TABLE `tb_desa`
  ADD PRIMARY KEY (`kd_desa`);

--
-- Indexes for table `tb_grup_ikan`
--
ALTER TABLE `tb_grup_ikan`
  ADD PRIMARY KEY (`kd_grup`);

--
-- Indexes for table `tb_jenis_ikan`
--
ALTER TABLE `tb_jenis_ikan`
  ADD PRIMARY KEY (`kd_ikan`);

--
-- Indexes for table `tb_kabupaten`
--
ALTER TABLE `tb_kabupaten`
  ADD PRIMARY KEY (`kd_kab`);

--
-- Indexes for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD PRIMARY KEY (`kd_kec`);

--
-- Indexes for table `tb_kel`
--
ALTER TABLE `tb_kel`
  ADD PRIMARY KEY (`kd_kel`);

--
-- Indexes for table `tb_ket_keg_pendaratan_ikan_hdr`
--
ALTER TABLE `tb_ket_keg_pendaratan_ikan_hdr`
  ADD PRIMARY KEY (`kd_ket`);

--
-- Indexes for table `tb_ket_keg_pendaratan_ikan_sub`
--
ALTER TABLE `tb_ket_keg_pendaratan_ikan_sub`
  ADD PRIMARY KEY (`kd_sub`);

--
-- Indexes for table `tb_ket_ptgs_pemeriksa`
--
ALTER TABLE `tb_ket_ptgs_pemeriksa`
  ADD PRIMARY KEY (`kd_petugas`);

--
-- Indexes for table `tb_ket_ptgs_pencacah`
--
ALTER TABLE `tb_ket_ptgs_pencacah`
  ADD PRIMARY KEY (`kd_petugas`);

--
-- Indexes for table `tb_ket_tmp_pendaratan_ikan_trad`
--
ALTER TABLE `tb_ket_tmp_pendaratan_ikan_trad`
  ADD PRIMARY KEY (`kd_lap`);

--
-- Indexes for table `tb_kol_hasil_tangkapan`
--
ALTER TABLE `tb_kol_hasil_tangkapan`
  ADD PRIMARY KEY (`kd_kolom`);

--
-- Indexes for table `tb_kondisi_tempat`
--
ALTER TABLE `tb_kondisi_tempat`
  ADD PRIMARY KEY (`kd_kondisi`);

--
-- Indexes for table `tb_kota`
--
ALTER TABLE `tb_kota`
  ADD PRIMARY KEY (`kd_kota`);

--
-- Indexes for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`kd_petugas`);

--
-- Indexes for table `tb_provinsi`
--
ALTER TABLE `tb_provinsi`
  ADD PRIMARY KEY (`kd_prov`);

--
-- Indexes for table `tb_rerata_hasil_tangkapan`
--
ALTER TABLE `tb_rerata_hasil_tangkapan`
  ADD PRIMARY KEY (`kd_hasil`);

--
-- Indexes for table `tb_responden`
--
ALTER TABLE `tb_responden`
  ADD PRIMARY KEY (`kd_responden`);

--
-- Indexes for table `tb_trx_kol_hsl`
--
ALTER TABLE `tb_trx_kol_hsl`
  ADD UNIQUE KEY `kd_lap` (`kd_lap`,`kd_kol`);

--
-- Indexes for table `tb_user_ket_info_pendaratan_ikan`
--
ALTER TABLE `tb_user_ket_info_pendaratan_ikan`
  ADD PRIMARY KEY (`kd_ket_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_desa`
--
ALTER TABLE `tb_desa`
  MODIFY `kd_desa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_kabupaten`
--
ALTER TABLE `tb_kabupaten`
  MODIFY `kd_kab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  MODIFY `kd_kec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_kel`
--
ALTER TABLE `tb_kel`
  MODIFY `kd_kel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_ket_keg_pendaratan_ikan_hdr`
--
ALTER TABLE `tb_ket_keg_pendaratan_ikan_hdr`
  MODIFY `kd_ket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tb_ket_keg_pendaratan_ikan_sub`
--
ALTER TABLE `tb_ket_keg_pendaratan_ikan_sub`
  MODIFY `kd_sub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tb_ket_ptgs_pemeriksa`
--
ALTER TABLE `tb_ket_ptgs_pemeriksa`
  MODIFY `kd_petugas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_ket_ptgs_pencacah`
--
ALTER TABLE `tb_ket_ptgs_pencacah`
  MODIFY `kd_petugas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_ket_tmp_pendaratan_ikan_trad`
--
ALTER TABLE `tb_ket_tmp_pendaratan_ikan_trad`
  MODIFY `kd_lap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_kol_hasil_tangkapan`
--
ALTER TABLE `tb_kol_hasil_tangkapan`
  MODIFY `kd_kolom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_kondisi_tempat`
--
ALTER TABLE `tb_kondisi_tempat`
  MODIFY `kd_kondisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_kota`
--
ALTER TABLE `tb_kota`
  MODIFY `kd_kota` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `kd_petugas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_provinsi`
--
ALTER TABLE `tb_provinsi`
  MODIFY `kd_prov` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_rerata_hasil_tangkapan`
--
ALTER TABLE `tb_rerata_hasil_tangkapan`
  MODIFY `kd_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_responden`
--
ALTER TABLE `tb_responden`
  MODIFY `kd_responden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_user_ket_info_pendaratan_ikan`
--
ALTER TABLE `tb_user_ket_info_pendaratan_ikan`
  MODIFY `kd_ket_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
