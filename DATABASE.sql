-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2021 at 07:39 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlchdt`
--

-- --------------------------------------------------------

--
-- Table structure for table `dathang`
--

CREATE TABLE `dathang` (
  `iddathang` int(11) NOT NULL,
  `hoten` varchar(250) NOT NULL,
  `sdt` varchar(10) NOT NULL,
  `diachi` varchar(250) NOT NULL,
  `tongtien` int(11) NOT NULL DEFAULT 0,
  `idorder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dathang`
--

INSERT INTO `dathang` (`iddathang`, `hoten`, `sdt`, `diachi`, `tongtien`, `idorder`) VALUES
(7, 'HPN', '1234567890', 'abc', 155940000, 0),
(8, 'HPN', '1234567890', 'abc', 155940000, 0),
(9, 'HPN', '1234567890', 'abc', 155940000, 0),
(10, 'HPN', '1234567890', 'abc', 155940000, 0),
(11, 'nam', '1234567890', 'abc', 155940000, 1),
(12, 'abc', '1234567890', 'abc', 155940000, 1),
(13, '7', '123', '1', 20490000, 4),
(14, '7', '123321', 'non', 39480000, 8),
(15, 'nam', '123', 'ngo', 32990000, 9),
(16, 'a', '125', 'fh', 20490000, 10),
(22, 'Cao Minh Thang', '0376701749', 'Bong Son - Binh Dinh', 20490000, 6),
(23, 'Phong', '0337962206', 'Buon ho- dak lak', 48980000, 20);

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `iddetail` int(11) NOT NULL,
  `idorder` int(11) NOT NULL,
  `priceproduct` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  `totalprice` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`iddetail`, `idorder`, `priceproduct`, `sum`, `totalprice`, `idproduct`) VALUES
(34, 2, 18990000, 1, 18990000, 4),
(35, 1, 32990000, 1, 32990000, 2),
(36, 1, 28490000, 1, 28490000, 3),
(37, 1, 20490000, 1, 20490000, 1),
(38, 1, 20490000, 1, 20490000, 1),
(39, 1, 20490000, 1, 20490000, 1),
(40, 1, 32990000, 1, 32990000, 2),
(41, 1, 18990000, 1, 18990000, 4),
(42, 1, 32990000, 1, 32990000, 2),
(43, 4, 20490000, 1, 20490000, 1),
(44, 4, 20490000, 1, 20490000, 1),
(45, 4, 20490000, 1, 20490000, 1),
(46, 8, 20490000, 1, 20490000, 1),
(47, 8, 18990000, 1, 18990000, 4),
(48, 9, 32990000, 1, 32990000, 2),
(49, 10, 20490000, 1, 20490000, 1),
(51, 11, 32990000, 2, 65980000, 2),
(52, 12, 32990000, 1, 32990000, 2),
(53, 12, 32990000, 1, 32990000, 2),
(54, 13, 28490000, 1, 28490000, 3),
(55, 14, 20490000, 1, 20490000, 1),
(56, 15, 32990000, 1, 32990000, -1),
(57, 15, 28490000, 1, 28490000, 3),
(64, 16, 32990000, 1, 32990000, 1),
(65, 16, 18990000, 1, 18990000, 4),
(66, 16, 20490000, 2, 40980000, 1),
(67, 17, 20490000, 1, 20490000, 1),
(68, 16, 18990000, 1, 18990000, 4),
(69, 18, 28490000, 1, 28490000, 3),
(70, 19, 28490000, 1, 28490000, 3),
(75, 6, 20490000, 1, 20490000, 1),
(76, 20, 20490000, 1, 20490000, 1),
(77, 20, 28490000, 1, 28490000, 3);

--
-- Triggers `details`
--
DELIMITER $$
CREATE TRIGGER `dat_hang` AFTER INSERT ON `details` FOR EACH ROW UPDATE product
    SET sum=sum-NEW.sum
    WHERE product.idproduct=NEW.idproduct
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dat_hang_delete` AFTER DELETE ON `details` FOR EACH ROW UPDATE product
    SET sum=sum+OLD.sum
    WHERE product.idproduct=OLD.idproduct
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dat_hang_update` AFTER UPDATE ON `details` FOR EACH ROW UPDATE product
    SET sum=sum-NEW.sum+OLD.sum
    WHERE product.idproduct=NEW.idproduct
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `stt` varchar(100) NOT NULL,
  `dateorder` varchar(100) NOT NULL,
  `totalprice` int(11) DEFAULT 0,
  `iduser` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `stt`, `dateorder`, `totalprice`, `iduser`) VALUES
(1, '1', '2021-10-26', 100000000, '1'),
(2, '1', '2021-10-26', NULL, '2'),
(3, '1', '2021-10-26', NULL, '3'),
(4, '1', '2021-10-29', 20490000, '1'),
(5, '1', '2021-10-29', 0, '1'),
(6, '1', '2021-10-29', 20490000, '3'),
(7, '0', '2021-10-29', 0, '1'),
(8, '1', '2021-10-30', 39480000, '2'),
(9, '1', '2021-10-30', 32990000, '2'),
(10, '1', '2021-10-30', 20490000, '2'),
(11, '1', '2021-10-30', 65980000, '2'),
(12, '1', '2021-10-30', 32990000, '2'),
(13, '1', '2021-10-30', 28490000, '2'),
(14, '1', '2021-10-30', 20490000, '2'),
(15, '1', '2021-10-30', 28490000, '2'),
(16, '1', '2021-10-30', 111950000, '2'),
(17, '0', '2021-11-01', 0, '4'),
(18, '1', '2021-11-01', 28490000, '2'),
(19, '1', '2021-11-01', 28490000, '2'),
(20, '1', '2021-11-01', 48980000, '2');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idproduct` int(11) NOT NULL,
  `nameproduct` varchar(250) NOT NULL,
  `price` int(11) NOT NULL,
  `manhinh` text NOT NULL,
  `hdh` text NOT NULL,
  `camerasau` text NOT NULL,
  `cameratruoc` text NOT NULL,
  `chip` text NOT NULL,
  `ram` text NOT NULL,
  `bnt` text NOT NULL,
  `sim` text NOT NULL,
  `pinsac` text NOT NULL,
  `sum` int(11) NOT NULL,
  `idtype` int(11) NOT NULL,
  `hinh` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idproduct`, `nameproduct`, `price`, `manhinh`, `hdh`, `camerasau`, `cameratruoc`, `chip`, `ram`, `bnt`, `sim`, `pinsac`, `sum`, `idtype`, `hinh`) VALUES
(1, 'Điện thoại iPhone 12 64GB', 20490000, 'OLED6.1\"Super Retina XDR', 'iOS 14', '2 camera 12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '64 GB', '1 Nano SIM & 1 eSIM Hỗ trợ 5G', '2815 mAh20 W', 18, 1, 'https://i.ibb.co/Z6h0Mgh/iphone-11-pro-max-1.jpg'),
(2, 'iPhone 12 Pro Max 128GB', 32990000, 'OLED6.7\"Super Retina XDR', 'iOS 14', '3 camera 12 MP', '12 MP', 'Apple A14 Bionic', '6 GB', '128 GB', '1 Nano SIM & 1 eSIMHỗ trợ 5G', '3687 mAh20 W', 20, 1, 'https://i.ibb.co/M90fvRY/ip-12-prm.png'),
(3, 'iPhone 12 Pro 128GB', 28490000, 'OLED6.1\"Super Retina XDR', 'iOS 14', '3 camera 12 MP', '12 MP', 'Apple A14 Bionic', '6 GB', '128 GB', '1 Nano SIM & 1 eSIMHỗ trợ 5G', '2815 mAh20 W', 19, 1, 'https://i.ibb.co/2WmsVbH/ip-12-pr.jpg'),
(4, 'iPhone 12 mini 64GB', 18990000, 'OLED5.4\"Super Retina XDR', 'iOS 14', '2 camera 12 MP', '12 MP', 'Apple A14 Bionic', '4 GB', '64 GB', '1 Nano SIM & 1 eSIMHỗ trợ 5G', '2227 mAh20 W', 20, 1, 'https://i.ibb.co/JBMrc4Y/ip-12-mini.png'),
(5, 'iPhone 13 Pro Max 128GB', 36990000, 'OLED6.7\"Super Retina XDR', 'iOS 15', '3 camera 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '128 GB\r\n\r\n', '1 Nano SIM & 1 eSIMHỗ trợ 5G', '3687 mAh20 W', 20, 1, 'https://i.ibb.co/M90fvRY/ip-12-prm.png'),
(6, 'iPhone 13 Pro 128GB', 32490000, 'OLED6.1\"Super Retina XDR', 'iOS 15', '3 camera 12 MP', '12 MP', 'Apple A15 Bionic', '6 GB', '128 GB\r\n', '1 Nano SIM & 1 eSIMHỗ trợ 5G', '2815 mAh20 W', 20, 1, 'https://i.ibb.co/M90fvRY/ip-12-prm.png'),
(7, 'iPhone 13 64GB', 24490000, 'OLED6.1\"Super Retina XDR', 'iOS 15', '2 camera 12 MP', '12 MP', 'Apple A15 Bionic', '4 GB', '64 GB', '1 Nano SIM & 1 eSIMHỗ trợ 5G', '2815 mAh20 W', 20, 1, 'https://i.ibb.co/BsPBV4h/ip-13.jpg'),
(8, 'iPhone 13 mini 64GB', 22990000, 'OLED5.4\"Super Retina XDR', 'iOS 15', '2 camera 12 MP', '12 MP', 'Apple A15 Bionic', '4 GB', '64 GB', '1 Nano SIM & 1 eSIMHỗ trợ 5G', '2227 mAh20 W', 20, 1, 'https://i.ibb.co/BsPBV4h/ip-13.jpg'),
(9, 'iPhone 11 64GB', 16990000, 'IPS LCD6.1\"Liquid Retina', 'iOS 14', '2 camera 12 MP', '12 MP', 'Apple A13 Bionic', '4 GB', '64 GB', '1 Nano SIM & 1 eSIMHỗ trợ 4G', '3110 mAh18 W', 20, 1, 'https://i.ibb.co/xzp4nQ9/ip-11.jpg'),
(10, 'iPhone XR 64GB', 13490000, 'IPS LCD6.1\"Liquid Retina', 'iOS 14', '12 MP', '7 MP', 'Apple A12 Bionic', '3 GB', '64 GB', '1 Nano SIM & 1 eSIMHỗ trợ 4G', '2942 mAh15 W', 20, 1, 'https://i.ibb.co/WHcT6Zq/ip-xr.jpg'),
(11, 'Samsung Galaxy Z Fold3 5G 512GB', 43990000, 'Dynamic AMOLED 2XChính 7.6\" & Phụ 6.2\"Full HD+', 'Android 11', '3 camera 12 MP', '10 MP & 4 MP', 'Snapdragon 888', '12 GB', '512 GB', '2 Nano SIMHỗ trợ 5G', '4400 mAh25 W', 20, 2, 'https://i.ibb.co/qYBbXtG/sam-z-fold3.webp'),
(12, 'Samsung Galaxy A52s 5G', 10190000, 'Super AMOLED6.5\"Full HD+', 'Android 11', 'Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP', '32 MP', 'Snapdragon 778G 5G 8 nhân', '8 GB', '128 GB', '2 Nano SIMHỗ trợ 5G', '4500 mAh25 W', 20, 2, 'https://i.ibb.co/ydbw7qC/sam-a52S.webp'),
(13, 'Samsung Galaxy S20 FE (8GB/256GB)', 12990000, 'Super AMOLED6.5\"Full HD+', 'Android 11', 'Chính 12 MP & Phụ 12 MP, 8 MP', '32 MP', 'Snapdragon 865', '8 GB', '256 GB', '2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 4G', '4500 mAh25 W', 20, 2, 'https://i.ibb.co/7vGNCFX/sam-s20-fe.jpg'),
(14, 'Samsung Galaxy Z Fold2 5G', 44000000, 'Chính: Dynamic AMOLED 2X, Phụ: Super AMOLEDChính 7.59\" & Phụ 6.23\"Full HD+', 'Android 10', '3 camera 12 MP', 'Trong 10 MP & Ngoài 10 MP', 'Snapdragon 865+', '12 GB', '256 GB', '1 Nano SIM & 1 eSIMHỗ trợ 5G', '4500 mAh25 W', 21, 2, 'https://i.ibb.co/qYBbXtG/sam-z-fold3.webp'),
(15, 'Samsung Galaxy Z Fold3 5G 256GB', 40990000, 'Dynamic AMOLED 2XChính 7.6\" & Phụ 6.2\"Full HD+', 'Android 11', '3 camera 12 MP', '10 MP & 4 MP', 'Snapdragon 888', '12 GB', '256 GB', '2 Nano SIMHỗ trợ 5G', '4400 mAh25 W', 20, 2, 'https://i.ibb.co/qYBbXtG/sam-z-fold3.webp'),
(16, 'Samsung Galaxy Z Flip3 5G 256GB', 25990000, 'Dynamic AMOLED 2XChính 6.7\" & Phụ 1.9\"Full HD+', 'Android 11', '2 camera 12 MP', '10 MP', 'Snapdragon 888', '8 GB', '256 GB', '1 Nano SIM & 1 eSIMHỗ trợ 5G', '3300 mAh 15 W', 20, 2, 'https://i.ibb.co/jzqHs7Y/sam-zfip.jpg'),
(17, 'Samsung Galaxy S21 Ultra 5G 128GB', 2990000, 'Dynamic AMOLED 2X6.8\"Quad HD+ (2K+)', 'Android 11', 'Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP', '40 MP', 'Exynos 2100', '12 GB', '128 GB', '2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G', '5000 mAh 25 W', 20, 2, 'https://i.ibb.co/7XVkF8H/sam-s21.png');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `idtype` int(11) NOT NULL,
  `nametype` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`idtype`, `nametype`) VALUES
(1, 'IPhone'),
(2, 'Samsung'),
(3, 'Oppo'),
(4, 'Xiaomi'),
(5, 'Huawei');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `nameuser` varchar(250) NOT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `typeuser` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`iduser`, `nameuser`, `birthday`, `phone`, `email`, `gender`, `password`, `typeuser`) VALUES
(1, 'nam', '3', '12', 'hophuongnam3@gmail.com', 'Nam', 'e10adc3949ba59abbe56e057f20f883e', 0),
(2, 'Admin', '30/10/2012', '123', 'admin', 'nu', 'c3284d0f94606de1fd2af172aba15bf3', 1),
(3, 'Can Thang', '25/06/2000', '0376701749', 'thangminhcaoss@gmail.com', 'Nam', '202cb962ac59075b964b07152d234b70', 1),
(4, '7', '', '', 'ngu@gmail.com', '', '202cb962ac59075b964b07152d234b70', 0),
(5, 'Đậu Sơn Nam', '', '', 'namdau@gmail.com', '', '202cb962ac59075b964b07152d234b70', 0),
(6, 'Phong', '', '', 'phong@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', 0),
(7, 'phong', '', '', 'phong', '', '202cb962ac59075b964b07152d234b70', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dathang`
--
ALTER TABLE `dathang`
  ADD PRIMARY KEY (`iddathang`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`iddetail`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idproduct`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`idtype`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dathang`
--
ALTER TABLE `dathang`
  MODIFY `iddathang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idproduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `idtype` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
