-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 17, 2024 lúc 08:28 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `telesale`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('admin','user','merchant') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `fullname`, `created_at`, `role`) VALUES
(1, 'anhnt4@matbao.com', '123456', 'Nguyễn Tuấn Anh', '2024-08-14 17:41:07', 'user'),
(2, 'admin', 'NgxTA99@', 'admin', '2024-08-14 19:00:15', 'admin'),
(10, 'nthanhcong375@gmail.com', '123456', 'Nguyễn Thành Công', '2024-09-22 13:30:46', 'user'),
(11, 'annhien@ggads.pro', '123456', 'Công Ty An Nhiên', '2024-09-25 03:25:28', 'merchant'),
(12, 'hadinhhoang031104@gmail.com', '123456', 'Hà Đình Hoàng', '2024-10-07 09:10:01', 'user'),
(13, 'doanthuan912.cv@gmail.com', '123456', 'Doãn Đức Thuận', '2024-10-14 08:38:04', 'user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact_statuses`
--

CREATE TABLE `contact_statuses` (
  `id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `contact_statuses`
--

INSERT INTO `contact_statuses` (`id`, `status_name`) VALUES
(1, 'Đã gọi và gửi mail'),
(2, 'Không nghe máy'),
(3, 'Thuê bao/Nhầm số'),
(4, 'Không nhu cầu'),
(5, 'Đang cân nhắc suy nghĩ'),
(6, 'Đang tư vấn'),
(7, 'KH tiềm năng'),
(8, 'Đã hẹn gặp'),
(9, 'Đã demo'),
(10, 'Báo giá'),
(11, 'Chờ ký HĐ'),
(12, 'Đã ký HĐTC'),
(13, 'KH Đã có web'),
(14, 'Sai số'),
(15, 'Gọi lại sau');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(6) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_source` varchar(255) DEFAULT NULL,
  `contact_status` varchar(255) DEFAULT NULL,
  `customer_evaluation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `phone_number`, `created_by`, `created_at`, `data_source`, `contact_status`, `customer_evaluation`) VALUES
(1, 'Bich Lan', '0977646948', 'Nguyễn Tuấn Anh', '2024-08-14 08:54:14', 'Tự tìm kiếm', 'Đã demo', 'Khách hàng cơ hội'),
(2, 'Hoàng Lâm', '0985086959', 'Nguyễn Tuấn Anh', '2024-08-14 08:56:33', 'Tự tìm kiếm', 'Đã ký HĐTC', 'Khách hàng chăm sóc sau bán'),
(3, 'Anh Suốt', '0383592661', 'Nguyễn Tuấn Anh', '2024-08-14 08:56:53', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(4, 'Trần Quốc Đạt', '0816129698', 'Nguyễn Tuấn Anh', '2024-08-14 08:57:11', 'Tự tìm kiếm', 'Báo giá', 'Khách hàng cơ hội'),
(5, 'Chị Hiền', '0982405593', 'Nguyễn Tuấn Anh', '2024-08-14 08:57:29', 'Tự tìm kiếm', 'Đã demo', 'Khách hàng cơ hội'),
(6, 'Anh Tú', '0988183169', 'Nguyễn Tuấn Anh', '2024-08-14 08:57:48', 'Tự tìm kiếm', 'Chờ ký HĐ', 'Khách hàng cơ hội'),
(7, 'Anh Thịnh', '0919523509', 'Nguyễn Tuấn Anh', '2024-08-14 08:58:08', 'Tự tìm kiếm', 'Đã demo', 'Khách hàng cơ hội'),
(8, 'kiên', '0327213219', 'Nguyễn Trung Kiên', '2024-08-14 08:59:19', NULL, NULL, NULL),
(9, 'Noname', '0396698246', 'Vũ Thị Thu', '2024-08-14 09:22:29', NULL, NULL, NULL),
(10, 'Thoa', '0913600832', 'Vũ Thị Thu', '2024-08-14 09:22:56', NULL, NULL, NULL),
(11, 'Trọng Hiếu', '0987748771', 'Vũ Thị Thu', '2024-08-14 09:23:45', NULL, NULL, NULL),
(12, 'Nguyễn Hoàng Thùy Trang', '0355119462', 'Nguyễn Tuấn Anh', '2024-08-14 09:24:15', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(13, 'Hoàng Lượng', '0985866939', 'Vũ Thị Thu', '2024-08-14 09:24:43', NULL, NULL, NULL),
(14, 'Nguyên Limosine', '0938689140', 'Vũ Thị Thu', '2024-08-14 09:40:23', NULL, NULL, NULL),
(15, 'Minh Tuấn', '0333684101', 'Vũ Thị Thu', '2024-08-14 09:42:16', NULL, NULL, NULL),
(16, 'Thiện Thanh', '0906056905', 'Vũ Thị Thu', '2024-08-14 09:45:08', NULL, NULL, NULL),
(17, 'Lan Anh', '0967509203', 'Vũ Thị Thu', '2024-08-14 09:48:48', NULL, NULL, NULL),
(18, 'Thoa', '0866014180', 'Nguyễn Tuấn Anh', '2024-08-14 09:54:22', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(19, 'Hiền Nana', '0336606662', 'Vũ Thị Thu', '2024-08-14 09:55:09', NULL, NULL, NULL),
(20, 'Trung', '0909099251', 'Vũ Thị Thu', '2024-08-14 10:04:34', NULL, NULL, NULL),
(21, 'Xe Nâng Tân Phát', '0876727107', 'Nguyễn Tuấn Anh', '2024-08-14 17:12:38', NULL, NULL, NULL),
(22, 'Thẩm Mỹ Hoang Linh', '0911118556', 'Nguyễn Tuấn Anh', '2024-08-14 17:12:53', NULL, NULL, NULL),
(23, 'Ngo Thanh Nam', '0974281624', 'Nguyễn Tuấn Anh', '2024-08-14 17:13:08', NULL, NULL, NULL),
(24, 'Bùi Công Phương', '0926898767', 'Nguyễn Tuấn Anh', '2024-08-14 17:13:21', NULL, NULL, NULL),
(25, 'Vinh', '0967858450', 'Nguyễn Tuấn Anh', '2024-08-14 17:13:38', NULL, NULL, NULL),
(26, 'Nam Anh', '0966242160', 'Nguyễn Tuấn Anh', '2024-08-14 17:14:12', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(27, 'Chị Thảo', '0967529591', 'Nguyễn Tuấn Anh', '2024-08-14 17:14:47', 'Tự tìm kiếm', 'Chờ ký HĐ', 'Khách hàng cơ hội'),
(31, 'Nguyen Quang Trung', '0973587888', 'Nguyễn Tuấn Anh', '2024-08-14 17:18:15', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng cơ hội'),
(32, 'Luu Quoc Bao', '0908731003', 'Nguyễn Tuấn Anh', '2024-08-14 17:18:29', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(35, 'Nguyễn Xuân Cảnh', '0979865799', 'Nguyễn Tuấn Anh', '2024-08-14 17:22:17', 'Ucall (Lead)', 'Đã ký HĐTC', 'Khách hàng chăm sóc sau bán'),
(38, 'Nguyễn Trần Duy', '0862962276', 'Nguyễn Tuấn Anh', '2024-08-14 18:05:38', NULL, NULL, NULL),
(40, 'Nguyễn Thuý Hằng', '0904379833 ', 'Nguyễn Tuấn Anh', '2024-08-14 18:08:18', NULL, NULL, NULL),
(43, 'Lê Hồng Anh', '0329830259', 'Lê Hồng Anh', '2024-08-15 01:54:20', NULL, NULL, NULL),
(44, 'Chị Ly', '0948931439', 'Lê Hồng Anh', '2024-08-15 02:10:25', NULL, NULL, NULL),
(45, 'Anh Hùng', '0353294746', 'Lê Hồng Anh', '2024-08-15 02:12:23', NULL, NULL, NULL),
(46, 'Chị Hương Thanh', '0959121835', 'Lê Hồng Anh', '2024-08-15 03:13:02', NULL, NULL, NULL),
(47, 'Phạm thành', '0995642741', 'Lê Hồng Anh', '2024-08-15 03:37:39', NULL, NULL, NULL),
(48, 'Trà Giang', '0974470796', 'Vũ Thị Thu', '2024-08-15 03:39:24', NULL, NULL, NULL),
(49, 'Anh Hoàng', '0967414622', 'Lê Hồng Anh', '2024-08-15 03:41:06', NULL, NULL, NULL),
(50, 'Linh Chi', '0963431299', 'Lê Hồng Anh', '2024-08-15 03:42:24', NULL, NULL, NULL),
(51, 'phượng', '0964798777', 'Nguyễn Trung Kiên', '2024-08-15 07:03:59', NULL, NULL, NULL),
(52, 'a phượng', '0888999169', 'Nguyễn Trung Kiên', '2024-08-15 07:06:11', NULL, NULL, NULL),
(53, 'ngọc', '0978.271.724', 'Nguyễn Trung Kiên', '2024-08-15 07:08:05', NULL, NULL, NULL),
(54, 'Lan Anh', '0346620088', 'Lê Hồng Anh', '2024-08-15 07:08:14', NULL, NULL, NULL),
(55, 'Thanh Thiên', '0354991812', 'Lê Hồng Anh', '2024-08-15 07:08:54', NULL, NULL, NULL),
(56, 'phúc', '0334517344', 'Nguyễn Trung Kiên', '2024-08-15 07:10:39', NULL, NULL, NULL),
(57, 'hoàng', '0902410181', 'Nguyễn Trung Kiên', '2024-08-15 07:10:55', NULL, NULL, NULL),
(58, 'Trần Quân', '0909965038', 'Lê Hồng Anh', '2024-08-16 02:27:24', NULL, NULL, NULL),
(59, 'Lê Thắng', '0975257980', 'Vũ Thị Thu', '2024-08-16 03:12:50', NULL, NULL, NULL),
(60, 'Andy phạm', '0937638222', 'Lê Hồng Anh', '2024-08-16 03:45:33', NULL, NULL, NULL),
(61, 'Đặng Ngọc', '0978271724', 'Vũ Thị Thu', '2024-08-16 04:21:47', NULL, NULL, NULL),
(62, 'Phạm Anh', '0986595204', 'Vũ Thị Thu', '2024-08-16 04:22:14', NULL, NULL, NULL),
(63, 'Hồ Hạ', '0934397925', 'Vũ Thị Thu', '2024-08-16 04:56:37', NULL, NULL, NULL),
(64, 'Thành Vinh', '0933494029', 'Vũ Thị Thu', '2024-08-16 04:58:09', NULL, NULL, NULL),
(65, 'Yoga Linh Đàm', '0981136679', 'Vũ Thị Thu', '2024-08-16 05:05:26', NULL, NULL, NULL),
(66, 'Mua nhà xinh', '0978352522', 'Vũ Thị Thu', '2024-08-16 05:27:22', NULL, NULL, NULL),
(67, 'Long Minh', '0339759353', 'Vũ Thị Thu', '2024-08-16 05:27:42', NULL, NULL, NULL),
(68, 'Nguyễn Hoàng Nhật', '0399550674', 'Vũ Thị Thu', '2024-08-16 05:28:13', NULL, NULL, NULL),
(69, 'Mái Xếp Việt', '0967402850', 'Vũ Thị Thu', '2024-08-16 05:28:57', NULL, NULL, NULL),
(70, 'Tôn Hoàng Lâm', '0916026548', 'Vũ Thị Thu', '2024-08-16 05:29:29', NULL, NULL, NULL),
(71, 'Nhật Lan', '0918464127', 'Vũ Thị Thu', '2024-08-16 05:33:22', NULL, NULL, NULL),
(72, 'Lại Văn Tín', '0949579078', 'Vũ Thị Thu', '2024-08-16 05:37:42', NULL, NULL, NULL),
(73, 'Teonguyen', '0908357310', 'Vũ Thị Thu', '2024-08-16 05:38:25', NULL, NULL, NULL),
(74, 'Nhất Linh', '0965764750', 'Vũ Thị Thu', '2024-08-16 05:41:09', NULL, NULL, NULL),
(75, 'Văn Khanh', '0375445916', 'Vũ Thị Thu', '2024-08-16 05:41:45', NULL, NULL, NULL),
(76, 'Phương real Smatphone', '0904932668', 'Vũ Thị Thu', '2024-08-16 05:42:42', NULL, NULL, NULL),
(77, 'Liên Bùi', '0988999353', 'Vũ Thị Thu', '2024-08-16 05:43:49', NULL, NULL, NULL),
(78, 'Beo', '0944785971', 'Vũ Thị Thu', '2024-08-16 06:36:44', NULL, NULL, NULL),
(79, 'Kelvin Trần', '0903663811', 'Vũ Thị Thu', '2024-08-16 06:39:17', NULL, NULL, NULL),
(80, 'Ba Kiệt', '0944478111', 'Vũ Thị Thu', '2024-08-16 06:40:14', NULL, NULL, NULL),
(81, 'TRangvirut', '0987576467', 'Vũ Thị Thu', '2024-08-16 06:47:35', NULL, NULL, NULL),
(82, 'thành', '0966613989', 'Nguyễn Trung Kiên', '2024-08-16 06:51:00', NULL, NULL, NULL),
(83, 'bảo', '0975082565', 'Nguyễn Trung Kiên', '2024-08-16 06:51:12', NULL, NULL, NULL),
(84, 'đoàn', '0977319963', 'Nguyễn Trung Kiên', '2024-08-16 06:51:22', NULL, NULL, NULL),
(85, 'trang', '0903439976', 'Nguyễn Trung Kiên', '2024-08-16 06:51:33', NULL, NULL, NULL),
(86, 'Quyên', '0349226254', 'Vũ Thị Thu', '2024-08-16 06:53:03', NULL, NULL, NULL),
(87, 'La Trúc', '937835052', 'Vũ Thị Thu', '2024-08-16 07:00:31', NULL, NULL, NULL),
(88, 'Lương Sơn', '0901882111', 'Vũ Thị Thu', '2024-08-16 07:02:16', NULL, NULL, NULL),
(89, 'Nguyễn Hữu Nhân', '0935887595', 'Vũ Thị Thu', '2024-08-16 07:08:45', NULL, NULL, NULL),
(90, 'Tai Duc Phu Nguyen', '937771775', 'Vũ Thị Thu', '2024-08-16 07:22:24', NULL, NULL, NULL),
(91, 'Anh Tuấn', '0346303065', 'Vũ Thị Thu', '2024-08-16 07:32:13', NULL, NULL, NULL),
(93, 'Lương Minh Hậu', '0902466445', 'Nguyễn Tuấn Anh', '2024-08-16 07:34:12', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(94, 'Quang Hiếu', '0934233590', 'Vũ Thị Thu', '2024-08-16 07:34:33', NULL, NULL, NULL),
(95, 'Ngọc Hiền', '0336297904', 'Vũ Thị Thu', '2024-08-16 07:39:47', NULL, NULL, NULL),
(96, 'Đức Huyndai', '0834876667', 'Vũ Thị Thu', '2024-08-16 07:43:49', NULL, NULL, NULL),
(97, 'Nguyễn Sang', '0901991081', 'Vũ Thị Thu', '2024-08-16 07:50:05', NULL, NULL, NULL),
(99, 'Đại Dương', '0901656888', 'Nguyễn Tuấn Anh', '2024-08-16 08:20:26', NULL, NULL, NULL),
(105, 'Nguyễn Xuân Lâm', '0935555698', 'Nguyễn Tuấn Anh', '2024-08-16 08:32:35', NULL, NULL, NULL),
(106, 'Đức Taxi', '0365772286', 'Nguyễn Tuấn Anh', '2024-08-16 08:44:05', NULL, NULL, NULL),
(109, 'Thế Luân', '0937633223', 'Lê Hồng Anh', '2024-08-16 09:06:52', NULL, NULL, NULL),
(110, 'Danh vo', '0914608817', 'Lê Hồng Anh', '2024-08-16 09:15:37', NULL, NULL, NULL),
(111, 'iceygray nguyen', '0977307703', 'Lê Hồng Anh', '2024-08-16 09:17:21', NULL, NULL, NULL),
(112, 'Kinbonito', '0963080433', 'Lê Hồng Anh', '2024-08-16 09:18:47', NULL, NULL, NULL),
(113, 'huân', '0931535979', 'Nguyễn Trung Kiên', '2024-08-16 09:20:12', NULL, NULL, NULL),
(114, 'Chị Đào', '0365905705', 'Lê Hồng Anh', '2024-08-16 09:20:17', NULL, NULL, NULL),
(115, 'sang', '0978209174', 'Nguyễn Trung Kiên', '2024-08-16 09:20:32', NULL, NULL, NULL),
(116, 'mơ', '0376333390', 'Nguyễn Trung Kiên', '2024-08-16 09:20:48', NULL, NULL, NULL),
(117, 'Phúc Nguyễn', '0937822010', 'Lê Hồng Anh', '2024-08-16 09:21:18', NULL, NULL, NULL),
(118, 'nam', '0968451456', 'Nguyễn Trung Kiên', '2024-08-16 09:21:21', NULL, NULL, NULL),
(119, 'nhài', '0977382681', 'Nguyễn Trung Kiên', '2024-08-16 09:21:39', NULL, NULL, NULL),
(120, 'Quang Minh', '0972999677', 'Lê Hồng Anh', '2024-08-16 09:24:59', NULL, NULL, NULL),
(121, 'quyết', '0907489756', 'Nguyễn Trung Kiên', '2024-08-16 09:26:07', NULL, NULL, NULL),
(122, 'thu minh', '0703290681', 'Lê Hồng Anh', '2024-08-16 09:26:38', NULL, NULL, NULL),
(123, 'Nguyễn Thị Như Quỳnh', '0386322370', 'Lê Hồng Anh', '2024-08-16 09:27:34', NULL, NULL, NULL),
(124, 'Phương Nhi', '0963463799', 'Lê Hồng Anh', '2024-08-16 09:29:16', NULL, NULL, NULL),
(125, 'Mắt Hí', '0983491538', 'Lê Hồng Anh', '2024-08-16 09:30:21', NULL, NULL, NULL),
(126, 'Nguyễn Hoàng Dũng', '0933407682', 'Lê Hồng Anh', '2024-08-16 09:32:08', NULL, NULL, NULL),
(127, 'Phan Gia Phú', '0375011112', 'Lê Hồng Anh', '2024-08-16 09:41:21', NULL, NULL, NULL),
(128, 'Bùi Lê Thanh Hằng', '0902188808', 'Lê Hồng Anh', '2024-08-16 09:49:54', NULL, NULL, NULL),
(129, 'Thu Hà', '0938442246', 'Vũ Thị Thu', '2024-08-16 09:51:21', NULL, NULL, NULL),
(130, 'Chu Minh Tân', '0913259779', 'Lê Hồng Anh', '2024-08-19 02:29:52', NULL, NULL, NULL),
(131, 'Mỹ mỹ', '0931460687', 'Lê Hồng Anh', '2024-08-19 02:47:20', NULL, NULL, NULL),
(132, 'Trần Việt Anh', '0969124980', 'Lê Hồng Anh', '2024-08-19 03:39:39', NULL, NULL, NULL),
(133, 'Vân Phong', '0948977627', 'Nguyễn Tuấn Anh', '2024-08-19 03:48:01', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(134, 'Nguyễn Tuấn Anh', '0328501599', 'Nguyễn Tuấn Anh', '2024-08-19 06:53:01', 'Tự tìm kiếm', 'KH Đã có web', 'Chưa có đánh giá'),
(135, 'yến', '0355993305', 'Nguyễn Trung Kiên', '2024-08-19 06:57:12', 'fb', '', 'Khách hàng mới tiếp xúc'),
(136, 'đức', '0948555367', 'Nguyễn Trung Kiên', '2024-08-19 06:58:18', 'fb', '', 'Chưa có đánh giá'),
(137, 'c nhung', '0355622681', 'Nguyễn Trung Kiên', '2024-08-19 07:13:06', 'fb', 'có web r', 'Chưa có đánh giá'),
(139, 'Vệ sinh Asean', '0899217369', 'Lê Hồng Anh', '2024-08-19 07:31:03', 'Facebook', 'KH Đã có web', 'Chưa có đánh giá'),
(140, 'Hana kim', '0374921236', 'Lê Hồng Anh', '2024-08-19 07:32:42', 'Facebook', 'KH Đã có web', 'Chưa có đánh giá'),
(141, 'hoàng', '0962612766', 'Nguyễn Trung Kiên', '2024-08-19 07:42:58', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(143, 'vy', '0364524560', 'Nguyễn Trung Kiên', '2024-08-19 08:13:01', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(144, 'nam', '0374963917', 'Nguyễn Trung Kiên', '2024-08-19 08:14:07', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(146, 'Quang Nguyễn', '0389753472', 'Nguyễn Tuấn Anh', '2024-08-19 09:00:33', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(147, 'Đặng Thị Hiền', '0777543109', 'Nguyễn Tuấn Anh', '2024-08-19 09:03:31', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(148, 'Hồng Thu', '0378340728', 'Nguyễn Tuấn Anh', '2024-08-19 09:05:11', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(149, 'vinh', '0388665566', 'Nguyễn Trung Kiên', '2024-08-19 09:31:04', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(150, 'Nguyễn Ngọc Kim Ngân', '0908882930', 'Nguyễn Tuấn Anh', '2024-08-19 09:38:30', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(151, 'Bích Liên', '0946260491', 'Nguyễn Tuấn Anh', '2024-08-19 09:38:50', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(152, 'Thi Phan', '0979600038', 'Nguyễn Tuấn Anh', '2024-08-19 09:39:12', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(153, 'Lan Anh', '0349933267', 'Nguyễn Tuấn Anh', '2024-08-19 09:40:56', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(154, 'hùng', '0937833834', 'Nguyễn Trung Kiên', '2024-08-19 09:42:53', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(155, 'tùng', '0379702691', 'Nguyễn Trung Kiên', '2024-08-19 09:43:55', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(156, 'Hồng Quý Nguyễn', '0905700055', 'Nguyễn Tuấn Anh', '2024-08-19 09:45:43', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(157, 'Nguyễn Vân', '0796680402', 'Nguyễn Tuấn Anh', '2024-08-19 09:47:44', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(158, 'Ngọc Lượng', '0971458895', 'Nguyễn Tuấn Anh', '2024-08-19 10:19:14', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(159, 'Anh Hậu', '0969961661', 'Nguyễn Tuấn Anh', '2024-08-19 10:36:15', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(160, 'nhung', '0399087920', 'Nguyễn Trung Kiên', '2024-08-20 01:53:34', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(161, 'dũng', '0396458135', 'Nguyễn Trung Kiên', '2024-08-20 01:57:18', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(162, 'hùng', '0943493555', 'Nguyễn Trung Kiên', '2024-08-20 02:01:44', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(163, 'đạt', '0336736811', 'Nguyễn Trung Kiên', '2024-08-20 02:04:25', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(164, 'đoàn', '0943114749', 'Nguyễn Trung Kiên', '2024-08-20 02:21:40', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(165, 'huy', '0785767831', 'Nguyễn Trung Kiên', '2024-08-20 02:22:30', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(166, 'Đức Huân', '0964317231', 'Lê Hồng Anh', '2024-08-20 02:41:18', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(167, 'giang', '0973050434', 'Nguyễn Trung Kiên', '2024-08-20 03:18:26', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(168, 'Lý Võ', '0981170779', 'Lê Hồng Anh', '2024-08-20 03:32:29', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(169, 'Duyệt Trần', '0962929993', 'Nguyễn Tuấn Anh', '2024-08-20 03:57:34', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(171, 'khánh', '0376311994', 'Nguyễn Trung Kiên', '2024-08-20 03:57:56', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(172, 'Huỳnh Như', '0585225007', 'Nguyễn Tuấn Anh', '2024-08-20 03:58:06', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(173, 'Nguyễn Quốc Bảo', '0976165243', 'Nguyễn Tuấn Anh', '2024-08-20 03:59:35', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(174, 'chung', '0931916916', 'Nguyễn Trung Kiên', '2024-08-20 04:04:46', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(175, 'Hoàng Văn An', '0355065187', 'Nguyễn Tuấn Anh', '2024-08-20 04:24:16', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(176, 'Nguyễn Hoàng Cao', '0392434290', 'Nguyễn Tuấn Anh', '2024-08-20 04:26:56', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(177, 'Vũ Thị Tiến', '0358466723', 'Nguyễn Tuấn Anh', '2024-08-20 04:28:34', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(179, 'Thanh Ngân', '0399233249', 'Nguyễn Tuấn Anh', '2024-08-20 04:43:27', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(180, 'Quỳnh', '0909991480', 'Nguyễn Tuấn Anh', '2024-08-20 04:54:57', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(181, 'Trang Trần', '0813434089', 'Nguyễn Tuấn Anh', '2024-08-20 04:55:30', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(182, 'phúc', '0848964698', 'Nguyễn Trung Kiên', '2024-08-21 02:08:53', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(183, 'lợi', '0902917787', 'Nguyễn Trung Kiên', '2024-08-21 02:09:54', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(184, 'Điện máy Hà Phát', '0988999517', 'Lê Hồng Anh', '2024-08-21 03:10:39', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(185, 'Hương Trà', ' 0368533124', 'Lê Hồng Anh', '2024-08-21 04:29:15', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(186, 'Quỳnh Mai', '0878513243', 'Lê Hồng Anh', '2024-08-21 04:54:16', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(187, 'Nhan tri thanh nguyen', '0977840169', 'Lê Hồng Anh', '2024-08-21 09:30:34', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(188, 'bùi bình nguyên', '0352575219', 'Lê Hồng Anh', '2024-08-21 09:33:12', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(189, 'Đỗ Anh Dũng', '0355875218', 'Lê Hồng Anh', '2024-08-21 09:34:40', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(190, 'mạnh quân ', '0879690000', 'Lê Hồng Anh', '2024-08-21 10:00:40', 'Facebook (Lead)', 'Đang cân nhắc suy nghĩ', 'Chưa có đánh giá'),
(191, 'Thầy Tân Tin Học Ngoại Ngữ', '0877983979', 'Nguyễn Tuấn Anh', '2024-08-22 02:28:20', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(192, 'Chị Giang', '0983186955', 'Nguyễn Tuấn Anh', '2024-08-22 02:28:49', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(193, 'Anh Khuyến', '0944222575', 'Nguyễn Tuấn Anh', '2024-08-22 02:38:28', 'Ucall (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(194, 'Anh Thắng', '0975556137', 'Nguyễn Tuấn Anh', '2024-08-22 02:47:49', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(195, 'kính mắt', '0939702222', 'Nguyễn Trung Kiên', '2024-08-22 03:11:29', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(196, 'lan anh', '0393409332', 'Nguyễn Trung Kiên', '2024-08-22 03:12:04', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(197, 'dương', '0973647321', 'Nguyễn Trung Kiên', '2024-08-22 03:13:59', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(198, 'Thanh Mai Mobi', '0369678167', 'Nguyễn Tuấn Anh', '2024-08-22 03:23:49', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(200, 'cc cây', '0398301606', 'Nguyễn Trung Kiên', '2024-08-22 04:11:49', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(201, 'huyền', '0388977821', 'Nguyễn Trung Kiên', '2024-08-22 04:13:50', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(202, 'hương', '0912330044', 'Nguyễn Trung Kiên', '2024-08-22 04:24:30', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(203, 'nam', '0374799566', 'Nguyễn Trung Kiên', '2024-08-22 04:24:53', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(204, 'tuấn', '0982551293', 'Nguyễn Trung Kiên', '2024-08-22 04:45:05', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(205, 'dũng', '0983949819', 'Nguyễn Trung Kiên', '2024-08-22 06:46:12', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(206, 'HÒA', '0329960033', 'Nguyễn Trung Kiên', '2024-08-22 07:05:33', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(207, 'yến', '0398189041', 'Nguyễn Trung Kiên', '2024-08-22 07:16:23', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(208, 'Anh Phú', '0333748584', 'Nguyễn Tuấn Anh', '2024-08-22 07:18:25', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(209, 'Long Bưởi', '0965966639', 'Lê Hồng Anh', '2024-08-22 07:20:20', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(210, 'Anh Trường (Thiết kế website)', '0354274143', 'Nguyễn Tuấn Anh', '2024-08-22 07:25:42', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(211, 'sơn', '0964047698', 'Nguyễn Trung Kiên', '2024-08-22 07:33:12', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(213, 'Trần quý hồng', '0853532383', 'Lê Hồng Anh', '2024-08-22 07:37:27', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(216, 'hải', '0963190925', 'Nguyễn Trung Kiên', '2024-08-22 08:22:05', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(218, 'Anh Minh', '0961533111', 'Nguyễn Tuấn Anh', '2024-08-22 08:23:51', 'Ucall (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(219, 'Anh Hồi Nguyễn', '0392488297', 'Nguyễn Tuấn Anh', '2024-08-22 08:25:57', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(220, 'Quang Hào', '0946418536', 'Nguyễn Tuấn Anh', '2024-08-22 09:29:09', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(221, 'Hoàng Bảo Ngọc', '0943689677', 'Nguyễn Tuấn Anh', '2024-08-22 09:36:50', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(222, 'Thanh Vũ', '0919587155', 'Nguyễn Tuấn Anh', '2024-08-22 09:37:51', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(223, 'Dark', '0945615515', 'Nguyễn Tuấn Anh', '2024-08-22 10:15:13', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(224, 'Thuytu', '0906737147', 'Nguyễn Tuấn Anh', '2024-08-22 10:31:11', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(225, 'Lê Hiếu Nghĩa', '0909167685', 'Nguyễn Tuấn Anh', '2024-08-22 10:38:16', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(226, 'Tran Dinh Thang', '0908235792', 'Nguyễn Tuấn Anh', '2024-08-22 10:38:40', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(227, 'Truc Pham', '84902921158', 'Nguyễn Tuấn Anh', '2024-08-22 10:39:04', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(228, 'Ân', '0901260260', 'Nguyễn Tuấn Anh', '2024-08-22 10:39:25', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(229, 'Ths Trương Văn Đức', '0905806398', 'Nguyễn Tuấn Anh', '2024-08-22 10:39:45', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(230, 'No Name', '0583414536', 'Nguyễn Tuấn Anh', '2024-08-22 10:40:23', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(231, 'Phạm Hải Anh', '0934241050', 'Nguyễn Tuấn Anh', '2024-08-22 10:40:45', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(232, 'Huynh Qui', '0907941594', 'Nguyễn Tuấn Anh', '2024-08-22 10:41:10', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(233, 'Minh Việt Travel', '0906001359', 'Nguyễn Tuấn Anh', '2024-08-22 10:49:44', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(235, 'Quoctaii', '0906613087', 'Nguyễn Tuấn Anh', '2024-08-22 10:52:55', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(236, 'đức anh', '0366174256', 'Nguyễn Trung Kiên', '2024-08-26 02:42:40', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(237, 'tuyền', '0967581649', 'Nguyễn Trung Kiên', '2024-08-26 02:46:26', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(238, 'No name', '0365223697', 'Nguyễn Tuấn Anh', '2024-08-26 02:53:49', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(239, 'No Name', '0372949269', 'Nguyễn Tuấn Anh', '2024-08-26 02:54:10', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(240, 'Chị Diệp', '0353187337 ', 'Nguyễn Tuấn Anh', '2024-08-26 02:55:00', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(241, 'Cody Nguyễn', '0978468734', 'Nguyễn Tuấn Anh', '2024-08-26 02:55:56', 'Ucall (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(242, 'Yễn Nguyễn', '0356605489', 'Nguyễn Tuấn Anh', '2024-08-26 02:56:37', 'Ucall (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(243, 'duowng', '0966972609', 'Nguyễn Trung Kiên', '2024-08-26 02:56:53', 'Facebook (Lead)', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(244, 'Trần Tuấn Anh', '0374562519', 'Nguyễn Tuấn Anh', '2024-08-26 02:57:07', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(245, 'Nguyễn Văn Đợi', '0335942555', 'Nguyễn Tuấn Anh', '2024-08-26 02:57:23', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(246, 'Vương Lan', '0353771333', 'Nguyễn Tuấn Anh', '2024-08-26 02:57:54', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(247, 'No Name', '0989064383', 'Nguyễn Tuấn Anh', '2024-08-26 02:58:57', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(248, 'Trung Sơn', '0967889026', 'Nguyễn Tuấn Anh', '2024-08-26 02:59:40', 'Ucall (Lead)', 'KH Đã có web', 'Chưa có đánh giá'),
(249, 'Hằng Liên', '0981730598', 'Nguyễn Tuấn Anh', '2024-08-26 03:00:17', 'Ucall (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(250, 'Long Nia', '0774399904', 'Nguyễn Tuấn Anh', '2024-08-26 03:00:35', 'Ucall (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(251, 'Nguyen Hien', '0908852472', 'Nguyễn Tuấn Anh', '2024-08-26 03:00:57', 'Ucall (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(252, 'Đường Utm Sự Kiện', '0935120203', 'Nguyễn Tuấn Anh', '2024-08-26 03:01:25', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(253, 'Máy May Công Nghiệp Long Biên', '0972177178', 'Nguyễn Tuấn Anh', '2024-08-26 03:01:47', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(254, 'Emma Hoang', '0979798168', 'Nguyễn Tuấn Anh', '2024-08-26 03:02:17', 'Ucall (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(255, 'Thái Toàn Phần Mềm Sapo', '0971532212', 'Nguyễn Tuấn Anh', '2024-08-26 03:02:37', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(256, 'Cty Thuê Xe Bách Việt Cần Thơ', '0916237090', 'Nguyễn Tuấn Anh', '2024-08-26 03:02:59', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(257, 'thanh', '0915014978', 'Nguyễn Trung Kiên', '2024-08-26 03:15:50', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(258, 'linh', '0988236062', 'Nguyễn Trung Kiên', '2024-08-26 03:17:24', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(259, 'Nhà hàng chim trời', '0913988833', 'Lê Hồng Anh', '2024-08-26 03:21:08', 'Facebook (Lead)', 'KH Đã có web', 'Chưa có đánh giá'),
(260, 'Như ', '0966791319', 'Lê Hồng Anh', '2024-08-26 03:23:03', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(261, 'khoa', '0982380205', 'Nguyễn Trung Kiên', '2024-08-26 03:24:04', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(262, 'Đào Quỳnh', '0983892896', 'Lê Hồng Anh', '2024-08-26 03:24:35', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(263, 'bách', '0978561900', 'Nguyễn Trung Kiên', '2024-08-26 03:29:02', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(265, 'thông', '0934311441', 'Nguyễn Trung Kiên', '2024-08-26 03:43:24', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(266, 'thanh', '0986738604', 'Nguyễn Trung Kiên', '2024-08-26 03:46:04', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(267, 'carjec', '0387337883', 'Lê Hồng Anh', '2024-08-26 03:46:45', 'Facebook (Lead)', 'KH Đã có web', 'Chưa có đánh giá'),
(268, 'Trần Tuấn Anh ', '0398205595', 'Lê Hồng Anh', '2024-08-26 03:56:53', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(269, 'Nguyễn Văn Cường', '0945736111', 'Lê Hồng Anh', '2024-08-26 04:42:22', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(270, 'thịnh', '0947057755', 'Nguyễn Trung Kiên', '2024-08-26 06:15:28', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(271, 'huyền', '0329407783', 'Nguyễn Trung Kiên', '2024-08-26 06:16:51', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(275, 'Gia Phúc', '0385113113', 'Nguyễn Tuấn Anh', '2024-08-26 06:40:53', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(276, 'Lê Nhật Tân', '0858881722', 'Nguyễn Tuấn Anh', '2024-08-26 06:46:10', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(277, 'Quốc Bình', '0981964690', 'Nguyễn Tuấn Anh', '2024-08-26 06:47:52', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(279, 'Trần Tiến Tài', '0379465606', 'Nguyễn Tuấn Anh', '2024-08-26 07:13:29', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(280, 'Luận văn', '0941115775', 'Lê Hồng Anh', '2024-08-26 07:16:23', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(281, 'Mai Trang', '0362936768', 'Lê Hồng Anh', '2024-08-26 07:20:32', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(282, 'Huyền Tuất', '0352971818', 'Lê Hồng Anh', '2024-08-26 07:21:43', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(283, 'hùng', '0935545257', 'Lê Hồng Anh', '2024-08-26 07:23:10', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(284, 'Vân Trang', ' 0332682247', 'Lê Hồng Anh', '2024-08-26 07:24:58', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(285, 'vinh trần', '0378656558', 'Lê Hồng Anh', '2024-08-26 07:28:25', 'Facebook (Lead)', 'KH Đã có web', 'Chưa có đánh giá'),
(286, 'khánh', '0345990459', 'Nguyễn Trung Kiên', '2024-08-26 07:30:56', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(287, 'vinh', '0934786800', 'Nguyễn Trung Kiên', '2024-08-26 07:31:14', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(288, 'linh', '0962844280', 'Nguyễn Trung Kiên', '2024-08-26 07:41:16', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(291, 'trọng', '0936069569', 'Nguyễn Trung Kiên', '2024-08-26 07:51:06', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(292, 'Lê Quân', '0967283881', 'Nguyễn Tuấn Anh', '2024-08-26 07:52:52', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(293, 'Vũ Đình Bảo', '0946253808', 'Nguyễn Tuấn Anh', '2024-08-26 07:53:39', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(294, 'Chau Dao', '0973977417', 'Lê Hồng Anh', '2024-08-26 07:54:31', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(295, 'Phương Hoàng', '0974100372', 'Nguyễn Tuấn Anh', '2024-08-26 07:55:11', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(296, 'tuấn anh', '0986813648', 'Nguyễn Trung Kiên', '2024-08-26 07:57:35', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(298, 'minh', '0935878463', 'Nguyễn Trung Kiên', '2024-08-26 07:59:13', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(299, 'linh', '0976859751', 'Nguyễn Trung Kiên', '2024-08-26 07:59:43', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(300, 'kiên', '0981886168', 'Lê Hồng Anh', '2024-08-26 08:05:09', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(301, 'Đắc Thao', '0936369314', 'Lê Hồng Anh', '2024-08-26 08:06:37', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(302, 'Hồng Vân', '0948120564', 'Nguyễn Tuấn Anh', '2024-08-26 08:10:19', 'Google Ads (Lead)', 'Đang tư vấn', 'Khách hàng chăm sóc sau bán'),
(303, 'Phạm Diệu', '0799848876', 'Nguyễn Tuấn Anh', '2024-08-26 08:10:50', 'Google Ads (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(304, 'Lâm Nguyễn', '0968049905', 'Nguyễn Tuấn Anh', '2024-08-26 08:11:22', 'Google Ads (Lead)', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(305, 'Ngô Hoài Nam', '0975678838', 'Nguyễn Tuấn Anh', '2024-08-26 08:12:02', 'Google Ads (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(306, 'Anh Long', '0357473333', 'Nguyễn Tuấn Anh', '2024-08-26 08:12:25', 'Google Ads (Lead)', 'Chờ ký HĐ', 'Khách hàng cơ hội'),
(307, 'Long Nguyễn', '0777048518', 'Nguyễn Tuấn Anh', '2024-08-26 08:12:46', 'Google Ads (Lead)', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(308, 'Hoàng Phi', '0907652999', 'Nguyễn Tuấn Anh', '2024-08-26 08:25:18', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(309, 'Hiếu Trần', '0777132344', 'Nguyễn Tuấn Anh', '2024-08-26 08:28:18', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(310, 'A Dương', '0966744888', 'Nguyễn Tuấn Anh', '2024-08-26 08:31:36', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(311, 'Triều Nguyễn', '0973539397', 'Nguyễn Tuấn Anh', '2024-08-26 08:34:50', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(312, 'Đinh Tuấn Anh', '0393877140', 'Nguyễn Tuấn Anh', '2024-08-26 08:36:27', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(313, 'Anh Thưởng', '0987742953', 'Nguyễn Tuấn Anh', '2024-08-26 08:38:46', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(314, 'Solar', '0392864888', 'Lê Hồng Anh', '2024-08-27 02:12:35', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(315, 'anthony truong', '0704435895', 'Lê Hồng Anh', '2024-08-27 02:13:56', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(316, 'Trương Ninh', '0987889189', 'Lê Hồng Anh', '2024-08-27 02:18:26', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(317, 'Phan Truong', '0933592979', 'Lê Hồng Anh', '2024-08-27 02:34:43', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(318, 'Quyên Say', '0382011089', 'Lê Hồng Anh', '2024-08-27 03:21:16', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(319, 'hằng', '0904243903', 'Nguyễn Trung Kiên', '2024-08-27 04:01:25', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(320, 'linh', '0987821290', 'Nguyễn Trung Kiên', '2024-08-27 04:01:39', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(321, 'bảo', '0869216920', 'Nguyễn Trung Kiên', '2024-08-27 04:01:51', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(322, 'hải', '0987666809', 'Nguyễn Trung Kiên', '2024-08-27 04:02:01', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(323, 'dương', '0982540095', 'Nguyễn Trung Kiên', '2024-08-27 04:02:13', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(324, 'trịnh', '0338208188', 'Nguyễn Trung Kiên', '2024-08-27 04:02:23', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(325, 'Anh Hùng - Bán điện thoại', '0988530532', 'Nguyễn Tuấn Anh', '2024-08-27 04:49:56', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(326, 'Danh Tho', '0918190511', 'Nguyễn Tuấn Anh', '2024-08-27 04:53:10', 'Ucall (Lead)', 'KH Đã có web', 'Chưa có đánh giá'),
(327, '0966831130', 'linh', 'Nguyễn Trung Kiên', '2024-08-27 06:36:56', 'Facebook (Lead)', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(328, 'Hoàng Skincare', '0332346148', 'Lê Hồng Anh', '2024-08-27 07:37:40', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(329, 'Bang Vo', '0938139687', 'Nguyễn Tuấn Anh', '2024-08-27 07:43:49', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(330, 'Anh Đạt', '0911939427', 'Nguyễn Tuấn Anh', '2024-08-27 07:46:23', 'Ucall (Lead)', 'KH Đã có web', 'Chưa có đánh giá'),
(331, 'Phạm Anh Đức', '0969989799', 'Nguyễn Tuấn Anh', '2024-08-27 08:13:21', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(332, 'Thùy Linh', '0961469231', 'Nguyễn Tuấn Anh', '2024-08-27 08:14:30', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(333, 'Nguyễn Minh Chiến', '0935664419', 'Nguyễn Tuấn Anh', '2024-08-27 08:16:21', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(335, 'Zoo trần', ' 0945.616.247', 'Lê Hồng Anh', '2024-08-27 08:17:40', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(336, 'Hà Quốc Tuấn', '0971993696', 'Nguyễn Tuấn Anh', '2024-08-27 08:18:22', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(337, 'Thành Đạt', '0972229444', 'Nguyễn Tuấn Anh', '2024-08-27 08:20:53', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(338, 'nội thất', '07678.25.117', 'Nguyễn Trung Kiên', '2024-08-27 08:23:00', 'Facebook (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(339, 'Anh Lộc', '0373262475', 'Nguyễn Tuấn Anh', '2024-08-27 08:23:19', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(341, 'TRUNG', '0963756196', 'Nguyễn Trung Kiên', '2024-08-27 08:54:09', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(342, 'PHÁT', '0902895949	MobiFone', 'Nguyễn Trung Kiên', '2024-08-27 08:54:21', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(343, 'linh', '0966831130', 'Nguyễn Trung Kiên', '2024-08-27 08:54:34', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(344, 'Thùy Linh', '0932230992', 'Đỗ Minh Đức', '2024-08-27 08:55:51', 'Ucall (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(345, 'Huy Nguyễn', '0966888115', 'Lê Hồng Anh', '2024-08-27 08:59:22', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(346, 'Tom sawyer', '0367908355', 'Lê Hồng Anh', '2024-08-27 09:00:29', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(347, 'Trần Quân', '0377850675', 'Lê Hồng Anh', '2024-08-27 09:05:13', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(348, 'Nhật Linh', '0943330240', 'Lê Hồng Anh', '2024-08-27 09:07:49', 'Tự tìm kiếm', 'KH Đã có web', 'Chưa có đánh giá'),
(349, 'bi a', '096 247 02 47', 'Nguyễn Trung Kiên', '2024-08-27 09:12:22', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(350, 'anh Tùng', '0979951535', 'Đỗ Minh Đức', '2024-08-27 09:16:23', 'Ucall (Lead)', 'Đang cân nhắc suy nghĩ', 'Khách hàng mới tiếp xúc'),
(351, 'Anh Phát', '0902895949', 'Lê Hồng Anh', '2024-08-27 09:16:34', 'Tự tìm kiếm', 'KH Đã có web', 'Chưa có đánh giá'),
(352, 'Trần Văn Sao', '0368720705', 'Lê Hồng Anh', '2024-08-27 10:00:41', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(353, 'Vũ hoàng anh tuấn', '0915632589', 'Lê Hồng Anh', '2024-08-27 10:02:38', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(354, 'Thơ Bạch', '0986146576', 'Nguyễn Tuấn Anh', '2024-08-27 10:06:45', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(355, 'David Trương', '0902603149', 'Nguyễn Tuấn Anh', '2024-08-27 10:07:05', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(357, 'Tiến Khải', '0399576684', 'Nguyễn Tuấn Anh', '2024-08-27 10:07:50', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(358, 'Quang Thịnh', '0386473498', 'Nguyễn Tuấn Anh', '2024-08-27 10:22:16', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(359, 'linh', '0987411363', 'Nguyễn Trung Kiên', '2024-08-28 02:11:32', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(360, 'Hoàng Minh Nguyễn', '0356987140', 'Lê Hồng Anh', '2024-08-28 02:14:44', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(361, 'Võ Thái Sơn', '0333848816', 'Lê Hồng Anh', '2024-08-28 02:35:41', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(362, 'Nguyễn Phượng', '0335493508', 'Lê Hồng Anh', '2024-08-28 03:57:27', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(363, 'thái hòa mart', '0902115356', 'Lê Hồng Anh', '2024-08-28 04:14:11', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(364, 'việt', '0975672228', 'Nguyễn Trung Kiên', '2024-08-28 06:28:25', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(365, 'đức', '0355206299', 'Nguyễn Trung Kiên', '2024-08-28 06:28:45', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(366, 'mai anh', '0399224139', 'Nguyễn Trung Kiên', '2024-08-28 06:38:03', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(367, 'ducky', '0986969000', 'Nguyễn Trung Kiên', '2024-08-28 06:53:41', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(369, 'khánh', '0978277897', 'Nguyễn Trung Kiên', '2024-08-28 07:27:26', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(370, 'Trần Chung', '0869777678', 'Lê Hồng Anh', '2024-08-28 08:05:31', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(371, 'tân', '0977623406', 'Nguyễn Trung Kiên', '2024-08-28 08:06:22', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(372, 'ngọc anh', '0366686678', 'Nguyễn Trung Kiên', '2024-08-28 08:43:47', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(373, 'Nguyễn Ngọc Thanh', '0372444937', 'Lê Hồng Anh', '2024-08-28 08:48:33', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(374, 'hiền', '0976270683', 'Nguyễn Trung Kiên', '2024-08-28 09:07:30', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(375, 'Lê Thành', '0966223337', 'Lê Hồng Anh', '2024-08-28 09:13:05', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(376, 'Thư Lê', '0398668851', 'Lê Hồng Anh', '2024-08-28 10:24:05', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(377, 'Vũ Văn Tiến', '0592784406', 'Lê Hồng Anh', '2024-08-28 10:24:41', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(378, 'Lê Ngọc Thiên', '0983500499', 'Lê Hồng Anh', '2024-08-28 10:27:27', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(379, 'đạt', '0856996234', 'Nguyễn Trung Kiên', '2024-08-28 14:23:23', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(380, 'Thảo Nguyên', ' 0986816214', 'Lê Hồng Anh', '2024-08-29 02:36:01', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(381, 'Vũ Tuấn', '0979400111', 'Lê Hồng Anh', '2024-08-29 02:38:15', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(382, 'Xuân Văn', '0963875578', 'Lê Hồng Anh', '2024-08-29 02:55:08', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(383, 'Kim Văn ', '0356298688', 'Lê Hồng Anh', '2024-08-29 03:14:52', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(384, 'Nguyen Nam Thai', '0919631829', 'Lê Hồng Anh', '2024-08-29 03:17:12', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(385, 'Tam Hoang Thanh', '0983656389', 'Lê Hồng Anh', '2024-08-29 03:18:51', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(386, 'di hu hoa tung', '0909843432', 'Lê Hồng Anh', '2024-08-29 03:20:06', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(387, 'Phùng Văn Việt', '0963675777', 'Nguyễn Tuấn Anh', '2024-08-29 03:21:36', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(388, 'Nguyễn Duy Hưng', '0912115893', 'Nguyễn Tuấn Anh', '2024-08-29 03:30:02', 'Tự tìm kiếm', 'Đang cân nhắc suy nghĩ', 'Chưa có đánh giá'),
(389, 'Nguyễn Hiền', '0976571071', 'Nguyễn Tuấn Anh', '2024-08-29 03:31:24', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(390, 'Ngọc Bắc', '0942563356', 'Lê Hồng Anh', '2024-08-29 03:52:54', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(391, 'Long ', '0912510895', 'Đỗ Minh Đức', '2024-08-29 03:54:32', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(392, 'Nguyễn Trung', '0934622997', 'Lê Hồng Anh', '2024-08-29 04:00:45', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(394, 'Huyền Bùi', '0988685079', 'Nguyễn Tuấn Anh', '2024-08-29 04:18:52', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(396, 'Nguyễn Phúc Duy', '0973267408', 'Đỗ Minh Đức', '2024-08-29 07:04:50', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(397, 'Bích Ngọc', '0326749359', 'Nguyễn Tuấn Anh', '2024-08-29 08:34:59', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(398, 'Thuật Nguyễn', '0981185620', 'Nguyễn Tuấn Anh', '2024-08-29 08:37:00', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(399, 'Hải', '0358522888', 'Đỗ Minh Đức', '2024-08-29 08:59:46', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(400, 'Hà Trần', '0987791094', 'Nguyễn Tuấn Anh', '2024-08-29 09:23:35', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(401, 'Đoàn Hoàng', '0366001121', 'Nguyễn Tuấn Anh', '2024-08-29 09:25:22', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(402, 'Thảo Lam', '0963658696', 'Nguyễn Tuấn Anh', '2024-08-29 09:33:57', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(403, 'Nguyễn Quý Hưng', '0915891190', 'Nguyễn Tuấn Anh', '2024-08-29 09:34:30', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(404, 'thắm', '0764139105', 'Nguyễn Trung Kiên', '2024-08-29 09:35:36', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(405, 'hà', '0368010617', 'Nguyễn Trung Kiên', '2024-08-29 09:35:53', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(406, 'thu', '0945200997', 'Nguyễn Trung Kiên', '2024-08-29 09:36:07', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(407, 'Ngọc Anh', '0362795318', 'Nguyễn Tuấn Anh', '2024-08-29 09:36:39', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(408, 'Kiều Thị Thu Hiền', '0333927799', 'Nguyễn Tuấn Anh', '2024-08-29 09:38:01', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(409, 'Nguyễn Quốc', '0985299161', 'Nguyễn Tuấn Anh', '2024-08-29 09:39:27', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(410, 'Toàn Lê', '0358791530', 'Nguyễn Tuấn Anh', '2024-08-29 09:40:28', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(411, 'uyên', '0346279765', 'Nguyễn Trung Kiên', '2024-08-29 09:41:25', 'Facebook (Lead)', 'Đang tư vấn', 'Khách hàng chăm sóc sau bán'),
(412, 'Trần Trinh', '0764120615', 'Nguyễn Tuấn Anh', '2024-08-29 09:42:08', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(413, 'Phạm Hồng Thắng', '0986727497', 'Nguyễn Tuấn Anh', '2024-08-29 09:55:18', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(414, 'Lê Thị Thanh', '0385961217', 'Nguyễn Tuấn Anh', '2024-08-29 09:56:35', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(415, 'Trung Kiên', '0822162029', 'Nguyễn Tuấn Anh', '2024-08-29 09:58:21', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(416, 'Viễn Bùi', '0392305791', 'Nguyễn Tuấn Anh', '2024-08-29 10:02:19', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(417, 'Mỹ Bùi', '0974361496', 'Nguyễn Tuấn Anh', '2024-08-29 10:02:42', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(418, 'Sơn Lương', '0901903575', 'Nguyễn Tuấn Anh', '2024-08-29 10:04:42', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(419, 'Minh Viễn', '0921842574', 'Nguyễn Tuấn Anh', '2024-08-29 10:05:16', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(420, 'Khánh Ngân', '0359942815', 'Nguyễn Tuấn Anh', '2024-08-29 10:06:00', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(421, 'Lẩu gà', '0799355455', 'Lê Hồng Anh', '2024-08-30 08:33:21', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(422, 'thắng', '0986062778', 'Nguyễn Trung Kiên', '2024-08-30 08:36:55', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(423, 'Chung thúy Vy', '0945453455', 'Lê Hồng Anh', '2024-08-30 09:02:12', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(424, 'Liên Nguyễn', '0987560586', 'Lê Hồng Anh', '2024-08-30 09:28:50', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(425, 'Thương Nguyễn', '0962145629', 'Lê Hồng Anh', '2024-08-30 09:32:52', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(426, 'nam', '0936726837', 'Nguyễn Trung Kiên', '2024-09-04 03:00:31', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(427, 'thuyết', '0917765798', 'Nguyễn Trung Kiên', '2024-09-04 03:01:16', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(428, 'sang', '0931409989', 'Nguyễn Trung Kiên', '2024-09-04 03:11:38', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(430, 'ngọc', '0768484824', 'Nguyễn Trung Kiên', '2024-09-04 03:15:15', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(431, 'thuận', '0974240368', 'Nguyễn Trung Kiên', '2024-09-04 03:18:28', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(432, 'đông', '0379320204', 'Nguyễn Trung Kiên', '2024-09-04 03:20:32', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(433, 'thiện', '0993222777', 'Nguyễn Trung Kiên', '2024-09-04 03:24:34', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(434, 'Trương Tiên', '0974698279', 'Nguyễn Tuấn Anh', '2024-09-04 03:42:13', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(435, ' Mạnh Linh Bùi', '0886552233', 'Nguyễn Tuấn Anh', '2024-09-04 03:42:57', 'Facebook (Lead)', 'Đang tư vấn', 'Chưa có đánh giá'),
(436, ' Nguyễn Đức Công', '0827892678', 'Nguyễn Tuấn Anh', '2024-09-04 03:43:43', 'Facebook (Lead)', 'KH Đã có web', 'Chưa có đánh giá'),
(437, ' Mạc Kỳ Như', '0399999089', 'Nguyễn Tuấn Anh', '2024-09-04 03:44:14', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(438, 'Anh Lanh', '0917200894', 'Đỗ Minh Đức', '2024-09-04 03:49:01', 'Tự tìm kiếm', 'Không nhu cầu', 'Khách hàng mới tiếp xúc'),
(439, 'Lưu Bảo Đồng', '0357024665', 'Nguyễn Tuấn Anh', '2024-09-04 03:57:46', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(440, 'Đinh Đan', '0979125191', 'Nguyễn Tuấn Anh', '2024-09-04 04:00:34', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(441, 'Mai Việt Sơn', '0942551009', 'Nguyễn Tuấn Anh', '2024-09-04 04:02:46', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(442, 'Vũ Cường', '0975141286', 'Nguyễn Tuấn Anh', '2024-09-04 04:04:23', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(443, 'Tran Tran', '0777795924', 'Nguyễn Tuấn Anh', '2024-09-04 04:15:14', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(444, 'Chị Trang ', '0903888369', 'Đỗ Minh Đức', '2024-09-04 04:37:45', 'Ucall (Lead)', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(445, 'thành', '0948968595', 'Nguyễn Trung Kiên', '2024-09-04 04:48:51', 'Facebook (Lead)', 'Đang tư vấn', 'Khách hàng cơ hội'),
(446, 'anh đàm vĩnh hưng ', '0903640863', 'Đỗ Minh Đức', '2024-09-04 04:51:36', 'Ucall (Lead)', 'Đang cân nhắc suy nghĩ', 'Khách hàng mới tiếp xúc'),
(447, 'Lục Minh Thuận', '0386808639', 'Nguyễn Tuấn Anh', '2024-09-04 07:16:08', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(448, 'Phan Duy', '0375866356', 'Nguyễn Tuấn Anh', '2024-09-04 07:17:13', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(449, 'Nguyễn Kim Liên', '0369053698', 'Nguyễn Tuấn Anh', '2024-09-04 07:48:34', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(450, 'Lê Đăng Vũ Trường', '0979850508', 'Nguyễn Tuấn Anh', '2024-09-04 07:49:04', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(451, 'Ngọc Hiển', '0374568909', 'Lê Hồng Anh', '2024-09-04 07:51:47', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(452, 'Le Thu Hương', '0981080906', 'Lê Hồng Anh', '2024-09-04 07:56:34', 'Tự tìm kiếm', 'KH Đã có web', 'Chưa có đánh giá'),
(453, 'Kiến Nguyệt', '0399050186', 'Nguyễn Tuấn Anh', '2024-09-04 07:56:58', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(454, 'Tân Bùi', '0901850185', 'Nguyễn Tuấn Anh', '2024-09-04 07:57:30', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(455, 'Chí Thanh', '0842948664', 'Nguyễn Tuấn Anh', '2024-09-04 07:59:17', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(456, 'Huy Vương', '0964599799', 'Nguyễn Tuấn Anh', '2024-09-04 08:02:09', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(457, 'Trương Mỹ Linh', '0937553379', 'Nguyễn Tuấn Anh', '2024-09-04 08:02:58', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(458, 'Huỳnh Công Tiến', '0846622939', 'Nguyễn Tuấn Anh', '2024-09-04 08:04:32', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(459, 'Hoa Ninh', '0379779420', 'Nguyễn Tuấn Anh', '2024-09-04 08:05:37', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(460, 'Nguyễn Ngọc Anh Thu', '0937744062', 'Nguyễn Tuấn Anh', '2024-09-04 08:07:18', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(461, 'Tạ Nhật', '0915396958', 'Nguyễn Tuấn Anh', '2024-09-04 08:08:20', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(462, 'Khánh Hoàng', '0706116413', 'Nguyễn Tuấn Anh', '2024-09-04 08:09:19', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(463, 'Nguyễn Bảo Ngọc', '0944233883', 'Lê Hồng Anh', '2024-09-04 08:10:15', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(464, 'Lê Đặng Hải', '0974095421', 'Nguyễn Tuấn Anh', '2024-09-04 08:10:23', 'Tự tìm kiếm', 'KH Đã có web', 'Chưa có đánh giá');
INSERT INTO `customers` (`id`, `customer_name`, `phone_number`, `created_by`, `created_at`, `data_source`, `contact_status`, `customer_evaluation`) VALUES
(465, 'Nam Trương', '0339482057', 'Nguyễn Tuấn Anh', '2024-09-04 08:11:26', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(466, 'Anh Ba', '0935372479', 'Lê Hồng Anh', '2024-09-04 08:13:12', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(467, 'Hồng Nguyễn', '0937879078', 'Nguyễn Tuấn Anh', '2024-09-04 08:21:46', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(468, 'Chúng Nguyễn', '0396297118', 'Nguyễn Tuấn Anh', '2024-09-04 08:22:00', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(469, 'Phạm Dương', '0904654926', 'Nguyễn Tuấn Anh', '2024-09-04 08:23:57', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(470, 'Hoàng Thanh Khôi', '0765389166', 'Nguyễn Tuấn Anh', '2024-09-04 08:25:14', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(471, 'Tuấn Trần', '0766667728', 'Nguyễn Tuấn Anh', '2024-09-04 08:27:36', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(472, 'Tuấn Vũ', '0962541710', 'Nguyễn Tuấn Anh', '2024-09-04 08:28:12', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(473, 'võ', '0963274194', 'Nguyễn Trung Kiên', '2024-09-04 08:50:41', 'Facebook (Lead)', 'Đang tư vấn', 'Khách hàng tiềm năng'),
(474, 'Anh TRUNG', '0905933223', 'Đỗ Minh Đức', '2024-09-04 08:56:11', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(475, 'CHỊ XUÂN', '0352307111', 'Đỗ Minh Đức', '2024-09-04 09:02:18', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(476, 'Cắt lade', '0969915902', 'Lê Hồng Anh', '2024-09-04 09:13:55', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(477, 'Thiên nhân land', '0397891111', 'Lê Hồng Anh', '2024-09-04 09:16:51', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(478, 'Dương Lan Dương', '0931818111', 'Lê Hồng Anh', '2024-09-04 09:21:30', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(480, 'trang', '0763044881', 'Nguyễn Trung Kiên', '2024-09-05 02:46:58', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(481, '0393457550', 'thắng', 'Nguyễn Trung Kiên', '2024-09-05 02:47:16', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(482, 'thủy', '0395882002', 'Nguyễn Trung Kiên', '2024-09-05 02:48:09', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(488, 'ánh', '0943640234', 'Nguyễn Trung Kiên', '2024-09-05 07:11:01', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(489, 'ánh', '0916569045', 'Nguyễn Trung Kiên', '2024-09-05 07:15:56', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(490, 'Thiên Hào', '0385633224', 'Lê Hồng Anh', '2024-09-05 07:55:00', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(491, 'Tấn Hoàng', '0392332478', 'Lê Hồng Anh', '2024-09-05 08:38:16', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(492, 'Cố Bạch', '0968723408', 'Lê Hồng Anh', '2024-09-05 08:50:06', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(493, 'Nhôm Kính Bình Dương', '0963323374', 'Lê Hồng Anh', '2024-09-05 08:54:50', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(494, 'Dương Công Bình', '0984998325', 'Lê Hồng Anh', '2024-09-05 09:13:00', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(495, 'Nguyễn Việt Hùng', '0568019999', 'Lê Hồng Anh', '2024-09-05 09:21:36', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(496, 'Phạm Văn Thủy', '0974799527', 'Lê Hồng Anh', '2024-09-05 09:35:47', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(497, 'cấy thép', '0773557929', 'Lê Hồng Anh', '2024-09-05 09:37:39', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(498, 'guyễn Kiều', '0911060579', 'Lê Hồng Anh', '2024-09-05 09:39:15', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(499, 'Văn Tâm', '0329334386', 'Nguyễn Tuấn Anh', '2024-09-05 09:40:29', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(500, 'Đinh Dũng', '0914635616', 'Nguyễn Tuấn Anh', '2024-09-05 09:41:07', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(501, 'Nguyễn Văn Huyến', '0337888922', 'Lê Hồng Anh', '2024-09-05 09:44:07', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(502, 'Lê Đình Giang', '0979402466', 'Lê Hồng Anh', '2024-09-05 09:45:37', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(504, 'chuyển phát', '0988809489', 'Nguyễn Trung Kiên', '2024-09-05 09:47:20', 'Tự tìm kiếm', 'KH Đã có web', 'Chưa có đánh giá'),
(505, 'Ngọc Candy', '0983316694', 'Nguyễn Tuấn Anh', '2024-09-05 09:48:26', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(506, 'dù lệch tâm', '0934032025', 'Lê Hồng Anh', '2024-09-05 09:49:46', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(507, 'hiền xu', '0962819536', 'Nguyễn Trung Kiên', '2024-09-05 09:50:05', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(509, 'Nguyên Hồ', '0961065479', 'Lê Hồng Anh', '2024-09-05 09:52:56', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(510, 'Gia Bảo', '0948868492', 'Lê Hồng Anh', '2024-09-05 09:53:50', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(511, 'Đức Đại', '0974121000', 'Lê Hồng Anh', '2024-09-05 10:05:18', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(512, 'Vũ Hải', '0394469428', 'Nguyễn Tuấn Anh', '2024-09-05 10:06:50', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(513, 'đức hải', '0947648776', 'Lê Hồng Anh', '2024-09-05 10:07:34', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(514, 'Nguyễn Thành Lâm', '0902751789', 'Nguyễn Tuấn Anh', '2024-09-05 10:09:59', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(515, 'Quang Dũng', '0388884599', 'Lê Hồng Anh', '2024-09-05 10:10:03', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(516, 'Vương Hoàng', '0776642225', 'Nguyễn Tuấn Anh', '2024-09-05 10:10:44', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(517, 'Chu Văn Duy', '0984768991', 'Nguyễn Tuấn Anh', '2024-09-05 10:11:44', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(518, 'Uyen Tran', '0383759952', 'Nguyễn Tuấn Anh', '2024-09-05 10:13:05', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(519, 'Thanh Thanh', '0394407808', 'Nguyễn Tuấn Anh', '2024-09-05 10:13:47', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(520, 'ty', ' 0339463779', 'Nguyễn Trung Kiên', '2024-09-06 07:19:25', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(521, 'diệp', '0972610118', 'Nguyễn Trung Kiên', '2024-09-06 07:36:17', 'Tự tìm kiếm', 'Đang tư vấn', 'Chưa có đánh giá'),
(522, 'nguyên', '0326630975', 'Nguyễn Trung Kiên', '2024-09-06 07:46:16', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(523, 'thăng', '0962505855', 'Nguyễn Trung Kiên', '2024-09-09 02:51:41', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(524, 'minh', ' 094 2222 034', 'Nguyễn Trung Kiên', '2024-09-09 04:31:42', 'Tự tìm kiếm', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(525, 'Lương Thanh Tuyến', '0936499404', 'Nguyễn Tuấn Anh', '2024-09-12 06:37:45', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(526, 'Phan Minh', '0779939507', 'Nguyễn Tuấn Anh', '2024-09-12 06:42:00', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(527, 'Trần Dũng', '0909091098', 'Nguyễn Tuấn Anh', '2024-09-12 06:51:20', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(528, 'Quân Lê', '0797634867', 'Nguyễn Tuấn Anh', '2024-09-12 06:52:30', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(529, 'Mai Liệu', '0906779924', 'Nguyễn Tuấn Anh', '2024-09-12 06:55:08', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(530, 'Gia Minh', '0906272588', 'Nguyễn Tuấn Anh', '2024-09-12 07:36:55', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(532, 'Tiến Dũng', '0914931298', 'Nguyễn Tuấn Anh', '2024-09-12 08:14:56', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(533, 'Nguyễn Trọng Linh', '0356288646', 'Nguyễn Tuấn Anh', '2024-09-12 08:47:13', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(534, 'Chu Nhật Anh', '0963251369', 'Nguyễn Tuấn Anh', '2024-09-12 09:24:31', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(535, 'Hoa Bỉ Ngạn', '0969557296', 'Nguyễn Tuấn Anh', '2024-09-12 09:24:51', 'Facebook (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(536, 'Quỳnh Bird', '0973889754', 'Nguyễn Tuấn Anh', '2024-09-12 09:26:51', 'Facebook (Lead)', 'KH Đã có web', 'Chưa có đánh giá'),
(537, 'Rio Catter', '0355955678', 'Nguyễn Tuấn Anh', '2024-09-12 09:27:51', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(539, 'Do Thanh Nhon', '0968944936', 'Nguyễn Tuấn Anh', '2024-09-12 09:39:29', 'Facebook (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(540, 'Phạm Thái', '0865895996', 'Nguyễn Tuấn Anh', '2024-09-12 09:49:35', 'Facebook (Lead)', 'KH Đã có web', 'Chưa có đánh giá'),
(541, 'Bùi Cao Phương', '0947131383', 'Nguyễn Tuấn Anh', '2024-09-12 09:50:20', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(543, 'Lê Lân', '0916611694', 'Nguyễn Tuấn Anh', '2024-09-12 09:53:47', 'Facebook (Lead)', 'Đang tư vấn', 'Khách hàng mới tiếp xúc'),
(544, 'Phan Thanh Hieu', '0905550486', 'Nguyễn Tuấn Anh', '2024-09-12 09:55:10', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(545, 'Vũ Thanh Tùng', '0856533213', 'Nguyễn Tuấn Anh', '2024-09-12 09:56:18', 'Facebook (Lead)', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(546, 'Tiến Võ', '0768402567', 'Nguyễn Tuấn Anh', '2024-09-13 03:49:58', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(547, 'Uông Bảo Ngọc', '0917385976', 'Nguyễn Tuấn Anh', '2024-09-13 04:00:37', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(549, 'Tuong Vy Le', '0345982297', 'Nguyễn Tuấn Anh', '2024-09-13 04:13:52', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(550, 'Phong Đặng', '0929009292', 'Nguyễn Tuấn Anh', '2024-09-13 04:14:21', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(551, 'Quỳnh Chi', '0706080959', 'Nguyễn Tuấn Anh', '2024-09-13 04:14:44', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(552, 'Nguyễn Chí Linh ', '0964455484', 'Hà Đình Hoàng', '2024-10-07 15:52:40', 'Facebook (Lead)', 'KH tiềm năng', 'Khách hàng tiềm năng'),
(553, 'Vô Tâm', '0776178188', 'Hà Đình Hoàng', '2024-10-07 16:08:51', 'Facebook (Lead)', 'KH tiềm năng', 'Chưa có đánh giá'),
(554, 'Vu Hue', '0986844919', 'Hà Đình Hoàng', '2024-10-07 16:12:42', 'Facebook (Lead)', 'KH tiềm năng', 'Chưa có đánh giá'),
(555, 'Kim Loan Tran ', '0834094094', 'Hà Đình Hoàng', '2024-10-07 16:15:38', 'Facebook (Lead)', 'KH tiềm năng', 'Chưa có đánh giá'),
(556, 'Ngọc Minh Tâm ', '0981822209', 'Hà Đình Hoàng', '2024-10-07 16:16:38', 'Ucall (Lead)', 'KH tiềm năng', 'Chưa có đánh giá'),
(557, 'Lê Như Ngọc Móm  (Emy)', '0937770233', 'Hà Đình Hoàng', '2024-10-07 16:19:44', 'Facebook (Lead)', 'KH tiềm năng', 'Chưa có đánh giá'),
(558, 'Ngan Vo ', '0913677049', 'Hà Đình Hoàng', '2024-10-07 16:20:36', 'Facebook (Lead)', 'KH tiềm năng', 'Chưa có đánh giá'),
(559, 'Hồng Đào ', '0369374677', 'Hà Đình Hoàng', '2024-10-07 16:26:30', 'Facebook (Lead)', 'KH tiềm năng', 'Chưa có đánh giá'),
(560, 'Tân Trần', '0349677079', 'Hà Đình Hoàng', '2024-10-07 16:27:24', 'Facebook (Lead)', 'KH tiềm năng', 'Chưa có đánh giá'),
(561, 'Ngọc Tú', '0944639889', 'Doãn Đức Thuận', '2024-10-14 08:39:54', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(562, 'Thành Đạt', '𝟎𝟗𝟏𝟔𝟎𝟔𝟎𝟑𝟖𝟓', 'Doãn Đức Thuận', '2024-10-14 08:43:34', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(564, 'Vũ  Quỳnh Nhung', '0838040791 ', 'Doãn Đức Thuận', '2024-10-14 08:45:37', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(566, 'hoàng trung', ' 0986732768', 'Doãn Đức Thuận', '2024-10-14 08:52:13', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(567, 'nguyễn thanh trà', '0928688716', 'Doãn Đức Thuận', '2024-10-14 08:58:45', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(569, 'chử xuân tiến', '0397759699', 'Doãn Đức Thuận', '2024-10-14 09:08:52', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(571, 'trần tuấn anh', '0974165714', 'Doãn Đức Thuận', '2024-10-14 09:37:01', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(572, 'trịnh trung', '0909728383', 'Doãn Đức Thuận', '2024-10-14 09:38:25', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(573, 'Trịnh Thiên Tuấn', '0987881927', 'Doãn Đức Thuận', '2024-10-14 09:40:08', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(574, 'anh Phát', '0902762989', 'Doãn Đức Thuận', '2024-10-14 10:01:08', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(575, 'hải lâm', '0352096653', 'Doãn Đức Thuận', '2024-10-14 10:04:57', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(576, 'anh Thái', '0366355799', 'Doãn Đức Thuận', '2024-10-14 10:24:05', 'Ucall (Lead)', 'Đang cân nhắc suy nghĩ', 'Chưa có đánh giá'),
(577, 'a long', '0933641699', 'Doãn Đức Thuận', '2024-10-14 10:26:20', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(578, 'Quyên', '0903367710', 'Doãn Đức Thuận', '2024-10-16 04:07:08', 'matbao', 'Không nhu cầu', 'Chưa có đánh giá'),
(580, 'điện máy hanyo', '0388889717', 'Doãn Đức Thuận', '2024-10-16 04:08:02', 'Ucall (Lead)', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(581, 'minh phúc', '0903834362', 'Doãn Đức Thuận', '2024-10-16 04:11:49', 'Ucall (Lead)', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(582, 'đưcs tiên', '0905313977', 'Doãn Đức Thuận', '2024-10-16 04:13:06', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(584, 'nguyễn thanh tú', '0982770000', 'Doãn Đức Thuận', '2024-10-16 04:14:32', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(585, 'anh quốc', '0902956247', 'Doãn Đức Thuận', '2024-10-16 04:15:34', 'Ucall (Lead)', 'Đang cân nhắc suy nghĩ', 'Khách hàng mới tiếp xúc'),
(586, 'ngọc tú', '0357997779', 'Doãn Đức Thuận', '2024-10-16 04:18:22', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(587, '0973539397', 'triều nguyễn', 'Doãn Đức Thuận', '2024-10-16 04:19:37', 'Ucall (Lead)', 'Đang cân nhắc suy nghĩ', 'Khách hàng mới tiếp xúc'),
(597, 'Lê Phong', '0707546566', 'Doãn Đức Thuận', '2024-10-16 04:46:38', 'matbao', 'Gọi lại sau', 'Chưa có đánh giá'),
(598, 'Uyên Ly', '0971454486', 'Doãn Đức Thuận', '2024-10-16 04:46:46', 'matbao', 'Gọi lại sau', 'Chưa có đánh giá'),
(600, 'hà duy hiếu', '0975689906', 'Doãn Đức Thuận', '2024-10-16 07:29:16', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(601, 'phương thảo', '0938391768', 'Doãn Đức Thuận', '2024-10-16 07:41:07', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(602, 'mc hoàng lâm', '0909676782', 'Doãn Đức Thuận', '2024-10-16 07:52:55', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(603, 'anh vũ ( mỹ phẩm )', '0384825914', 'Doãn Đức Thuận', '2024-10-16 07:55:14', 'Tự tìm kiếm', 'Không nghe máy', 'Chưa có đánh giá'),
(604, 'nguyễn tình tâm', '0912503006', 'Doãn Đức Thuận', '2024-10-16 07:56:25', 'Google Ads (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(605, 'nguyễn bá lợi', '0588356999', 'Doãn Đức Thuận', '2024-10-16 07:57:57', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(606, 'táo iphone', '0707690000', 'Doãn Đức Thuận', '2024-10-16 08:04:02', 'Tự tìm kiếm', 'Không nhu cầu', 'Chưa có đánh giá'),
(607, 'minh thành', '0346655001', 'Doãn Đức Thuận', '2024-10-16 08:17:15', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(608, 'anh phong', '0988360916', 'Doãn Đức Thuận', '2024-10-16 08:30:09', 'Ucall (Lead)', 'KH tiềm năng', 'Khách hàng mới tiếp xúc'),
(610, 'Anh Cường', '0865142301', 'Doãn Đức Thuận', '2024-10-17 02:13:19', 'matbao', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(611, 'Nguyễn Vũ Thảo Nguyên', '0966729477', 'Doãn Đức Thuận', '2024-10-17 02:17:59', 'matbao', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(612, 'Nguyễn Phúc Lĩnh', '0963139579', 'Doãn Đức Thuận', '2024-10-17 03:03:28', 'matbao', 'Đã gọi và gửi mail', 'Khách hàng tiềm năng'),
(613, 'Anh Trúc', '0912223282', 'Doãn Đức Thuận', '2024-10-17 03:13:00', 'matbao', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(614, 'Chị Nhung', '0357413420', 'Doãn Đức Thuận', '2024-10-17 03:40:44', 'matbao', 'Đã gọi và gửi mail', 'Chưa có đánh giá'),
(615, 'Taxi Thanh Hóa Travel', '0397757557', 'Doãn Đức Thuận', '2024-10-17 03:49:29', 'matbao', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(616, 'quang anh', ' 0903450060', 'Doãn Đức Thuận', '2024-10-17 03:54:31', 'Facebook (Lead)', 'Đang cân nhắc suy nghĩ', 'Chưa có đánh giá'),
(617, 'trần ngân', '0937 316 288', 'Doãn Đức Thuận', '2024-10-17 03:56:39', 'Tự tìm kiếm', 'Đang cân nhắc suy nghĩ', 'Chưa có đánh giá'),
(618, 'Chị Phương', '0945503999', 'Doãn Đức Thuận', '2024-10-17 04:00:27', 'matbao', 'Không nghe máy', 'Chưa có đánh giá'),
(619, 'Thương Nguyễn', '0522991341', 'Doãn Đức Thuận', '2024-10-17 04:04:58', 'matbao', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(620, 'Anh Xuân Trà', '0981357899', 'Doãn Đức Thuận', '2024-10-17 04:11:43', 'matbao', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(621, 'Anh Kiệt', '0976650750', 'Doãn Đức Thuận', '2024-10-17 08:08:52', 'matbao', 'Không nghe máy', 'Chưa có đánh giá'),
(622, 'Nguyễn Hữu Tâm', '0931901646', 'Doãn Đức Thuận', '2024-10-17 08:10:08', 'matbao', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(623, 'Nguyễn Trường', '0909021035', 'Doãn Đức Thuận', '2024-10-17 08:14:43', 'matbao', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(624, 'Trường mầm non Sắc Màu Tuổi Thơ', '0909348566', 'Doãn Đức Thuận', '2024-10-17 08:22:42', 'matbao', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(625, 'tú xương', '0368933413', 'Doãn Đức Thuận', '2024-10-17 08:43:04', 'Tự tìm kiếm', 'Thuê bao/Nhầm số', 'Chưa có đánh giá'),
(626, 'Nguyễn Huyền Linh', '0902210890', 'Doãn Đức Thuận', '2024-10-17 08:46:29', 'matbao', 'Đang cân nhắc suy nghĩ', 'Khách hàng mới tiếp xúc'),
(627, 'Chị Thúy', '0977243100', 'Doãn Đức Thuận', '2024-10-17 08:48:02', 'matbao', 'Không nhu cầu', 'Khách hàng mới tiếp xúc'),
(630, 'tiến đạt', '0987113132', 'Doãn Đức Thuận', '2024-10-17 09:52:57', 'Ucall (Lead)', 'Đang cân nhắc suy nghĩ', 'Chưa có đánh giá'),
(631, 'nguyễn hiền', '0987995448', 'Doãn Đức Thuận', '2024-10-17 09:55:50', 'Ucall (Lead)', 'Đã gọi và gửi mail', 'Khách hàng mới tiếp xúc'),
(632, 'trần tiến duy', '0983397353', 'Doãn Đức Thuận', '2024-10-17 10:00:39', 'Ucall (Lead)', 'Không nhu cầu', 'Chưa có đánh giá'),
(633, 'duy', '0376764077', 'Doãn Đức Thuận', '2024-10-17 10:01:37', 'Ucall (Lead)', 'Không nghe máy', 'Chưa có đánh giá'),
(634, 'quốc bình', '0967210678', 'Doãn Đức Thuận', '2024-10-17 10:04:06', 'Ucall (Lead)', 'Đang cân nhắc suy nghĩ', 'Chưa có đánh giá'),
(635, 'vương', ' 0964599799', 'Doãn Đức Thuận', '2024-10-17 10:18:06', 'Ucall (Lead)', 'Đang cân nhắc suy nghĩ', 'Chưa có đánh giá');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_evaluations`
--

CREATE TABLE `customer_evaluations` (
  `id` int(11) NOT NULL,
  `evaluation_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customer_evaluations`
--

INSERT INTO `customer_evaluations` (`id`, `evaluation_name`) VALUES
(1, 'Chưa có đánh giá'),
(2, 'Khách hàng mới tiếp xúc'),
(3, 'Khách hàng tiềm năng'),
(4, 'Khách hàng cơ hội'),
(5, 'Khách hàng chăm sóc sau bán');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data`
--

CREATE TABLE `data` (
  `data_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `sources_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `data`
--

INSERT INTO `data` (`data_id`, `name`, `phone`, `description`, `user_id`, `status`, `update_at`, `sources_id`) VALUES
(1, 'Quyên', '0903367710', 'cần tư vấn website', 13, 'called', '2024-10-16 10:24:19', 6),
(2, 'Uyên Ly', '0971454486', 'Khách hàng có nhu cầu thiết kế website, ngân sách khoảng 6-7tr', 13, 'called', NULL, 6),
(3, 'Lê Phong', '0707546566', 'Khách hàng muốn làm website giới thiệu nước đóng chai', 13, 'called', NULL, 6),
(4, 'Anh Cường', '0865142301', 'Khách cần 1 website bán hàng. Website khách đang tham khảo: https://www.handyman.vn/', 13, 'called', NULL, 6),
(5, 'Nguyễn Vũ Thảo Nguyên', '0966729477', 'Khách hàng đang muốn dựa vào hồ sơ năng lực của công ty lĩnh vực cơ điện, làm lại 1 website mới hoàn toàn', 13, 'called', NULL, 6),
(6, 'Anh Kiệt', '0976650750', 'Cần Website về giới thiệu công ty', 13, 'called', NULL, 6),
(7, 'Chị Phương', '0945503999', 'Cần Website về vật liệu hoàn thiện', 13, 'called', NULL, 6),
(8, 'Taxi Thanh Hóa Travel', '0397757557', 'Cần làm website Taxi', 13, 'called', NULL, 6),
(9, 'Chị Nhung', '0357413420', 'Cần làm 1 website giới thiệu sản phẩm túi eco. SV làm đồ án tốt nghiệp, chi phí rẻ', 13, 'called', NULL, 6),
(10, 'Nguyễn Phúc Lĩnh', '0963139579', 'Cần làm 1 website giới thiệu về vật tư nông nghiệp, phân bón', 13, 'called', NULL, 6),
(11, 'Thương Nguyễn', '0522991341', 'Cần thiết kế website bán cá', 13, 'called', NULL, 6),
(12, 'Nguyễn Huyền Linh', '0902210890', 'Đang kinh doanh thang máy cần thiết kế website', 13, 'called', NULL, 6),
(13, 'Nguyễn Hữu Tâm', '0931901646', 'Cần thiết kế website cho công ty', 13, 'called', NULL, 6),
(14, 'Trường mầm non Sắc Màu Tuổi Thơ', '0909348566', 'Cần thiết kế lại website cho trường mầm non. ', 13, 'called', NULL, 6),
(15, 'Anh Trúc', '0912223282', 'Cần thiết kế website mảng hotel', 13, 'called', NULL, 6),
(17, 'Nguyễn Trường', '0909021035', 'Cần thiết kế website cho công ty xây dựng', 13, 'called', NULL, 6),
(18, 'Chị Thúy', '0977243100', 'Cần làm website giới thiệu sản phẩm mái che', 13, 'called', NULL, 6),
(19, 'Anh Xuân Trà', '0981357899', 'Cần làm website lĩnh vực hóa chất', 13, 'called', NULL, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_sources`
--

CREATE TABLE `data_sources` (
  `id` int(11) NOT NULL,
  `source_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `data_sources`
--

INSERT INTO `data_sources` (`id`, `source_name`) VALUES
(1, 'Facebook (Lead)'),
(2, 'Ucall (Lead)'),
(3, 'Facebook Ads (Lead)'),
(4, 'Google Ads (Lead)'),
(5, 'Tự tìm kiếm'),
(6, 'matbao');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sale_orders`
--

CREATE TABLE `sale_orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `website_template_link` varchar(255) DEFAULT NULL,
  `service_duration` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','confirmed','deleted') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sale_orders`
--

INSERT INTO `sale_orders` (`id`, `customer_id`, `service_type`, `website_template_link`, `service_duration`, `created_by`, `created_at`, `status`) VALUES
(8, 1, 'Thiết kế website', '123', 12, 2, '2024-09-24 19:18:28', 'pending'),
(9, 2, 'Thiết kế website', 'https://data.vvtek.net/telesale/demo?id=13', 12, 2, '2024-09-25 01:20:47', 'pending'),
(10, 6, 'Thiết kế website', 'https://data.vvtek.net/telesale/demo?id=180', 12, 1, '2024-09-25 06:29:09', 'pending'),
(11, 6, 'Thiết kế website', 'https://data.vvtek.net/telesale/demo?id=180', 12, 1, '2024-09-25 06:30:52', 'pending'),
(12, 5, 'Thiết kế website', 'https://data.vvtek.net/telesale/demo?id=18', 12, 1, '2024-10-15 07:51:41', 'pending'),
(13, 1, 'Thiết kế website', 'https://data.vvtek.net/telesale/demo?id=20', 12, 1, '2024-10-15 07:56:50', 'pending');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `sale_order_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('pending','confirmed','deleted') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tickets`
--

INSERT INTO `tickets` (`id`, `sale_order_id`, `user_id`, `ticket_type_id`, `description`, `created_by`, `created_at`, `updated_at`, `status`) VALUES
(1, 8, 0, 1, '', 2, '2024-09-24 19:18:28', '2024-09-24 19:31:59', 'confirmed'),
(2, 9, 0, 1, 'Cần thiết kế website bán nội thất', 2, '2024-09-25 01:20:47', '2024-09-25 01:21:43', 'confirmed'),
(3, NULL, 11, 1, '1', 1, '2024-09-25 03:30:14', '2024-09-25 04:35:06', 'confirmed'),
(4, 10, 0, 1, 'Dear anh chị, Em có khách hàng cần thiết kế website theo mẫu. Nhờ anh chị hỗ trợ', 1, '2024-09-25 06:29:09', '2024-09-25 06:30:10', 'confirmed'),
(5, 11, 0, 1, 'Dear anh chị, em có khách hàng cần thiết kế website theo mẫu. Nhờ anh chị hỗ trợ ạ', 1, '2024-09-25 06:30:52', '2024-09-25 07:06:43', 'confirmed'),
(6, 12, 0, 1, 'dear anh chị, em có khách hàng có nhu cầu làm web theo mẫu. Anh chị check giúp em', 1, '2024-10-15 07:51:42', '2024-10-15 07:53:29', 'confirmed'),
(7, 13, 0, 1, 'Sitemap: abc, xyz', 1, '2024-10-15 07:56:50', '2024-10-15 07:58:34', 'confirmed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket_logs`
--

CREATE TABLE `ticket_logs` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sender_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ticket_logs`
--

INSERT INTO `ticket_logs` (`id`, `ticket_id`, `message`, `sender_id`, `created_at`) VALUES
(1, 1, 'Thiết kế website', 2, '2024-09-25 01:19:47'),
(2, 2, 'Dear anh chị. Em có khách cần hỗ trợ thiết kế website giống mẫu đã cung cấp trong ticket. Nhờ anh chị hỗ trợ', 2, '2024-09-25 01:23:00'),
(3, 2, 'Dear anh chị,\r\nEm có khách hàng cần hỗ trợ thiết kế website', 2, '2024-09-25 01:49:25'),
(4, 5, 'Hello', 1, '2024-09-25 09:38:37'),
(5, 6, 'https://data.vvtek.net/telesale/demo?id=18\r\nKhách muốn thêm chức năng cổng thanh toán', 1, '2024-10-15 07:54:34'),
(6, 7, 'Abcabc', 1, '2024-10-15 07:59:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `type_name`) VALUES
(1, 'Thiết kế website theo mẫu'),
(2, 'Phân tích và báo giá');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `website_templates`
--

CREATE TABLE `website_templates` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT 4000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `website_templates`
--

INSERT INTO `website_templates` (`id`, `url`, `title`, `image_url`, `price`) VALUES
(11, 'https://6.congtyannhien.com/', 'ĐÔNG Y', 'assets/img/dong-y.png', 4000000),
(12, 'https://7.congtyannhien.com/', 'SHOP 18+', 'assets/img/shop-18+.png', 4000000),
(13, 'https://8.congtyannhien.com/', 'VIET CERAMIC', 'assets/img/vietceramics.png', 9988000),
(14, 'https://9.congtyannhien.com/', 'SHOP BÁN HÀNG', 'assets/img/shop-ban-hang.png', 4000000),
(15, 'https://10.congtyannhien.com/', 'ĐỒ GIA DỤNG', 'assets/img/do-gia-dung.png', 4000000),
(16, 'https://11.congtyannhien.com/', 'ĐỒ GIA DỤNG 2', 'assets/img/do-gia-dung-2.png', 4000000),
(17, 'https://12.congtyannhien.com/', 'SHOPEE ', 'assets/img/shopee.png', 4000000),
(18, 'https://13.congtyannhien.com/', 'SHOP LÀM BÁNH', 'assets/img/shop-lam-banh.png', 4000000),
(19, 'https://14.congtyannhien.com/', 'BÁN SÁCH', 'assets/img/ban-sach.png', 4000000),
(20, 'https://15.congtyannhien.com/', 'NHÀ HÀNG NƯỚNG', 'assets/img/nha-hang-nuong.png', 4000000),
(21, 'https://16.congtyannhien.com/', 'BẤT ĐỘNG SẢN ', 'assets/img/bat-dong-san.png', 4000000),
(22, 'https://17.congtyannhien.com/', 'BẤT ĐỘNG SẢN 2 ', 'assets/img/bat-dong-san-2.png', 4000000),
(23, 'https://18.congtyannhien.com/', 'GIỚI THIỆU CÔNG TY ', 'assets/img/gioi-thieu-cong-ty.png', 4000000),
(24, 'https://19.congtyannhien.com/', 'BẤT ĐỘNG SẢN 3', 'assets/img/bat-dong-san-3.png', 4000000),
(25, 'https://20.congtyannhien.com/', 'BẤT ĐỘNG SẢN VIN', 'assets/img/bat-dong-san-vin.png', 4000000),
(26, 'https://21.congtyannhien.com/', 'BẤT ĐỘNG SẢN 4', 'assets/img/bat-dong-san-4.png', 4000000),
(27, 'https://22.congtyannhien.com/', 'BẤT ĐỘNG SẢN 5', 'assets/img/bat-dong-san-5.png', 4000000),
(28, 'https://23.congtyannhien.com/', 'BẤT ĐỘNG SẢN 6', 'assets/img/bat-dong-san-6.png', 4000000),
(29, 'https://24.congtyannhien.com/', 'BẤT ĐỘNG SẢN 7', 'assets/img/bat-dong-san-7.png', 4000000),
(30, 'https://25.congtyannhien.com/', 'BẤT ĐỘNG SẢN 8', 'assets/img/bat-dong-san-8.png', 4000000),
(31, 'https://26.congtyannhien.com/', 'BẤT ĐỘNG SẢN 9', NULL, 4000000),
(32, 'https://27.congtyannhien.com/', 'BẤT ĐỘNG SẢN 10', NULL, 4000000),
(33, 'https://28.congtyannhien.com/', 'BẤT ĐỘNG SẢN 11', NULL, 4000000),
(34, 'https://29.congtyannhien.com/', 'BẤT ĐỘNG SẢN 12', NULL, 4000000),
(35, 'https://30.congtyannhien.com/', 'BẤT ĐỘNG SẢN 13', NULL, 4000000),
(36, 'https://31.congtyannhien.com/', 'BẤT ĐỘNG SẢN 14', NULL, 4000000),
(37, 'https://32.congtyannhien.com/', 'BẤT ĐỘNG SẢN 15', NULL, 4000000),
(38, 'https://33.congtyannhien.com/', 'BẤT ĐỘNG SẢN 16', NULL, 4000000),
(39, 'https://34.congtyannhien.com/', 'BẤT ĐỘNG SẢN 17', NULL, 4000000),
(40, 'https://35.congtyannhien.com/', 'BẤT ĐỘNG SẢN 18', NULL, 4000000),
(41, 'https://36.congtyannhien.com/', 'BẤT ĐỘNG SẢN 19', NULL, 4000000),
(42, 'https://37.congtyannhien.com/', 'BẤT ĐỘNG SẢN 20', NULL, 4000000),
(43, 'https://38.congtyannhien.com/', 'BẤT ĐỘNG SẢN 21', NULL, 4000000),
(44, 'https://39.congtyannhien.com/', 'BẤT ĐỘNG SẢN 22', NULL, 4000000),
(45, 'https://40.congtyannhien.com/', 'BẤT ĐỘNG SẢN 23', NULL, 4000000),
(46, 'https://41.congtyannhien.com/', 'BẤT ĐỘNG SẢN 24', NULL, 4000000),
(47, 'https://42.congtyannhien.com/', 'BẤT ĐỘNG SẢN 25', NULL, 4000000),
(48, 'https://43.congtyannhien.com/', 'BẤT ĐỘNG SẢN 26', NULL, 4000000),
(49, 'https://44.congtyannhien.com/', 'GIỚI THIỆU CÔNG TY 2', NULL, 4000000),
(50, 'https://45.congtyannhien.com/', 'GIỚI THIỆU CÔNG TY 3', NULL, 4000000),
(51, 'https://46.congtyannhien.com/', 'GIỚI THIỆU CÔNG TY 4', NULL, 4000000),
(52, 'https://47.congtyannhien.com/', 'BẤT ĐỘNG SẢN 27', NULL, 4000000),
(53, 'https://48.congtyannhien.com/', 'BẤT ĐỘNG SẢN 28', NULL, 4000000),
(54, 'https://49.congtyannhien.com/', 'THIẾT KẾ THẺ, BIỂN TÊN ', NULL, 4000000),
(55, 'https://50.congtyannhien.com/', 'BÁN TOUR', NULL, 4000000),
(56, 'https://51.congtyannhien.com/', 'BỌC GHẾ SOFA', NULL, 4000000),
(57, 'https://52.congtyannhien.com/', 'BÁN CAMERA, MÀN HÌNH', NULL, 4000000),
(58, 'https://53.congtyannhien.com/', 'BÁN CAMERA, MÀN HÌNH 2', NULL, 4000000),
(59, 'https://54.congtyannhien.com/', 'BÁN CAFE', NULL, 4000000),
(60, 'https://55.congtyannhien.com/', 'BÁN CÂY XANH ', NULL, 4000000),
(61, 'https://56.congtyannhien.com/', 'SƠN CHỐNG THẤM ', NULL, 4000000),
(62, 'https://57.congtyannhien.com/', 'BÁN PHẦN MỀM ', NULL, 4000000),
(63, 'https://58.congtyannhien.com/', 'VẬN CHUYỂN, CHUYỂN NHÀ', NULL, 4000000),
(64, 'https://59.congtyannhien.com/', 'BÁN THUỐC ', NULL, 4000000),
(65, 'https://60.congtyannhien.com/', 'WEB LÀM QR CODE', NULL, 4000000),
(66, 'https://61.congtyannhien.com', 'TÀI CHÍNH COIN', NULL, 4000000),
(67, 'https://62.congtyannhien.com/', 'DU HỌC XKLĐ', NULL, 4000000),
(68, 'https://63.congtyannhien.com/', 'BÁN MÁY HÀN QUANG', NULL, 4000000),
(69, 'https://64.congtyannhien.com/', 'CTY PHẦN MỀM KẾ TOÁN', NULL, 4000000),
(70, 'https://65.congtyannhien.com/', 'CTY PHÂN BÓN ', NULL, 4000000),
(71, 'https://66.congtyannhien.com/', 'CTY PHẦN MỀM ', NULL, 4000000),
(72, 'https://67.congtyannhien.com/', 'NỘI THẤT ', NULL, 4000000),
(73, 'https://68.congtyannhien.com/', 'DU HỌC XKLĐ 2 ', NULL, 4000000),
(74, 'https://69.congtyannhien.com/', 'VISA', NULL, 4000000),
(75, 'https://70.congtyannhien.com/', 'VISA 2', NULL, 4000000),
(76, 'https://71.congtyannhien.com/', 'WP GỐC ', NULL, 4000000),
(77, 'https://72.congtyannhien.com/', 'CTY NHỰA', NULL, 4000000),
(78, 'https://73.congtyannhien.com/', 'CỬA CUỐN ', NULL, 4000000),
(79, 'https://74.congtyannhien.com/', 'CỬA NHÔM KÍNH', NULL, 4000000),
(80, 'https://75.congtyannhien.com/', 'CỬA NHÔM KÍNH 02', NULL, 4000000),
(81, 'https://76.congtyannhien.com/', 'ĐÁ MỸ NGHỆ ', NULL, 4000000),
(82, 'https://77.congtyannhien.com/', 'ĐÁ PHONG THỦY', NULL, 4000000),
(83, 'https://78.congtyannhien.com/', 'ĐÁ PHONG THỦY 02', NULL, 4000000),
(84, 'https://79.congtyannhien.com/', 'ĐÁ PHONG THỦY 03', NULL, 4000000),
(85, 'https://80.congtyannhien.com/', 'DẠY LÁI XE ', NULL, 4000000),
(86, 'https://81.congtyannhien.com/', 'IN ẤN DECAL', NULL, 4000000),
(87, 'https://82.congtyannhien.com/', 'ĐÈN NĂNG LƯỢNG MẶT TRỜI', NULL, 4000000),
(88, 'https://83.congtyannhien.com/', 'ĐÈN CHÙM', NULL, 4000000),
(89, 'https://84.congtyannhien.com/', 'TRUNG TẤM ĐIỆN LẠNH', NULL, 4000000),
(90, 'https://85.congtyannhien.com/', 'BÁN MÁY TÍNH ĐIỆN THOẠI', NULL, 4000000),
(91, 'https://86.congtyannhien.com/', 'DỊCH VỤ ĐIỆN NƯỚC', NULL, 4000000),
(92, 'https://87.congtyannhien.com/', 'BÁN ĐIỆN THOẠI ', NULL, 4000000),
(93, 'https://88.congtyannhien.com/', 'THẾ GIỚI DI ĐỘNG ', NULL, 4000000),
(94, 'https://89.congtyannhien.com/', 'BÁN ĐIỆN THOẠI 02', NULL, 4000000),
(95, 'https://90.congtyannhien.com/', 'BÁN ĐIỆN THOẠI 03', NULL, 4000000),
(96, 'https://91.congtyannhien.com/', 'THẺ TỪ MÁY IN ', NULL, 4000000),
(97, 'https://92.congtyannhien.com/', 'CÔNG TY ĐIỆN - ĐIỆN TỬ ', NULL, 4000000),
(98, 'https://93.congtyannhien.com/', 'ĐỒ CHƠI Ô TÔ ', NULL, 4000000),
(99, 'https://94.congtyannhien.com/', 'ĐỒ CHƠI Ô TÔ 02', NULL, 4000000),
(100, 'https://95.congtyannhien.com/', 'NỘI THẤT Ô TÔ ', NULL, 4000000),
(101, 'https://96.congtyannhien.com/', 'MUA BÁN NỘI THẤT THANH LÝ', NULL, 4000000),
(102, 'https://97.congtyannhien.com/', 'BÁN XE TẢI ', NULL, 4000000),
(103, 'https://98.congtyannhien.com/', 'BÁN ĐỒNG HỒ ', NULL, 4000000),
(104, 'https://99.congtyannhien.com/', 'ĐỒNG PHỤC TRẺ EM ', NULL, 4000000),
(105, 'https://100.congtyannhien.com/', 'BÁN TOUR DU LỊCH ', NULL, 4000000),
(106, 'https://101.congtyannhien.com/', 'NHÀ HÀNG ', NULL, 4000000),
(107, 'https://102.congtyannhien.com/', 'SHOP MẸ VÀ BÉ', NULL, 4000000),
(108, 'https://103.congtyannhien.com/', 'SHOP MẸ VÀ BÉ 02', NULL, 4000000),
(109, 'https://104.congtyannhien.com/', 'ĐÔNG Y', NULL, 4000000),
(110, 'https://105.congtyannhien.com/', 'SHOP BÁN HÀNG ', NULL, 4000000),
(111, 'https://106.congtyannhien.com/', 'SHOP BÁN HÀNG 02', NULL, 4000000),
(112, 'https://107.congtyannhien.com/', 'SHOP BÁN HÀNG 03', NULL, 4000000),
(113, 'https://108.congtyannhien.com/', 'SHOP BÁN HÀNG 04', NULL, 4000000),
(114, 'https://109.congtyannhien.com/', 'LÀM BÁNH', NULL, 4000000),
(115, 'https://110.congtyannhien.com/', 'BÁN SÁCH', NULL, 4000000),
(116, 'https://111.congtyannhien.com/', 'NHÀ HÀNG NƯỚNG', NULL, 4000000),
(117, 'https://112.congtyannhien.com/', 'BÁN TOUR DU LỊCH ', NULL, 4000000),
(118, 'https://113.congtyannhien.com/', 'BÁN TOUR DU LỊCH ', NULL, 4000000),
(119, 'https://114.congtyannhien.com/', 'BÁN TOUR DU LỊCH ', NULL, 4000000),
(120, 'https://115.congtyannhien.com/', 'BÁN TOUR DU LỊCH ', NULL, 4000000),
(121, 'https://116.congtyannhien.com/', 'BÁN TOUR DU LỊCH ', NULL, 4000000),
(122, 'https://117.congtyannhien.com/', 'BÁN TOUR DU LỊCH ', NULL, 4000000),
(123, 'https://118.congtyannhien.com/', 'TRUNG TÂM HỌC NGHỆ THUẬT', NULL, 4000000),
(124, 'https://119.congtyannhien.com/', 'TRUNG TÂM TIỀNG ANH ', NULL, 4000000),
(125, 'https://120.congtyannhien.com/', 'TRUNG TÂM TIỀNG ANH ', NULL, 4000000),
(126, 'https://121.congtyannhien.com/', 'ĐÀO TẠO', NULL, 4000000),
(127, 'https://122.congtyannhien.com/', 'DẠY TIẾNG ANH', NULL, 4000000),
(128, 'https://123.congtyannhien.com/', 'DẠY TIẾNG ANH', NULL, 4000000),
(129, 'https://124.congtyannhien.com/', 'DẠY TIẾNG ANH', NULL, 4000000),
(130, 'https://125.congtyannhien.com/', 'DẠY TIẾNG ANH', NULL, 4000000),
(131, 'https://126.congtyannhien.com/', 'DẠY TIẾNG ANH', NULL, 4000000),
(132, 'https://127.congtyannhien.com/', 'KHÓA HỌC KINH DOANH ONL', NULL, 4000000),
(133, 'https://128.congtyannhien.com/', 'DẠY TIẾNG NHẬT', NULL, 4000000),
(134, 'https://129.congtyannhien.com/', 'GIAO DIỆN FACEBOOK', NULL, 4000000),
(135, 'https://130.congtyannhien.com/', 'VĂN PHÒNG PHẨM', NULL, 4000000),
(136, 'https://131.congtyannhien.com/', 'BÁN OTO FORD', NULL, 4000000),
(137, 'https://132.congtyannhien.com/', 'BÁN GHẾ MASSAGE', NULL, 4000000),
(138, 'https://133.congtyannhien.com/', 'BÀN GHẾ VĂN PHÒNG', NULL, 4000000),
(139, 'https://134.congtyannhien.com/', 'DỊCH VỤ GIÚP VIỆC NHÀ', NULL, 4000000),
(140, 'https://135.congtyannhien.com/', 'DỊCH VỤ QUẢNG CÁO GOOGLE ADS', NULL, 4000000),
(141, 'https://136.congtyannhien.com/', 'BÁN ĐIỆN THOẠI ', NULL, 4000000),
(142, 'https://137.congtyannhien.com/', 'TRUNG TÂM THỂ HÌNH', NULL, 4000000),
(143, 'https://138.congtyannhien.com/', 'BÁN HẢI SẢN', NULL, 4000000),
(144, 'https://139.congtyannhien.com/', 'BÁN HẠT ĐIỀU', NULL, 4000000),
(145, 'https://140.congtyannhien.com/', 'BÁN HOA TƯƠI', NULL, 4000000),
(146, 'https://141.congtyannhien.com/', 'BÁN HOA TƯƠI', NULL, 4000000),
(147, 'https://142.congtyannhien.com/', 'BÁN + DẠY ĐÀN', NULL, 4000000),
(148, 'https://143.congtyannhien.com/', 'KHÓA HỌC THẨM MỸ', NULL, 4000000),
(149, 'https://144.congtyannhien.com/', 'VĂN HÓA TÂM LINH', NULL, 4000000),
(150, 'https://145.congtyannhien.com/', 'DẠY VÕ', NULL, 4000000),
(151, 'https://146.congtyannhien.com/', 'BÁN ÔTO HYNDAI', NULL, 4000000),
(152, 'https://147.congtyannhien.com/', 'IN ẤN', NULL, 4000000),
(153, 'https://148.congtyannhien.com/', 'IN ẤN', NULL, 4000000),
(154, 'https://149.congtyannhien.com/', 'BÁN THUỐC LÁ ĐIỆN TỬ  IQOS', NULL, 4000000),
(155, 'https://150.congtyannhien.com/', 'BÁN XE TẢI', NULL, 4000000),
(156, 'https://151.congtyannhien.com/', 'DỊCH VỤ KẾ TOÁN', NULL, 4000000),
(157, 'https://152.congtyannhien.com/', 'DỊCH VỤ KẾ TOÁN', NULL, 4000000),
(158, 'https://153.congtyannhien.com/', 'DỊCH VỤ KẾ TOÁN', NULL, 4000000),
(159, 'https://154.congtyannhien.com/', 'ĐẶT PHÒNG DU LỊCH', NULL, 4000000),
(160, 'https://155.congtyannhien.com/', 'ĐẶT PHÒNG DU LỊCH', NULL, 4000000),
(161, 'https://156.congtyannhien.com/', 'ĐẶT PHÒNG DU LỊCH', NULL, 4000000),
(162, 'https://157.congtyannhien.com/', 'ĐẶT PHÒNG DU LỊCH', NULL, 4000000),
(163, 'https://158.congtyannhien.com/', 'DỊCH VỤ CHĂM SÓC SỨC KHỎE', NULL, 4000000),
(164, 'https://159.congtyannhien.com/', 'BÁN GIẤY KHÁM SỨC KHỎE', NULL, 4000000),
(165, 'https://160.congtyannhien.com/', 'BÁN ÔTO KIA', NULL, 4000000),
(166, 'https://161.congtyannhien.com/', 'KIẾN TRÚC', NULL, 4000000),
(167, 'https://162.congtyannhien.com/', 'KHÓA HỌC KIẾN TRÚC', NULL, 4000000),
(168, 'https://163.congtyannhien.com/', 'BÁN EBOOK', NULL, 4000000),
(169, 'https://164.congtyannhien.com/', 'LẮP MẠNG INTERNET FPT', NULL, 4000000),
(170, 'https://165.congtyannhien.com/', 'LẮP MẠNG INTERNET VIETTEL', NULL, 4000000),
(171, 'https://166.congtyannhien.com/', 'BÁN MACBOOK', NULL, 4000000),
(172, 'https://167.congtyannhien.com/', 'BÁN LAPTOP, MÁY ẢNH', NULL, 4000000),
(173, 'https://168.congtyannhien.com/', 'BÁN LAPTOP', NULL, 4000000),
(174, 'https://169.congtyannhien.com/', 'BÁN LINH KIỆN ĐIỆN TỬ', NULL, 4000000),
(175, 'https://170.congtyannhien.com/', 'CÔNG TY LUẬT', NULL, 4000000),
(176, 'https://171.congtyannhien.com/', 'LUẬT SƯ, PHÁP LUẬT', NULL, 4000000),
(177, 'https://172.congtyannhien.com/', 'MẬT ONG', NULL, 4000000),
(178, 'https://173.congtyannhien.com/', 'MÁY LỌC KHÔNG KHÍ', NULL, 4000000),
(179, 'https://174.congtyannhien.com/', 'MÁY LỌC KHÔNG KHÍ 2', NULL, 4000000),
(180, 'https://175.congtyannhien.com/', 'MÁY LỌC NƯỚC', NULL, 4000000),
(181, 'https://176.congtyannhien.com/', 'MÁY LỌC NƯỚC 2', NULL, 4000000),
(182, 'https://177.congtyannhien.com/', 'MÁY PHÁT ĐIỆN', NULL, 4000000),
(183, 'https://178.congtyannhien.com/', 'KEM', NULL, 4000000),
(184, 'https://179.congtyannhien.com/', 'NHỰA MICA', NULL, 4000000),
(185, 'https://180.congtyannhien.com/', 'MITSUBISHI - OTO', NULL, 4000000),
(186, 'https://181.congtyannhien.com/', 'OTO - MERCEDES', NULL, 4000000),
(187, 'https://182.congtyannhien.com/', 'MỸ PHẨM', NULL, 4000000),
(188, 'https://183.congtyannhien.com/', 'MỸ PHẨM 2', NULL, 4000000),
(189, 'https://184.congtyannhien.com/', 'MỸ PHẨM 3 ', NULL, 4000000),
(190, 'https://185.congtyannhien.com/', 'MỸ PHẨM 4', NULL, 4000000),
(191, 'https://186.congtyannhien.com/', 'MỸ PHẨM 5', NULL, 4000000),
(192, 'https://187.congtyannhien.com/', 'MỸ PHẨM 6', NULL, 4000000),
(193, 'https://188.congtyannhien.com/', 'MỸ PHẨM 7', NULL, 4000000),
(194, 'https://189.congtyannhien.com/', 'MỸ PHẨM 8', NULL, 4000000),
(195, 'https://190.congtyannhien.com/', 'MỸ PHẨM 9*', NULL, 4000000),
(196, 'https://191.congtyannhien.com/', 'MỸ PHẨM', NULL, 4000000),
(197, 'https://192.congtyannhien.com/', 'NHÀ HÀNG', NULL, 4000000),
(198, 'https://193.congtyannhien.com/', 'NHÀ HÀNG 1', NULL, 4000000),
(199, 'https://194.congtyannhien.com/', ' NHÀ HÀNG 2', NULL, 4000000),
(200, 'https://195.congtyannhien.com/', 'NHÀ HÀNG 3', NULL, 4000000),
(201, 'https://196.congtyannhien.com/', 'NHA KHOA ', NULL, 4000000),
(202, 'https://197.congtyannhien.com/', 'NHA KHOA 1', NULL, 4000000),
(203, 'https://198.congtyannhien.com/', 'NHA KHOA 2', NULL, 4000000),
(204, 'https://199.congtyannhien.com/', 'CƠ KHÍ ( SỮA CHỮA CƠ KHÍ)', NULL, 4000000),
(205, 'https://200.congtyannhien.com/', 'NỘI THẤT', NULL, 4000000),
(206, 'https://201.congtyannhien.com/', 'ĐỒ NỘI THẤT 1', NULL, 4000000),
(207, 'https://202.congtyannhien.com/', 'ĐỒ NỘI THẤT 2', NULL, 4000000),
(208, 'https://203.congtyannhien.com/', 'ĐỒ NỘI THẤT 3', NULL, 4000000),
(209, 'https://204.congtyannhien.com/', 'NỘI THẤT 1', NULL, 4000000),
(210, 'https://205.congtyannhien.com/', 'NỘI THẤT 2', NULL, 4000000),
(211, 'https://206.congtyannhien.com/', 'NỘI THẤT 3', NULL, 4000000),
(212, 'https://207.congtyannhien.com/', 'NỘI THẤT 4', NULL, 4000000),
(213, 'https://208.congtyannhien.com/', 'NỘI THẤT 5', NULL, 4000000),
(214, 'https://209.congtyannhien.com/', 'ĐỒ NỘI THẤT 4', NULL, 4000000),
(215, 'https://210.congtyannhien.com/', 'ĐỒ NỘI THẤT 5', NULL, 4000000),
(216, 'https://211.congtyannhien.com/', 'NỘI THẤT 6', NULL, 4000000),
(217, 'https://212.congtyannhien.com/', 'NỘI THẤT 7', NULL, 4000000),
(218, 'https://213.congtyannhien.com/', 'ĐỒ NỘI THẤT 6', NULL, 4000000),
(219, 'https://214.congtyannhien.com/', 'ĐỒ NỘI THẤT 7', NULL, 4000000),
(220, 'https://215.congtyannhien.com/', 'ĐỒ NỘI THẤT 8', NULL, 4000000),
(221, 'https://216.congtyannhien.com/', 'ĐỒ NỘI THẤT 9', NULL, 4000000),
(222, 'https://217.congtyannhien.com/', 'ĐỒ NỘI THẤT 10', NULL, 4000000),
(223, 'https://218.congtyannhien.com/', 'ĐỒ NỘI THẤT 11', NULL, 4000000),
(224, 'https://219.congtyannhien.com/', 'ĐỒ NỘI THẤT 12', NULL, 4000000),
(225, 'https://220.congtyannhien.com/', 'NỘI THẤT 8', NULL, 4000000),
(226, 'https://221.congtyannhien.com/', 'Nội thất', NULL, 4000000),
(227, 'https://222.congtyannhien.com/', 'Nội thất', NULL, 4000000),
(228, 'https://223.congtyannhien.com/', 'Nón bảo hiểm', NULL, 4000000),
(229, 'https://224.congtyannhien.com/', 'Nông sản ( hạt, quế, hồi )', NULL, 4000000),
(230, 'https://225.congtyannhien.com/', 'Nông sản dừa', NULL, 4000000),
(231, 'https://226.congtyannhien.com/', 'Nông sản ( rau củ quả )', NULL, 4000000),
(232, 'https://227.congtyannhien.com', 'Thu mua phế liệu', NULL, 4000000),
(233, 'https://228.congtyannhien.com/', 'Phụ kiện Bi-A', NULL, 4000000),
(234, 'https://229.congtyannhien.com/', 'Spa ( phun săm )', NULL, 4000000),
(235, 'https://230.congtyannhien.com/', 'Bán Rượu', NULL, 4000000),
(236, 'https://231.congtyannhien.com/', 'Sang nhượng mặt bằng cafe', NULL, 4000000),
(237, 'https://232.congtyannhien.com/', 'Sang nhượng mặt bằng', NULL, 4000000),
(238, 'https://233.congtyannhien.com/', 'Sàn gỗ', NULL, 4000000),
(239, 'https://234.congtyannhien.com/', 'Sắt mỹ nghệ', NULL, 4000000),
(240, 'https://235.congtyannhien.com/', 'Máy cơ khí', NULL, 4000000),
(241, 'https://236.congtyannhien.com/', 'Shop bán giày nam', NULL, 4000000),
(242, 'https://237.congtyannhien.com/', 'Shop bán giày Nữ', NULL, 4000000),
(243, 'https://238.congtyannhien.com/', 'Shop bán vải', NULL, 4000000),
(244, 'https://239.congtyannhien.com/', 'Dịch vụ sinh trắc vân tay', NULL, 4000000),
(245, 'https://240.congtyannhien.com/', 'Dịch vụ sơn sửa nhà', NULL, 4000000),
(246, 'https://241.congtyannhien.com/', 'Spa', NULL, 4000000),
(247, 'https://242.congtyannhien.com/', 'Spa', NULL, 4000000),
(248, 'https://243.congtyannhien.com/', 'Spa', NULL, 4000000),
(249, 'https://244.congtyannhien.com/', 'Spa', NULL, 4000000),
(250, 'https://245.congtyannhien.com/', 'Spa', NULL, 4000000),
(251, 'https://246.congtyannhien.com/', 'Spa', NULL, 4000000),
(252, 'https://247.congtyannhien.com/', 'Sửa điện thoại', NULL, 4000000),
(253, 'https://248.congtyannhien.com/', 'Tổ chức sự kiện', NULL, 4000000),
(254, 'https://249.congtyannhien.com/', 'Event', NULL, 4000000),
(255, 'https://250.congtyannhien.com/', 'Giáo viên vượt khó', NULL, 4000000),
(256, 'https://251.congtyannhien.com/', 'Sự kiện âm nhạc', NULL, 4000000),
(257, 'https://252.congtyannhien.com/', 'Taxi', NULL, 4000000),
(258, 'https://253.congtyannhien.com/', 'Thám Tử', NULL, 4000000),
(259, 'https://254.congtyannhien.com/', 'Thanh lý', NULL, 4000000),
(260, 'https://255.congtyannhien.com/', 'Thanh lý', NULL, 4000000),
(261, 'https://256.congtyannhien.com/', 'Thanh lý', NULL, 4000000),
(262, 'https://257.congtyannhien.com/', 'Thiệp cưới', NULL, 4000000),
(263, 'https://258.congtyannhien.com/', 'Thiết kế web', NULL, 4000000),
(264, 'https://259.congtyannhien.com/', 'Shop thời trang nữ', NULL, 4000000),
(265, 'https://260.congtyannhien.com/', 'Shop thời trang nam', NULL, 4000000),
(266, 'https://261.congtyannhien.com/', 'Shop thời trang baby', NULL, 4000000),
(267, 'https://262.congtyannhien.com/', 'Shop thời trang nữ', NULL, 4000000),
(268, 'https://263.congtyannhien.com/', 'Shop thời trang baby', NULL, 4000000),
(269, 'https://264.congtyannhien.com/', 'Shop thời trang nữ', NULL, 4000000),
(270, 'https://265.congtyannhien.com/', 'Sho thời trang nam', NULL, 4000000),
(271, 'https://266.congtyannhien.com/', 'Thực phẩm ( hạt )', NULL, 4000000),
(272, 'https://267.congtyannhien.com/', 'Thực phẩm ( rau, củ, quả )', NULL, 4000000),
(273, 'https://268.congtyannhien.com/', 'Đông y', NULL, 4000000),
(274, 'https://269.congtyannhien.com/', 'Thực phẩm chức năng', NULL, 4000000),
(275, 'https://270.congtyannhien.com/', 'Thực phẩm chức năng', NULL, 4000000),
(276, 'https://271.congtyannhien.com/', 'THỰC PHẨM CHỨC NĂNG ', NULL, 4000000),
(277, 'https://272.congtyannhien.com/', 'BÁN NGHỆ TÂY ', NULL, 4000000),
(278, 'https://273.congtyannhien.com/', 'THỰC PHẨM CHỨC NĂNG ', NULL, 4000000),
(279, 'https://274.congtyannhien.com/', 'THỰC PHẨM CHỨC NĂNG ', NULL, 4000000),
(280, 'https://275.congtyannhien.com/', 'THỰC PHẨM CHỨC NĂNG ', NULL, 4000000),
(281, 'https://276.congtyannhien.com/', 'THỰC PHẨM CHỨC NĂNG ', NULL, 4000000),
(282, 'https://277.congtyannhien.com/', 'THỰC PHẨM CHỨC NĂNG ', NULL, 4000000),
(283, 'https://278.congtyannhien.com/', 'CỦA HÀNG MỸ PHẨM ', NULL, 4000000),
(284, 'https://279.congtyannhien.com/', 'CỦA HÀNG MỸ PHẨM ', NULL, 4000000),
(285, 'https://280.congtyannhien.com/', 'SHOP THÚ CƯNG', NULL, 4000000),
(286, 'https://281.congtyannhien.com/', 'DỊCH VỤ CHO THUÊ XE', NULL, 4000000),
(287, 'https://282.congtyannhien.com/', 'DỊCH VỤ CHO THUÊ XE', NULL, 4000000),
(288, 'https://283.congtyannhien.com/', 'DỊCH VỤ CHO THUÊ XE', NULL, 4000000),
(289, 'https://284.congtyannhien.com/', 'DỊCH VỤ CHO THUÊ XE MÁY ', NULL, 4000000),
(290, 'https://285.congtyannhien.com/', 'ĐÔNG Y ', NULL, 4000000),
(291, 'https://286.congtyannhien.com/', 'ĐÔNG  Y ', NULL, 4000000),
(292, 'https://287.congtyannhien.com/', 'ĐÔNG  Y ', NULL, 4000000),
(293, 'https://288.congtyannhien.com/', 'TIN TỨC BÓNG ĐÁ ', NULL, 4000000),
(294, 'https://289.congtyannhien.com/', 'TIN TỨC ', NULL, 4000000),
(295, 'https://290.congtyannhien.com/', 'TIN TỨC ĐẢNG ', NULL, 4000000),
(296, 'https://291.congtyannhien.com/', 'TIN TỨC ĐẠO', NULL, 4000000),
(297, 'https://292.congtyannhien.com/', 'TIN TỨC ĐẠO', NULL, 4000000),
(298, 'https://293.congtyannhien.com/', 'TIN TỨC ĐẠO', NULL, 4000000),
(299, 'https://294.congtyannhien.com/', 'TIN TỨC NHÀ ĐẤT', NULL, 4000000),
(300, 'https://295.congtyannhien.com', 'FORM LỖI ', NULL, 4000000),
(301, 'https://296.congtyannhien.com/', 'FORM LỖI ', NULL, 4000000),
(302, 'https://297.congtyannhien.com/', 'FORM LỖI ', NULL, 4000000),
(303, 'https://298.congtyannhien.com/', 'FORM LỖI ', NULL, 4000000),
(304, 'https://299.congtyannhien.com', 'FORM LỖI ', NULL, 4000000),
(305, 'https://300.congtyannhien.com/', 'TRẠI  CHÓ ', NULL, 4000000),
(306, 'https://301.congtyannhien.com/', 'ĐÀO TẠO TRANG ĐIỂM', NULL, 4000000),
(307, 'https://302.congtyannhien.com/', 'BÁN TRANH GỖ', NULL, 4000000),
(308, 'https://303.congtyannhien.com/', 'BÁN CHÈ ', NULL, 4000000),
(309, 'https://304.congtyannhien.com/', 'BÁN TƯỢNG ĐÁ', NULL, 4000000),
(310, 'https://305.congtyannhien.com/', 'TUYỂN DỤNG', NULL, 4000000),
(311, 'https://306.congtyannhien.com/', 'BÁN VAPE', NULL, 4000000),
(312, 'https://307.congtyannhien.com/', 'TẤM ỐP NHỰA', NULL, 4000000),
(313, 'https://308.congtyannhien.com/', 'VAY TIỀN', NULL, 4000000),
(314, 'https://309.congtyannhien.com/', 'BÁN VÉ MÁY BAY', NULL, 4000000),
(315, 'https://310.congtyannhien.com/', 'DỊCH VỤ VỆ SINH', NULL, 4000000),
(316, 'https://311.congtyannhien.com/', 'DỊCH VỤ VỆ SINH', NULL, 4000000),
(317, 'https://312.congtyannhien.com/', 'GIẢI PHÁP DOANH NGHIỆP VIETTEL', NULL, 4000000),
(318, 'https://313.congtyannhien.com/', 'GIẢI PHÁP DOANH NGHIỆP VIETTEL', NULL, 4000000),
(319, 'https://314.congtyannhien.com/', 'LÀM THẺ VISA', NULL, 4000000),
(320, 'https://315.congtyannhien.com/', 'VÕ PHỤC', NULL, 4000000),
(321, 'https://316.congtyannhien.com/', 'THIẾT KẾ NỘI THẤT', NULL, 4000000),
(322, 'https://317.congtyannhien.com/', 'XÂY DỰNG', NULL, 4000000),
(323, 'https://318.congtyannhien.com/', 'THIẾT KẾ NỘI THẤT', NULL, 4000000),
(324, 'https://319.congtyannhien.com/', 'THIẾT KẾ HỒ CÁ KOI', NULL, 4000000),
(325, 'https://320.congtyannhien.com/', 'XÂY DỰNG', NULL, 4000000),
(326, 'https://321.congtyannhien.com/', 'XÂY DỰNG', NULL, 4000000),
(327, 'https://323.congtyannhien.com/', 'BÁN YẾN SÀO', NULL, 4000000),
(328, 'https://324.congtyannhien.com/', 'XÂY DỰNG', NULL, 4000000),
(329, 'https://328.congtyannhien.com/', 'BÁN ĐIỆN THOẠI ', NULL, 4000000),
(330, 'https://329.congtyannhien.com/', 'THIẾT KẾ, MARKETING', NULL, 4000000),
(331, 'https://12.congtyannhien.com/', 'SHOPEE ', 'assets/img/shopee.png', 4000000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `contact_statuses`
--
ALTER TABLE `contact_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_phone_number` (`phone_number`);

--
-- Chỉ mục cho bảng `customer_evaluations`
--
ALTER TABLE `customer_evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sources_id` (`sources_id`);

--
-- Chỉ mục cho bảng `data_sources`
--
ALTER TABLE `data_sources`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sale_orders`
--
ALTER TABLE `sale_orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ticket_logs`
--
ALTER TABLE `ticket_logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `website_templates`
--
ALTER TABLE `website_templates`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `contact_statuses`
--
ALTER TABLE `contact_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=637;

--
-- AUTO_INCREMENT cho bảng `customer_evaluations`
--
ALTER TABLE `customer_evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `data`
--
ALTER TABLE `data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `data_sources`
--
ALTER TABLE `data_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `sale_orders`
--
ALTER TABLE `sale_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `ticket_logs`
--
ALTER TABLE `ticket_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `website_templates`
--
ALTER TABLE `website_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `data`
--
ALTER TABLE `data`
  ADD CONSTRAINT `data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `data_ibfk_2` FOREIGN KEY (`sources_id`) REFERENCES `data_sources` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
