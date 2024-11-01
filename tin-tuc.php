<?php
include('config/db_connection.php');

// Lấy danh sách tin tức từ database
$sql = "SELECT id, title, slug, summary, post_time, views, thumbnail FROM news ORDER BY post_time DESC";
$result = $conn->query($sql);

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

  <title>Liên Hệ - TruongThanhWeb - Thiết Kế Website Trọn Gói</title>
  <link href="//fonts.googleapis.com/css2?family=Hind+Siliguri:wght@400;500;600;700&display=swap"
    rel="stylesheet">
    <!-- Thêm favicon -->
    <link rel="icon" href="assets/icon/favicon.ico" type="image/x-icon">
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style-starter.css">
  <link rel="stylesheet" href="assets/css/body.css">
</head>

<body>
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
        <div class="title-content text-center">
            <h3 class="title-w3l mb-sm-5 mb-4 pb-sm-o pb-2 text-center" style="color: #2caee2;">Bảng tin tức</h3>
        </div>
                    <div class="grids-area-hny text-center row mt-lg-4">
                <?php
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo '<div class="col-lg-4 col-md-6 mb-4">';
                        echo '  <div class="card h-100">'; // Thêm lớp `h-100` để các thẻ card có chiều cao cố định
                        echo '    <img src="' . $row["thumbnail"] . '" class="card-img-top" alt="Thumbnail" style="width: 100%; height: 200px; object-fit: cover;">';
                        echo '    <div class="card-body d-flex flex-column justify-content-between">';
                        echo '      <h5 class="card-title"><a href="' . $row["slug"] . '">' . $row["title"] . '</a></h5>';
                        echo '      <p class="card-text">' . substr($row["summary"], 0, 50) . '</p>';
                        echo '      <small>Đăng ngày: ' . date("d/m/Y H:i", strtotime($row["post_time"])) . ' | Lượt đọc: ' . $row["views"] . '</small>';
                        echo '    </div>';
                        echo '  </div>';
                        echo '</div>';
                    }
                } else {
                    echo '<p>Không có bài viết nào để hiển thị.</p>';
                }
                ?>
            </div>

    </div>
</section>
<!-- /Body -->

<?php
  include('includes/footer.php');
  ?>
  <!-- //footer -->
  <!-- //copyright -->
  <!--//footer-->
  <!-- Template JavaScript -->
  <script src="assets/js/jquery-3.3.1.min.js"></script>
  <script src="assets/js/theme-change.js"></script>

  <!-- disable body scroll which navbar is in active -->
  <script>
    $(function() {
      $('.navbar-toggler').click(function() {
        $('body').toggleClass('noscroll');
      })
    });
  </script>
  <!-- disable body scroll which navbar is in active -->

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

    //Main navigation Active Class Add Remove
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
  <!--//MENU-JS-->


  <script src="assets/js/bootstrap.min.js"></script>

</body>

</html>