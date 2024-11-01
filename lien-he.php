<?php

include('config/db_connection.php');
require 'send_email.php';
require 'mail_template.php';

$service_package = isset($_GET['service_package'] ) ? $_GET['service_package'] :'';

// insert contact
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['fullname']) && isset($_POST['phone'])) {
  $fullname = $_POST['fullname'];
  $phone = $_POST['phone'];
  $description = $_POST['description'];
  $email = $_POST['email'];
  $link_website_template = $_POST['link_website_template'];

  $sql = "INSERT INTO contact_customer (fullname, email, phone, description, link_website_template, service_package, created_at)
          VALUES (?, ?, ?, ?, ?, ?, NOW());";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("ssssss", $fullname, $email, $phone, $description, $link_website_template, $service_package);
  
  if ($stmt->execute()) {
    // Tạo email template
    $emailTemplate = new EmailTemplate();
    $template = $emailTemplate->getTemplate('contact_customers');

    $title = "New Contacts";
    $email = "ngxtuananh99@gmail.com";
    $fullname = "Nguyễn Tuấn Anh";
    $template = str_replace("{user_name}", $fullname, $template);

    sendEmail($email, $fullname, $template, $title);
  }

  header("Location: index?msg=success");
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
  <!-- //header -->
  <!--/breadcrumb-bg-->
  <div class="breadcrumb-bg py-5  w3l-inner-page-breadcrumb">
    <div class="container pt-lg-5 pt-md-3 p-lg-4 pb-md-3 my-lg-3">
      <h2 class="title pt-5">Đăng Ký Ngay</h2>
      <ul class="breadcrumbs-custom-path mt-3 text-center">
        <li><a href="index.html">Trang chủ</a></li>
        <li class="active"><span class="fa fa-arrow-right mx-2" aria-hidden="true"></span> Đăng ký ngay </li>
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
  <!--/contact-->
  <section class="w3l-contact-2 py-5" id="contact">
    <div class="container py-lg-5 py-md-4 py-2">
      <div class="contact-grids d-grid">
        <div class="contact-left">
          <!-- <h6 class="title-subhny mb-1">Get in Touch</h6> -->
          <h3 class="title-w3l mb-2">Liên Hệ Với Chúng Tôi</h3>
          <p>Chúng tôi có một đội ngũ hỗ trợ dành riêng cho tất cả các nhu cầu hỗ trợ của bạn. Chúng tôi thường phản hồi yêu cầu của bạn trong vòng
            24 giờ.</p>
          <div class="cont-details">
            <div class="cont-top margin-up">
              <div class="cont-left text-center">
                <span class="fa fa-map-marker"></span>
              </div>
              <div class="cont-right">
                <h6>Địa Chỉ</h6>
                <p>Số 16, ngõ 42, Trung Hòa, Cầu Giấy, Hà Nội.</p>
              </div>
            </div>
            <div class="cont-top margin-up">
              <div class="cont-left text-center">
                <span class="fa fa-phone"></span>
              </div>
              <div class="cont-right">
                <h6>Hotline</h6>
                <p><a href="tel:+(84) 328 501 599">+(84) 328 501 599</a></p>
              </div>
            </div>
            <div class="cont-top margin-up">
              <div class="cont-left text-center">
                <span class="fa fa-envelope-o"></span>
              </div>
              <div class="cont-right">
                <h6>Email</h6>
                <p><a href="mailto:website.truongthanh@gmail.com" class="mail">website.truongthanh@gmail.com</a></p>
              </div>
            </div>
            <div class="cont-top margin-up">
              <div class="cont-left text-center">
                <span class="fa fa-life-ring"></span>
              </div>
              <div class="cont-right">
                <h6>Hỗ Trợ Kỹ Thuật</h6>
                <p><a href="mailto:website.truongthanh@gmail.com" class="mail">website.truongthanh@gmail.com</a></p>
              </div>
            </div>
          </div>
        </div>
        <div class="contact-right">
          <form action="" method="post" class="signin-form">
            <div class="input-grids">
              <input type="text" name="fullname" id="fullname" placeholder="Họ Tên*" class="contact-input"
                required="" />
              <input type="email" name="email" id="email" placeholder="Email Của Bạn" class="contact-input" />
              <input type="text" name="phone" id="phone" placeholder="SĐT của bạn*" class="contact-input"
                required="" />
              <input type="text" name="link_website_template" id="link_website_template" placeholder="Link Mẫu Website" class="contact-input"
              />
            </div>
            <div class="form-input">
              <textarea name="description" id="description" placeholder="Mô Tả Yêu Cầu"></textarea>
            </div>
            <div class="w3l-submit text-lg-right">
              <button type="submit" class="btn btn-style btn-primary">Gửi Thông Tin</button>
            </div>
          </form>
        </div>
      </div>
  </section>
  <!-- /map-->
  <div class="map-iframe">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d232.77752729941122!2d105.80158137528782!3d21.015055979506666!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab5f02a6f7db%3A0x4bffa2ff70836e79!2zTmcuIDQyIFAuIFRydW5nIEjDsmEsIFRydW5nIEhvw6AsIEPhuqd1IEdp4bqleSwgSMOgIE7hu5lpLCBWaWV0bmFt!5e0!3m2!1sen!2s!4v1729174464284!5m2!1sen!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    <!-- <iframe
      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d317718.69319292053!2d-0.3817765050863085!3d51.528307984912544!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon%2C+UK!5e0!3m2!1sen!2spl!4v1562654563739!5m2!1sen!2spl"
      width="100%" height="400" frameborder="0" style="border: 0px;" allowfullscreen=""></iframe> -->
  </div>
  <!-- //map-->
  <!-- /contact -->
  <!-- footer -->
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