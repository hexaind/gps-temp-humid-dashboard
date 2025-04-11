-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 10, 2025 at 07:17 PM
-- Server version: 8.0.36-28
-- PHP Version: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project01-hexacube`
--

-- --------------------------------------------------------

--
-- Table structure for table `sensor_data`
--

CREATE TABLE `sensor_data` (
  `id` int NOT NULL,
  `temperature` float DEFAULT NULL,
  `humidity` float DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `altitude` float DEFAULT NULL,
  `speed` float DEFAULT NULL,
  `heading` float DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `city` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sensor_data`
--

INSERT INTO `sensor_data` (`id`, `temperature`, `humidity`, `latitude`, `longitude`, `altitude`, `speed`, `heading`, `timestamp`, `city`, `region`, `country`) VALUES
(1232, 28.4, 41.4, 13.62451, 78.482613, 691.5, 0.07, 340.09, '2025-04-10 15:37:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1233, 27.5, 44, 13.624505, 78.482613, 691, 0, 116.69, '2025-04-10 15:38:33', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1234, 27.7, 44.2, 13.624509, 78.482613, 690.8, 0.17, 116.69, '2025-04-10 15:39:33', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1235, 27.6, 44.4, 13.624509, 78.482613, 694.6, 0.15, 116.69, '2025-04-10 15:40:33', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1236, 27.7, 44.6, 13.624508, 78.482613, 692.9, 0.02, 116.69, '2025-04-10 15:41:33', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1237, 27.7, 44.6, 13.624504, 78.482613, 692.8, 0.04, 116.69, '2025-04-10 15:42:33', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1238, 27.9, 44.4, 13.624503, 78.482605, 693.4, 0, 116.69, '2025-04-10 15:43:33', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1239, 27.9, 44.1, 13.624505, 78.482597, 692.9, 0.04, 116.69, '2025-04-10 15:44:33', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1240, 28, 44, 13.624506, 78.482597, 691.1, 0.02, 116.69, '2025-04-10 15:45:33', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1241, 28, 43.9, 13.624512, 78.482613, 690.5, 0.26, 116.69, '2025-04-10 15:46:33', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1242, 28.2, 43.7, 13.624512, 78.482613, 692.4, 0.17, 116.69, '2025-04-10 15:47:33', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1243, 26.6, 48, 13.624905, 78.485954, 662.8, 21.43, 4.74, '2025-04-10 15:56:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1244, 27.8, 46.5, 13.628091, 78.485847, 676.8, 19.33, 358.01, '2025-04-10 15:57:09', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1245, 27.8, 44.7, 13.629967, 78.48542, 685.7, 0.19, 96.2, '2025-04-10 15:59:16', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1246, 28.3, 44.7, 13.629926, 78.485374, 696.8, 0.09, 96.2, '2025-04-10 15:59:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1247, 28.8, 44.4, 13.62993, 78.485435, 695.9, 0.04, 96.2, '2025-04-10 16:00:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1248, 28.7, 44.4, 13.629889, 78.485382, 712.5, 0.09, 96.2, '2025-04-10 16:01:51', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1249, 28.8, 44.5, 13.629907, 78.485367, 714.5, 0.07, 96.2, '2025-04-10 16:02:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1250, 28.5, 44.3, 13.627635, 78.48587, 698, 19.83, 174.1, '2025-04-10 16:03:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1251, 29, 44.3, 13.627393, 78.485794, 696.1, 0.52, 161.09, '2025-04-10 16:04:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1252, 28.6, 44.6, 13.6254, 78.486, 689.6, 22.85, 183.99, '2025-04-10 16:05:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1253, 28.1, 45.1, 13.623966, 78.48555, 678.2, 0.07, 280.53, '2025-04-10 16:06:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1254, 27.6, 45.5, 13.623971, 78.485542, 674.9, 0.07, 280.53, '2025-04-10 16:07:51', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1255, 27.9, 46.5, 13.62397, 78.48555, 674.5, 0.09, 280.53, '2025-04-10 16:08:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1256, 28.3, 46.1, 13.62397, 78.485558, 676.7, 0.3, 280.53, '2025-04-10 16:09:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1257, 28.2, 46.4, 13.62398, 78.48555, 677, 0.09, 280.53, '2025-04-10 16:10:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1258, 28, 46.5, 13.623981, 78.48555, 676, 0.24, 280.53, '2025-04-10 16:11:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1259, 28, 46.7, 13.623972, 78.48555, 675.4, 0.04, 268.03, '2025-04-10 16:12:50', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1260, 27.9, 47, 13.624251, 78.48304, 681.8, 28.52, 276.52, '2025-04-10 16:13:51', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1261, 27.7, 48.5, 13.624544, 78.482597, 694.4, 1.22, 114.8, '2025-04-10 16:16:11', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1262, 28, 49.2, 13.624536, 78.482597, 696.2, 0, 135.82, '2025-04-10 16:16:45', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1263, 27.5, 50.2, 13.624529, 78.48259, 698.6, 0.02, 135.82, '2025-04-10 16:17:45', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1264, 27.7, 51, 13.624518, 78.48259, 697.6, 0.02, 135.82, '2025-04-10 16:18:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1265, 27.3, 51.5, 13.624512, 78.482605, 696.1, 0, 135.82, '2025-04-10 16:19:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1266, 27.3, 51.9, 13.624516, 78.482613, 694.2, 0, 135.82, '2025-04-10 16:20:45', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1267, 27.3, 52.1, 13.624517, 78.482597, 695, 0.06, 135.82, '2025-04-10 16:21:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1268, 27.3, 52.3, 13.624529, 78.482597, 695.4, 0.02, 135.82, '2025-04-10 16:22:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1269, 27.4, 52.7, 13.624533, 78.482605, 695.7, 0.09, 135.82, '2025-04-10 16:23:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1270, 27, 53, 13.624531, 78.482597, 698.1, 0, 135.82, '2025-04-10 16:24:45', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1271, 27.4, 53, 13.624529, 78.482613, 697.5, 0.04, 135.82, '2025-04-10 16:25:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1272, 27.4, 53.1, 13.624531, 78.482605, 698, 0.04, 135.82, '2025-04-10 16:26:43', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1273, 27.2, 53.2, 13.62453, 78.48259, 698.1, 0.02, 135.82, '2025-04-10 16:27:45', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1274, 27.4, 53.2, 13.624528, 78.482597, 698.9, 0.04, 135.82, '2025-04-10 16:28:43', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1275, 27.3, 53.4, 13.624525, 78.482605, 698.6, 0, 135.82, '2025-04-10 16:29:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1276, 27.2, 53.5, 13.624527, 78.482605, 699.5, 0.02, 135.82, '2025-04-10 16:30:43', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1277, 27.4, 53.5, 13.624525, 78.482605, 700.2, 0.09, 135.82, '2025-04-10 16:31:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1278, 27, 53.8, 13.624528, 78.482597, 698.6, 0.02, 135.82, '2025-04-10 16:32:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1279, 27.2, 53.9, 13.624523, 78.48259, 698.9, 0.02, 135.82, '2025-04-10 16:33:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1280, 27, 54, 13.624522, 78.482597, 697.9, 0.04, 135.82, '2025-04-10 16:34:46', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1281, 27, 54.1, 13.624523, 78.482605, 697.7, 0.02, 135.82, '2025-04-10 16:35:44', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1282, 26.7, 53.3, 13.624537, 78.482597, 698.6, 0.02, 94.56, '2025-04-10 16:38:04', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1283, 27.1, 54.3, 13.624543, 78.48259, 698.4, 0.04, 94.56, '2025-04-10 16:38:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1284, 27.2, 54.1, 13.624543, 78.48259, 698.7, 0.04, 94.56, '2025-04-10 16:39:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1285, 27.2, 54.1, 13.624543, 78.482597, 698.5, 0.02, 94.56, '2025-04-10 16:40:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1286, 27.1, 54.3, 13.624543, 78.482597, 698.2, 0, 94.56, '2025-04-10 16:41:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1287, 27.1, 54.3, 13.624537, 78.482597, 699.4, 0.06, 94.56, '2025-04-10 16:42:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1288, 27.1, 54.3, 13.624539, 78.48259, 700.3, 0.04, 94.56, '2025-04-10 16:43:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1289, 27.1, 54.3, 13.624538, 78.482597, 700.3, 0.04, 94.56, '2025-04-10 16:44:37', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1290, 27.1, 54.3, 13.624543, 78.482597, 700.2, 0, 94.56, '2025-04-10 16:45:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1291, 27.1, 54.5, 13.624538, 78.48259, 700.6, 0.04, 94.56, '2025-04-10 16:46:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1292, 27.1, 54.5, 13.624544, 78.482597, 701.7, 0.02, 94.56, '2025-04-10 16:47:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1293, 27.1, 54.5, 13.62455, 78.482605, 699.9, 0.07, 94.56, '2025-04-10 16:48:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1296, 27, 55, 13.624542, 78.482605, 699.1, 0.02, 94.56, '2025-04-10 16:58:46', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1297, 26.8, 55.3, 13.624549, 78.482613, 702.2, 0.11, 94.56, '2025-04-10 16:59:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1298, 27, 55, 13.624542, 78.482605, 699.1, 0.02, 94.56, '2025-04-10 17:03:04', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1299, 51, 55, 13.624542, 78.482605, 699.1, 0.02, 94.56, '2025-04-10 17:03:22', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1300, 26.8, 55.6, 13.624548, 78.482613, 700, 0.04, 94.56, '2025-04-10 17:03:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1301, 26.8, 55.6, 13.624541, 78.48259, 699, 0.06, 94.56, '2025-04-10 17:04:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1302, 50.1, 55, 13.624542, 78.482605, 699.1, 0.02, 94.56, '2025-04-10 17:05:25', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1303, 26.7, 55.8, 13.624546, 78.48259, 700.2, 0.02, 119.4, '2025-04-10 17:05:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1304, 26.8, 55.6, 13.624558, 78.482574, 698.6, 0.93, 119.4, '2025-04-10 17:06:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1305, 75, 55, 13.624542, 78.482605, 699.1, 0.02, 94.56, '2025-04-10 17:07:13', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1306, 26.8, 55.5, 13.624557, 78.482582, 699.4, 0.3, 25, '2025-04-10 17:07:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1307, 26.9, 55.4, 13.624547, 78.482613, 704.1, 0.07, 25, '2025-04-10 17:08:37', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1308, 26.9, 55.4, 13.624558, 78.482613, 700.4, 0.11, 25, '2025-04-10 17:09:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1309, 26.8, 55.4, 13.624555, 78.482613, 701.1, 0.09, 25, '2025-04-10 17:10:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1310, 26.8, 55.5, 13.624557, 78.48262, 701.4, 0.02, 25, '2025-04-10 17:11:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1311, 26.9, 55.4, 13.624552, 78.482613, 700.2, 0.13, 25, '2025-04-10 17:12:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1312, 26.8, 55.4, 13.624551, 78.482613, 700.8, 0.02, 25, '2025-04-10 17:13:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1313, 26.8, 55.5, 13.624566, 78.482597, 700.3, 0.13, 25, '2025-04-10 17:14:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1314, 26.8, 55.4, 13.624566, 78.48259, 700.3, 0.07, 25, '2025-04-10 17:15:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1315, 26.9, 55.5, 13.624565, 78.482582, 699.8, 0.02, 25, '2025-04-10 17:16:36', 'Kurabalakota', 'Andhra Pradesh', 'India'),
(1316, 26.9, 55.4, 13.62456, 78.482582, 701.2, 0.02, 25, '2025-04-10 17:17:36', 'Kurabalakota', 'Andhra Pradesh', 'India');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1317;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
