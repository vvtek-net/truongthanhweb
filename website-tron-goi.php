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
  <title>Mẫu Web - TruongThanhWeb - Thiết Kế Website Trọn Gói</title>
  <link href="//fonts.googleapis.com/css2?family=Hind+Siliguri:wght@400;500;600;700&display=swap"
    rel="stylesheet">
  <!-- Template CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

  <link rel="stylesheet" href="assets/css/body.css">
  <link rel="stylesheet" href="assets/css/style-starter.css">
  <link rel="stylesheet" href="assets/css/tags.css">
  <style>
    /* /* Đặt vị trí cho container chứa hình ảnh */
    .image-container {
      overflow: hidden;
      /* Ẩn phần hình ảnh bị scroll ra ngoài */
      height: 200px;
      /* Chiều cao cho hình ảnh */
      position: relative;
    }

    .image-container img {
      transition: transform 12s ease;
      /* Tạo hiệu ứng scroll mượt mà */
      transform: translateY(0);
      /* Đặt hình ảnh ở trạng thái ban đầu */
    }

    /* Khi hover vào container, hình ảnh sẽ scroll từ trên xuống dưới */
    .image-container:hover img {
      transform: translateY(-80%);
      /* Scroll toàn bộ hình ảnh lên trên */
    }

    /* Ẩn nút Demo mặc định */
    .demo-button a {
      opacity: 0;
      visibility: hidden;
      transition: opacity 0.3s ease, visibility 0.3s ease;
    }

    /* Khi hover vào .area-box thì hiện nút Demo */
    .area-box:hover .demo-button a {
      opacity: 1;
      visibility: visible;
    }

    /* Thiết lập để làm hiệu ứng khi hover */
    .area-box {
      position: relative;
      transition: transform 0.3s ease;
    }

    .area-box:hover {
      transform: translateY(-5px);
    }

    /* Thiết lập để nút Demo hiện ra khi màn hình nhỏ hơn 768px (giao diện điện thoại) */
    @media (max-width: 768px) {
      .demo-button a {
        opacity: 1;
        visibility: visible;
      }
    }

    /* Thiết lập để nút Demo hiện ra khi màn hình nhỏ hơn 992px (giao diện điện thoại và tablet) */
    @media (max-width: 992px) {
      .demo-button a {
        opacity: 1;
        visibility: visible;
      }
    }
  </style>
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
            <div class="col-lg-4 col-md-6 grids-feature item-demo mt-4">
              <div class="area-box icon-blue">
                <!-- Sửa thành image_url trong database -->
                <a href="#">
                  <div class="image-container">
                    <img src="<?php echo $row['image_url']; ?>" alt="" class="img-fluid radius-image">
                  </div>
                </a>
                <!-- Sửa thành title trong database -->
                <h4><a href="#feature" class="title-head"><?php echo $row['title']; ?></a></h4>
                <!--/des-->
                <div class="w3doctor-box-bottom align-items-center">
                  <!-- Thêm điều kiện kiểm tra và in tag tương ứng với price -->
                  <div class="doctor-phone text-start">
                    <p>
                      <?php
                      if ($row['price'] < 5000000) {
                        echo '<span class="version-theme-co-ban" style="font-size: 14px;">Cơ bản</span>';
                      } elseif ($row['price'] >= 5000000 && $row['price'] < 7000000) {
                        echo '<span class="version-theme-tieu-chuan" style="font-size: 14px;">Tiêu chuẩn</span>';
                      } elseif ($row['price'] > 9000000) {
                        echo '<span class="version-theme-cao-cap" style="font-size: 14px;"><i class="fa-solid fa-crown" style="font-size: 13px"></i> Cao cấp</span>';
                      }
                      ?>
                    </p>
                  </div>
                  <div class="text-end demo-button">
                    <a href="demo.php?id=<?php echo $row['id']; ?>" class="btn btn-secondary text-white" target="_blank">Demo</a>
                  </div>
                </div>
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
            echo '<li class="page-item"><a class="page-link" href="website_tron_goi.php?page=' . ($page - 1) . '">Trước</a></li>';
          }

          // Hiển thị nút 1 và dấu "..." nếu trang hiện tại lớn hơn 4
          if ($page > 4) {
            echo '<li class="page-item"><a class="page-link" href="website_tron_goi.php?page=1">1</a></li>';
            if ($page > 5) {
              echo '<li class="page-item"><span class="page-link">...</span></li>';
            }
          }

          // Hiển thị các trang từ (page-3) đến (page+3)
          for ($i = max(1, $page - 3); $i <= min($total_pages, $page + 3); $i++) {
            if ($i == $page) {
              echo '<li class="page-item active"><span class="page-link">' . $i . '</span></li>';
            } else {
              echo '<li class="page-item"><a class="page-link" href="website_tron_goi.php?page=' . $i . '">' . $i . '</a></li>';
            }
          }

          // Hiển thị dấu "..." và nút trang cuối nếu còn các trang sau trang hiện tại
          if ($page < $total_pages - 3) {
            if ($page < $total_pages - 4) {
              echo '<li class="page-item"><span class="page-link">...</span></li>';
            }
            echo '<li class="page-item"><a class="page-link" href="website_tron_goi.php?page=' . $total_pages . '">' . $total_pages . '</a></li>';
          }

          // Nút "Sau"
          if ($page < $total_pages) {
            echo '<li class="page-item"><a class="page-link" href="website_tron_goi.php?page=' . ($page + 1) . '">Sau</a></li>';
          }
          ?>
        </ul>
      </div>

    </div>
  </section>
  <!--//website_tron_goi-6-->

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
    window.onscroll = function() {
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

  <!-- hover Demo -->
  <script>
    // Lấy tất cả các phần tử chứa nút Demo
    const boxes = document.querySelectorAll('.item-demo');

    // Thêm sự kiện hover cho từng phần tử
    boxes.forEach(box => {
      box.addEventListener('mouseenter', () => {
        box.querySelector('.demo-button a').style.opacity = '1';
        box.querySelector('.demo-button a').style.visibility = 'visible';
      });

      box.addEventListener('mouseleave', () => {
        box.querySelector('.demo-button a').style.opacity = '0';
        box.querySelector('.demo-button a').style.visibility = 'hidden';
      });
    });
  </script>

  <script src="assets/js/bootstrap.min.js"></script>

</body>

</html>