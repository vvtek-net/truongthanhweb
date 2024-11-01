<?php

include('config/db_connection.php');
// Lấy URL của website dựa trên ID được truyền từ trang trước
$id = $_GET['id'];
$sql = "SELECT * FROM website_templates WHERE id=$id";
$result = $conn->query($sql);
$url = '';
$title = '';

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $url = $row['url'];
    $title = $row['title'];
} else {
    echo "Website không tìm thấy!";
    exit();
}
//Lấy phân loại mẫu website
$sql = "SELECT * FROM website_templates where id = $id";
$result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xem giao diện - <?php echo $title; ?></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="assets/css/tags.css">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
            font-family: Arial, sans-serif;
            background-color: gray;
        }
        .iframe-wrapper {
            padding: 15px; /* Tạo khoảng cách 5px đều cho các cạnh */
            background: #f0f0f0; /* Màu nền tùy chọn để nhìn thấy khoảng cách */
            border-radius: 10px; /* Bo góc cho cả khung chứa */
            }

            iframe {
                width: 100%;
                height: 100%;
                border: none;
                border-radius: 5px; /* Bo góc bên trong */
                transition: all 0.5s ease;
            }

        #menu {
            position: fixed;
            top: 0;
            width: 100%;
            background-color: #fff;
            padding: 10px 20px;
            text-align: center;
            z-index: 1000;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        #menu .left-section, #menu .right-section {
            display: flex;
            align-items: center;
        }
        #menu button {
            background-color: transparent;
            color: #000;
            padding: 10px 20px;
            margin: 0 5px;
            border: none;
            cursor: pointer;
            font-size: 20px;
        }
        #menu button i {
            color: red;
        }
        #menu button:hover i {
            color: #2caee2;
        }
        #iframe-container {
            position: absolute;
            top: 65px;
            bottom: 0;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .btn-register {
            background-color: #2caee2;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
            margin-left: 10px;
            margin-right: 30px;
        }
        .btn-register:hover {
            background-color: #1b8eb8;
        }
    </style>
    <script>
        function detectDevice() {
            const width = window.innerWidth;
            if (width <= 767) {
                return 'phone';
            } else if (width >= 768 && width <= 1024) {
                return 'tablet';
            } else {
                return 'desktop';
            }
        }

        function setIframeSize(size) {
            const iframe = document.getElementById('preview-frame');
            if (size === 'phone') {
                iframe.style.width = '375px';
                iframe.style.height = '667px';
            } else if (size === 'tablet') {
                iframe.style.width = '768px';
                iframe.style.height = '1024px';
            } else {
                iframe.style.width = '100%';
                iframe.style.height = '100%';
            }
            iframe.style.margin = 'auto';
        }

        window.onload = function() {
            const deviceType = detectDevice();
            setIframeSize(deviceType);
        };
    </script>
</head>
<body>
<div id="menu">
    <div class="left-section">
        <!-- Logo -->
        <a class="navbar-brand" href="index.html">
            <img src="assets/images/logo.png" alt="Your logo" title="Your logo" style="height:50px; max-width: 200px;" />
        </a>
    </div>

    <div class="mid-section">
        <!-- Phân loại mẫu website -->
        <?php
        if (mysqli_num_rows($result) > 0) {
            
            while ($row = mysqli_fetch_assoc($result)) {
                // Hiển thị tiêu đề của mẫu website kèm phân loại
                if ($row['price'] < 5000000) {
                    echo $row['title'] . '<span class="version-theme-co-ban" style="font-size: 14px; margin-left: 20px;">Cơ bản</span>';
                } elseif ($row['price'] >= 5000000 && $row['price'] < 7000000) {
                    echo $row['title'] . '<span class="version-theme-tieu-chuan" style="font-size: 14px; margin-left: 20px;">Tiêu chuẩn</span>';
                } elseif ($row['price'] > 9000000) {
                    echo $row['title'] . '<span class="version-theme-cao-cap" style="font-size: 16px; margin-left: 20px;"><i class="fa-solid fa-crown" style="font-size: 13px"></i> Cao cấp</span>';
                }
            }
        }
        ?>
    </div>

    <div class="right-section">
        <!-- Nút điều chỉnh kích thước thiết bị -->
        <button onclick="setIframeSize('phone')" title="Điện thoại"><i class="fas fa-mobile-alt"></i></button>
        <button onclick="setIframeSize('tablet')" title="Máy tính bảng"><i class="fas fa-tablet-alt"></i></button>
        <button onclick="setIframeSize('desktop')" title="Desktop"><i class="fas fa-desktop"></i></button>
        <span style="margin-left: 20px;">Mã giao diện: <?php echo $id; ?></span>
        <!-- Nút Đăng ký ngay -->
        <a href="lien-he.php?mau-web=<?php echo $id; ?>" class="btn-register">Đăng ký ngay</a>
    </div>
</div>


    <div id="iframe-container">
        <?php if ($url): ?>
            <iframe id="preview-frame" src="<?= $url ?>"></iframe>
        <?php endif; ?>
    </div>
</body>
</html>
