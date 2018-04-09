-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2018 at 10:13 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_etest`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_menumap`
--

CREATE TABLE `tb_menumap` (
  `menuid` int(2) NOT NULL,
  `menu_desc` varchar(50) DEFAULT NULL COMMENT 'Diisi dengan menunya apa, misalkan home,tentang atau deskripsi lainnya.',
  `menu_parent` varchar(2) DEFAULT NULL COMMENT 'Diisi dengan menuid, jika merupakan submenu, jika merupakan menu utama diisi dengan 0',
  `group_user` varchar(2) DEFAULT NULL COMMENT 'Grup user yang dapat mengakses menu sesuai dengan role, jika menu parent sudah terbuka, maka submenu tidak usah diisi secara default harus mengikuti role dari menu parent.',
  `is_active` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_param`
--

CREATE TABLE `tb_param` (
  `prm_nm` varchar(25) DEFAULT NULL,
  `prm_val` varchar(25) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_param`
--

INSERT INTO `tb_param` (`prm_nm`, `prm_val`, `is_active`) VALUES
('MAX_TEST_TIME', '10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_possibleanswer`
--

CREATE TABLE `tb_possibleanswer` (
  `answerid` int(11) NOT NULL,
  `qid` int(11) NOT NULL COMMENT 'Kolom ini untuk menyimpan id pertanyaan dan jawaban yang memungkinkan',
  `pans` text COMMENT 'Menyimpan jawaban yang memungkinkan',
  `ppoint` int(11) DEFAULT NULL COMMENT 'Jika pertanyaanya butuh point tertentu, jadi jika belum tepat di jawab bisa menggunakan point',
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_possibleanswer`
--

INSERT INTO `tb_possibleanswer` (`answerid`, `qid`, `pans`, `ppoint`, `is_active`) VALUES
(1, 1, 'orang', 5, 1),
(2, 2, 'biru', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_qbanks`
--

CREATE TABLE `tb_qbanks` (
  `qid` int(11) NOT NULL,
  `qdesc` text COMMENT 'Kolom ini untuk pertanyaannya apa aja',
  `qanswer` text COMMENT 'Kolom ini memuat jawaban yang akan ditampilkan aplikasi, jika pilihan ganda, pertanyaannya dipisahkan tanda titik koma.',
  `qtypeid` int(11) NOT NULL COMMENT 'Kolom ini harus diisi sesuai dengan tipe pertanyaannya yang ada di tabel tb_qtype',
  `qlevelid` int(11) NOT NULL COMMENT 'Kolom ini diisi dengan level untuk pertanyaan ini',
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_qbanks`
--

INSERT INTO `tb_qbanks` (`qid`, `qdesc`, `qanswer`, `qtypeid`, `qlevelid`, `is_active`) VALUES
(1, 'Siapakah Saya?', 'orang#hewan#meja#pemulung', 1, 0, 1),
(2, 'Warna Kesukaan Saya Apa?', 'biru#merah#kuning#hijau', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_qlevel`
--

CREATE TABLE `tb_qlevel` (
  `levelid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_qtype`
--

CREATE TABLE `tb_qtype` (
  `qtypeid` int(11) DEFAULT NULL,
  `qtype_desc` varchar(25) DEFAULT NULL COMMENT 'Tipe pertanyaan pilihan ganda, isian, dan benar/salah',
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_qtype`
--

INSERT INTO `tb_qtype` (`qtypeid`, `qtype_desc`, `is_active`) VALUES
(1, 'Multiple Question', 1),
(2, 'TrueFalse Question', 1),
(3, 'Essay Question', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_student`
--

CREATE TABLE `tb_student` (
  `studentid` int(11) NOT NULL,
  `student_name` varchar(250) DEFAULT NULL,
  `studentuser` varchar(50) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_student`
--

INSERT INTO `tb_student` (`studentid`, `student_name`, `studentuser`, `is_active`) VALUES
(0, 'Student 1', 'tes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentres`
--

CREATE TABLE `tb_studentres` (
  `ansid` int(11) NOT NULL,
  `studentid` int(11) DEFAULT NULL,
  `qid` int(11) NOT NULL,
  `ans` text,
  `cdate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_studentres`
--

INSERT INTO `tb_studentres` (`ansid`, `studentid`, `qid`, `ans`, `cdate`) VALUES
(1, 1, 1, 'orang', '2017-04-24 00:02:27'),
(2, 1, 2, 'biru', '2017-04-24 00:02:27'),
(3, 1, 2, 'kuning', '2017-04-24 00:02:27'),
(4, 1, 1, 'hewan', '2017-04-24 00:02:27');

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentressum`
--

CREATE TABLE `tb_studentressum` (
  `studentid` int(11) DEFAULT NULL,
  `total_point` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_usergrup`
--

CREATE TABLE `tb_usergrup` (
  `groupid` int(11) NOT NULL,
  `group_desc` varchar(25) NOT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_userlogin`
--

CREATE TABLE `tb_userlogin` (
  `userid` varchar(35) NOT NULL,
  `passwd` varchar(250) DEFAULT NULL,
  `last_level` varchar(3) DEFAULT NULL COMMENT 'Level terakhir yang dimiliki pengguna',
  `user_group` varchar(2) DEFAULT NULL COMMENT 'Grup user untuk membagi hak akses tiap user',
  `user_type` int(11) NOT NULL,
  `is_active` varchar(1) DEFAULT '0' COMMENT 'User aktif di dalam aplikasi atau tidak, 0=tidak aktif; 1=aktif',
  `tgl_join` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_userlogin`
--

INSERT INTO `tb_userlogin` (`userid`, `passwd`, `last_level`, `user_group`, `user_type`, `is_active`, `tgl_join`) VALUES
('tes', '12345', '0', '0', 1, '0', '2017-02-19 12:25:48');

-- --------------------------------------------------------

--
-- Table structure for table `tb_usertype`
--

CREATE TABLE `tb_usertype` (
  `typeid` int(11) NOT NULL,
  `type_desc` varchar(25) NOT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_usertype`
--

INSERT INTO `tb_usertype` (`typeid`, `type_desc`, `is_active`) VALUES
(1, 'Student', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_menumap`
--
ALTER TABLE `tb_menumap`
  ADD PRIMARY KEY (`menuid`);

--
-- Indexes for table `tb_possibleanswer`
--
ALTER TABLE `tb_possibleanswer`
  ADD PRIMARY KEY (`answerid`);

--
-- Indexes for table `tb_qbanks`
--
ALTER TABLE `tb_qbanks`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `tb_qlevel`
--
ALTER TABLE `tb_qlevel`
  ADD PRIMARY KEY (`levelid`);

--
-- Indexes for table `tb_student`
--
ALTER TABLE `tb_student`
  ADD PRIMARY KEY (`studentid`);

--
-- Indexes for table `tb_studentres`
--
ALTER TABLE `tb_studentres`
  ADD PRIMARY KEY (`ansid`);

--
-- Indexes for table `tb_usergrup`
--
ALTER TABLE `tb_usergrup`
  ADD PRIMARY KEY (`groupid`);

--
-- Indexes for table `tb_userlogin`
--
ALTER TABLE `tb_userlogin`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `tb_usertype`
--
ALTER TABLE `tb_usertype`
  ADD PRIMARY KEY (`typeid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_possibleanswer`
--
ALTER TABLE `tb_possibleanswer`
  MODIFY `answerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_qbanks`
--
ALTER TABLE `tb_qbanks`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_student`
--
ALTER TABLE `tb_student`
  MODIFY `studentid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_studentres`
--
ALTER TABLE `tb_studentres`
  MODIFY `ansid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_usergrup`
--
ALTER TABLE `tb_usergrup`
  MODIFY `groupid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_usertype`
--
ALTER TABLE `tb_usertype`
  MODIFY `typeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
