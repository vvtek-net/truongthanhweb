<?php
include('config/db_connection.php');

// Kiểm tra nếu có slug được truyền vào
if (isset($_GET['slug'])) {
    $slug = $conn->real_escape_string($_GET['slug']);
    
    // Tăng lượt xem
    $update_views = "UPDATE news SET views = views + 1 WHERE slug = '$slug'";
    $conn->query($update_views);
    
    // Lấy thông tin chi tiết của bài viết
    $sql = "SELECT id, title, content, post_time, views FROM news WHERE slug = '$slug'";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $news = $result->fetch_assoc();
        $id = $news['id']; // Lưu id của bài viết để sử dụng trong các phần khác
        
        // Lưu ID bài viết vào session để theo dõi các bài viết đã đọc
        session_start();
        if (!isset($_SESSION['recently_viewed'])) {
            $_SESSION['recently_viewed'] = [];
        }
        // Thêm ID bài viết hiện tại vào đầu danh sách
        array_unshift($_SESSION['recently_viewed'], $id);
        // Loại bỏ các bài viết trùng lặp
        $_SESSION['recently_viewed'] = array_unique($_SESSION['recently_viewed']);
        // Giới hạn số lượng bài viết trong danh sách (ví dụ: 5)
        $_SESSION['recently_viewed'] = array_slice($_SESSION['recently_viewed'], 0, 5);
        
        // Lấy danh sách bài viết liên quan (ví dụ: lấy ngẫu nhiên 5 bài khác không trùng với bài hiện tại)
        $related_sql = "SELECT id, title, slug FROM news WHERE id != $id ORDER BY RAND() LIMIT 5";
        $related_result = $conn->query($related_sql);
        
    } else {
        echo "Bài viết không tồn tại.";
        exit();
    }
} else {
    echo "Không có slug được cung cấp.";
    exit();
}
?>

<!doctype html>
<html lang="vi">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="keywords"
    content="Thiết Kế Website, thiết kế website, website trọn gói, thiết kế website trọn gói" />
  <meta name="google-site-verification" content="lvz5b_pEG1Ec-ihwjG1Y27Lue4YPQECITkn6S_6w2-4" />
  <meta name="description" content="TruongThanhWeb cung cấp dịch vụ thiết kế website chuyên nghiệp, chuẩn SEO và trọn gói, cùng với các giải pháp tối ưu hóa tốc độ và quản trị website, giúp doanh nghiệp tăng cường hiệu quả kinh doanh trực tuyến.">

  <title><?php echo strip_tags($news['title']); ?></title>
  <link href="//fonts.googleapis.com/css2?family=Hind+Siliguri:wght@400;500;600;700&display=swap"
    rel="stylesheet">
  <!-- Thêm favicon -->
  <link rel="icon" href="assets/icon/favicon.ico" type="image/x-icon">
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style-starter.css">
  <link rel="stylesheet" href="assets/css/body.css">
</head>

<body>
    <style>
        /* CSS cho sidebar sticky */
        .sidebar {
            position: -webkit-sticky; /* For Safari */
            position: sticky;
            top: 90px; /* Khoảng cách từ đỉnh màn hình khi cuộn */
        }
    </style>
  <!--header-->
  <div class="header-w3l">
    <!-- header -->
    <?php
    include('includes/header.php');
    ?>
  </div>
  <!--/breadcrumb-bg-->
  <div class="breadcrumb-bg w3l-inner-page-breadcrumb py-5">
    <div class="container pt-lg-5 pt-md-3 p-lg-4 pb-md-3 my-lg-3">
      <h2 class="title pt-5">Tin Tức</h2>
      <ul class="breadcrumbs-custom-path mt-3 text-center">
        <li><a href="index.html">Trang chủ</a></li>
        <li class="active"><span class="fa fa-arrow-right mx-2" aria-hidden="true"></span> Tin Tức </li>
      </ul>
    </div>
  </div>
  <!--//breadcrumb-bg-->
  <!-- banner bottom shape -->
  <div class="position-relative">
    <div class="shape overflow-hidden">
      <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
      </svg>
    </div>
  </div>
  <!-- banner bottom shape -->

<!-- Body -->
<section class="w3l-serices-6 py-5" id="services1">
    <div class="container py-lg-5 py-md-4 py-2">
        <div class="row">
            <!-- Nội dung chính -->
            <div class="col-lg-8">
                <div class="title-content">
                    <h3 class="title-w3l mb-4 pb-2"><?php echo $news['title']; ?></h3>
                    <p>Đăng ngày: <?php echo date("d/m/Y H:i", strtotime($news['post_time'])); ?> | Lượt đọc: <?php echo $news['views']; ?></p>
                </div>
                <div class="news-content mt-lg-4">
                    <?php echo nl2br($news['content']); ?>
                </div>
            </div>
            
            <!-- Sidebar -->
            <div class="col-lg-4">
                <div class="sidebar">
                    <h4>Bài viết vừa đọc</h4>
                    <ul>
                        <?php
                        if (!empty($_SESSION['recently_viewed'])) {
                            foreach ($_SESSION['recently_viewed'] as $recent_id) {
                                if ($recent_id != $id) { // Không hiển thị bài viết hiện tại
                                    $recent_sql = "SELECT id, title FROM news WHERE id = $recent_id";
                                    $recent_result = $conn->query($recent_sql);
                                    if ($recent_result->num_rows > 0) {
                                        $recent_news = $recent_result->fetch_assoc();
                                        echo '<li><a href="chi-tiet-tin.php?id=' . $recent_news['id'] . '">' . $recent_news['title'] . '</a></li>';
                                    }
                                }
                            }
                        }
                        ?>
                    </ul>

                    <h4>Bài viết liên quan</h4>
                    <ul>
                        <?php
                        if ($related_result->num_rows > 0) {
                            while ($related_news = $related_result->fetch_assoc()) {
                                echo '<li><a href="chi-tiet-tin.php?id=' . $related_news['id'] . '">' . $related_news['title'] . '</a></li>';
                            }
                        }
                        ?>
                    </ul>
                </div>
            </div>
            <!-- Sidebar -->


        </div>
    </div>
</section>
<!-- /Body -->

<?php include('includes/footer.php'); ?>
<!-- //footer -->
<!-- Template JavaScript -->
<script src="assets/js/jquery-3.3.1.min.js"></script>
<script src="assets/js/theme-change.js"></script>

<!-- disable body scroll when navbar is active -->
<script>
    $(function() {
        $('.navbar-toggler').click(function() {
            $('body').toggleClass('noscroll');
        });
    });
</script>

<!--/MENU-JS-->
<script>
    $(window).on("scroll", function() {
        var scroll = $(window).scrollTop();
        if (scroll >= 80) {
            $("#site-header").addClass("nav-fixed");
        } else {
            $("#site-header").removeClass("nav-fixed");
        }
    });

    // Main navigation Active Class Add Remove
    $(".navbar-toggler").on("click", function() {
        $("header").toggleClass("active");
    });
    $(document).on("ready", function() {
        if ($(window).width() > 991) {
            $("header").removeClass("active");
        }
        $(window).on("resize", function() {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
        });
    });
</script>
<script src="assets/js/bootstrap.min.js"></script>

</body>
</html>
