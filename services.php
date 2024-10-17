<?php
include('config/db_connection.php');

// Xác định số dòng tối đa trên mỗi trang
$limit = 12;

// Xác định trang hiện tại (mặc định là trang 1 nếu không có giá trị trong URL)
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$start = ($page - 1) * $limit;

// Đếm tổng số dòng dữ liệu trong bảng website_templates
$sql_count = "SELECT COUNT(*) AS total FROM website_templates";
$result_count = mysqli_query($conn, $sql_count);
$row_count = mysqli_fetch_assoc($result_count);
$total = $row_count['total'];

// Tính tổng số trang
$total_pages = ceil($total / $limit);

// Truy vấn dữ liệu với phân trang (giới hạn 12 dòng mỗi trang)
$sql = "SELECT * FROM website_templates LIMIT $start, $limit";
$result = mysqli_query($conn, $sql);

?>
<!doctype html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="keywords"
    content="Medick Responsive web template, Bootstrap Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
  <title>Medick Medical Category Bootstrap Responsive Web Template | Services :: W3Layouts </title>
  <link href="//fonts.googleapis.com/css2?family=Hind+Siliguri:wght@400;500;600;700&display=swap"
    rel="stylesheet">
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style-starter.css">
</head>

<body>
  <!--header-->
  <div class="header-w3l">
    <!-- header -->
    <?php
  include('includes/header.php');
  ?>
  </div>
  <!-- //header -->
  <!--/breadcrumb-bg-->
  <div class="breadcrumb-bg w3l-inner-page-breadcrumb py-5">
    <div class="container pt-lg-5 pt-md-3 p-lg-4 pb-md-3 my-lg-3">
      <h2 class="title pt-5">Mẫu Website Trọn Gói</h2>
      <ul class="breadcrumbs-custom-path mt-3 text-center">
        <li><a href="index.html">Trang chủ</a></li>
        <li class="active"><span class="fa fa-arrow-right mx-2" aria-hidden="true"></span> Mẫu Website </li>
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
   <!--/serices-6-->
   <section class="w3l-serices-6 py-5" id="services1">
    <div class="container py-lg-5 py-md-4 py-2">
      <div class="title-content text-center">
        <h3 class="title-w3l mb-sm-5 mb-4 pb-sm-o pb-2 text-center" style="color: #2caee2;">Mẫu website</h3>
      </div>
      <div class="grids-area-hny text-center row mt-lg-4">

      <!-- Hiển thị dữ liệu từ bảng website_templates -->
      <?php
      if (mysqli_num_rows($result) > 0) {
          while ($row = mysqli_fetch_assoc($result)) {
              ?>
              <div class="col-lg-4 col-md-6 grids-feature">
                <div class="area-box icon-blue">
                    <!-- Sửa thành image_url trong database -->
                    <a href="#"> <img src="<?php echo $row['image_url']; ?>" alt="" class="img-fluid radius-image"></a>
                    <!-- Sửa thành title trong database -->
                    <h4><a href="#feature" class="title-head"><?php echo $row['title']; ?></a></h4>
                    <!--/des-->
                    <div class="w3doctor-box-bottom">
                      <!-- Sửa thành price trong database -->
                      <div class="doctor-phone"><p><?php echo number_format($row['price'], 0, ',', '.'); ?> VND</p></div>
                    </div>
                  <!--//des-->
                </div>
              </div>
              <?php
          }
      } else {
          echo "Không có dữ liệu.";
      }
      ?>

      </div>

     <!-- Phân trang -->
<div class="pagination mt-4">
  <ul class="pagination justify-content-center">
    <?php
    // Nút "Trước"
    if ($page > 1) {
        echo '<li class="page-item"><a class="page-link" href="services.php?page=' . ($page - 1) . '">Trước</a></li>';
    }

    // Hiển thị nút 1 và dấu "..." nếu trang hiện tại lớn hơn 4
    if ($page > 4) {
        echo '<li class="page-item"><a class="page-link" href="services.php?page=1">1</a></li>';
        if ($page > 5) {
            echo '<li class="page-item"><span class="page-link">...</span></li>';
        }
    }

    // Hiển thị các trang từ (page-3) đến (page+3)
    for ($i = max(1, $page - 3); $i <= min($total_pages, $page + 3); $i++) {
        if ($i == $page) {
            echo '<li class="page-item active"><span class="page-link">' . $i . '</span></li>';
        } else {
            echo '<li class="page-item"><a class="page-link" href="services.php?page=' . $i . '">' . $i . '</a></li>';
        }
    }

    // Hiển thị dấu "..." và nút trang cuối nếu còn các trang sau trang hiện tại
    if ($page < $total_pages - 3) {
        if ($page < $total_pages - 4) {
            echo '<li class="page-item"><span class="page-link">...</span></li>';
        }
        echo '<li class="page-item"><a class="page-link" href="services.php?page=' . $total_pages . '">' . $total_pages . '</a></li>';
    }

    // Nút "Sau"
    if ($page < $total_pages) {
        echo '<li class="page-item"><a class="page-link" href="services.php?page=' . ($page + 1) . '">Sau</a></li>';
    }
    ?>
  </ul>
</div>


    </div>
  </section>
  <!--//services-6-->
  <!-- footer -->
  <?php
  include('includes/footer.php');
  ?>
  <!-- //footer -->

  <!-- copyright -->
  <section class="w3l-copyright">
    <div class="container">
      <div class="row bottom-copies">
        <p class="col-lg-8 copy-footer-29">© 2021 Medick. All rights reserved. Design by <a
            href="https://w3layouts.com/" target="_blank">
            W3Layouts</a></p>

        <div class="col-lg-4 main-social-footer-29">
          <a href="#facebook" class="facebook"><span class="fa fa-facebook"></span></a>
          <a href="#twitter" class="twitter"><span class="fa fa-twitter"></span></a>
          <a href="#instagram" class="instagram"><span class="fa fa-instagram"></span></a>
          <a href="#linkedin" class="linkedin"><span class="fa fa-linkedin"></span></a>
        </div>

      </div>
    </div>

  </section>
  <!-- //copyright -->
  <!--//footer-->
  <!-- move top -->
  <button onclick="topFunction()" id="movetop" title="Go to top">
    &#10548;
  </button>
  <script>
    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () {
      scrollFunction()
    };

    function scrollFunction() {
      if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("movetop").style.display = "block";
      } else {
        document.getElementById("movetop").style.display = "none";
      }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
      document.body.scrollTop = 0;
      document.documentElement.scrollTop = 0;
    }
  </script>
  <!-- /move top -->
  <!-- Template JavaScript -->
  <script src="assets/js/jquery-3.3.1.min.js"></script>
  <script src="assets/js/theme-change.js"></script>

  <!-- disable body scroll which navbar is in active -->
  <script>
    $(function () {
      $('.navbar-toggler').click(function () {
        $('body').toggleClass('noscroll');
      })
    });
  </script>
  <!-- disable body scroll which navbar is in active -->

  <!--/MENU-JS-->
  <script>
    $(window).on("scroll", function () {
      var scroll = $(window).scrollTop();

      if (scroll >= 80) {
        $("#site-header").addClass("nav-fixed");
      } else {
        $("#site-header").removeClass("nav-fixed");
      }
    });

    //Main navigation Active Class Add Remove
    $(".navbar-toggler").on("click", function () {
      $("header").toggleClass("active");
    });
    $(document).on("ready", function () {
      if ($(window).width() > 991) {
        $("header").removeClass("active");
      }
      $(window).on("resize", function () {
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
