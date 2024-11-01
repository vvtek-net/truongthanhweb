<?php

include 'config/db_connection.php';
require 'send_email.php';
require 'mail_template.php';

// insert contact
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['fullname']) && $_POST['phone']) {
  $fullname = $_POST['fullname'];
  $phone = $_POST['phone'];
  $description = isset( $_POST['description']) ? $_POST['description'] :'';
  $email = $_POST['email'];
  $link_website_template = isset($_POST['link_website_template']) ? $_POST['link_website_template'] : '';
  $service_package = $_POST['service_package'];

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

$conn->close();
?>

<!doctype html>
<html lang="vi">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="keywords" content="Thiết Kế Website, SEO, thiết kế website chuyên nghiệp, website trọn gói" />
  <meta name="description" content="TruongThanhWeb cung cấp dịch vụ thiết kế website chuyên nghiệp, chuẩn SEO và trọn gói cho doanh nghiệp." />
  <title>Thiết Kế Website Chuyên Nghiệp - TruongThanhWeb</title>
  <meta property="og:title" content="Thiết Kế Website Chuyên Nghiệp - TruongThanhWeb">
  <meta property="og:description" content="TruongThanhWeb cung cấp dịch vụ thiết kế website chuyên nghiệp, chuẩn SEO và trọn gói, giúp doanh nghiệp tăng cường hiệu quả kinh doanh trực tuyến.">
  <meta property="og:image" content="assets/images/logo.png">
  <meta property="og:url" content="https://truongthanhweb.com">
  <link rel="sitemap" type="application/xml" title="Sitemap" href="sitemap.xml">
  <link href="//fonts.googleapis.com/css2?family=Hind+Siliguri:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="icon" href="assets/icon/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="assets/css/body.css">
  <link rel="stylesheet" href="assets/css/style-starter.css">
<style>

  body {
    font-family: Arial, Helvetica !important;
  }

  @keyframes bounce {
    0%, 20%, 50%, 80%, 100% {
        transform: translateY(0);
    }
    40% {
        transform: translateY(-20px);
    }
    60% {
        transform: translateY(-10px);
    }
}

@keyframes color-change {
    0% { color: red; }
    25% { color: orange; }
    50% { color: yellow; }
    75% { color: green; }
    100% { color: red; }
}

.bouncing-text {
    display: inline-block;
    animation: bounce 1.5s infinite, color-change 3s infinite;
}

  @media (max-width: 1080px) {
    .w3l-content-2 {
      margin-top: 420px;
    }
  }
  @media (max-width: 991px) {
    .w3l-content-2 {
      margin-top: 0px;
    }
  }

</style>

  <!-- swipt -->
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
  <script type="application/ld+json">
      {
        "@context": "https://schema.org",
        "@type": "Organization",
        "name": "TruongThanhWeb",
        "url": "https://truongthanhweb.com",
        "logo": "https://truongthanhweb.com/assets/images/logo.png",
        "contactPoint": {
          "@type": "ContactPoint",
          "telephone": "+84-123-456-789",
          "contactType": "Customer Service",
          "areaServed": "VN",
          "availableLanguage": "Vietnamese"
        },
        "sameAs": [
          "https://www.facebook.com/TruongThanhWeb",
          "https://www.linkedin.com/company/truongthanhweb"
        ],
        "description": "TruongThanhWeb cung cấp dịch vụ thiết kế website chuyên nghiệp, chuẩn SEO và trọn gói, giúp doanh nghiệp tăng cường hiệu quả kinh doanh trực tuyến.",
        "address": {
          "@type": "PostalAddress",
          "streetAddress": "123 Đường ABC",
          "addressLocality": "Hà Nội",
          "postalCode": "100000",
          "addressCountry": "VN"
        }
      }
      </script>

</head>

<body>
  <div class="header-w3l">
    <!--header-->
    <?php
    include('includes/header.php');
    ?>
  </div>
  <!-- //header -->
  <!--/w3l-banner-content-->
  <div class="banner-w3l-main">
    <div class="w3l-banner-content">
      <div class="container">
        <div class="bannerhny-info text-center">
          <h6 class="title-subhny mb-2"></h6>
          <h1 class="h1">Thiết Kế <span style="color:#2caee2">Website Trọn Gói</span> Chuyên Nghiệp</h1>
          <a class="btn btn-style btn-white" href="#hot-section">
            Xem Mẫu Website
        </a>

        </div>
      </div>
    </div>
    <!-- home page block1 -->
    <section class="home-services pt-lg-0">
      <div class="container" style="z-index: 9999;">

        <?php require('pricing/index.php'); ?>
        <!-- </div> -->
      </div>


    </section>
    <!-- //home page block1 -->
  </div>
  <!--//w3l-banner-content-->

  <!-- banner bottom shape -->
  <div class="position-relative">
    <div class="shape overflow-hidden">
      <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
      </svg>
    </div>
  </div>
  <!-- banner bottom shape -->

  <!--/w3l-content-1-->
  <div class="w3l-content-1 py-5 d-none">
    <div class="container py-lg-5 py-md-4 py-2">
      <div class="row w3l-content-inf mt-lg-5 pt-lg-5">
        <div class="col-lg-5 w3l-content-left mt-lg-4">
          <h6 class="title-subhny mb-2"> </h6>
          <h3 class="title-w3l mb-4"> </h3>
        </div>
        <div class="col-lg-7 w3l-content-right pl-lg-5 mt-lg-4">
          <p class="para-sub pr-lg-5 mt-md-4 mt-3 mx-auto">
          </p>
          <p class="para-sub pr-lg-5 mt-md-4 mt-3 mx-auto">
          </p>
          <!-- <a class="btn btn-style btn-outline-light mt-sm-5 mt-4 mr-2" href="about.html">
            Read More</a> -->
          <br>
          <br>
          <br>
          <br>
        </div>
      </div>
    </div>
  </div>
  <!--//w3l-content-1-->

  <!-- vì bảng giá bị w3l-content-1 che mất nên phải margin-top -->
  <!-- /w3l-content-2-->
  <div class="w3l-content-2 py-5">
    <div class="container py-md-5 py-2">
      <div class="row whybox-wrap">
        <div class="col-lg-6 whybox-wrap-left">
          <div class="title-content text-left">
            <!-- <h6 class="title-subhny">Dịch Vụ Đặc Biệt</h6> -->
            <h3 class="title-w3l mb-sm-5 mb-4 pb-2">Vì Sao Bạn Nên Thiết Kế Website Tại TruongThanhWeb?</h3>
          </div>

          <div class="whybox-wrap-grid mb-4">
            <div class="icon">
              <span class="fa fa-calendar"></span>
            </div>
            <div class="info">
              <h4><a href="#url">5 Năm Kinh Nghiệm</a></h4>
              <p class="mt-3">Với bề dày kinh nghiệm, chúng tôi tự tin có thể đồng hành được với bạn trên con đường làm giàu.</p>
            </div>
          </div>
          <div class="whybox-wrap-grid mb-4">
            <div class="icon">
              <span class="fa fa-pencil-square-o"></span>
            </div>
            <div class="info">
              <h4><a href="#url">Tư Vấn Miễn Phí</a></h4>
              <p class="mt-3">Đừng ngần ngại, hãy hỏi chúng tôi tất cả những điều bạn đang thắc mắc. </p>
            </div>
          </div>
          <div class="whybox-wrap-grid mb-4">
            <div class="icon">
              <span class="fa fa-shield"></span>
            </div>
            <div class="info">
              <h4><a href="#url">Chế độ bảo hành tốt</a></h4>
              <p class="mt-3">Chúng tôi cam kết bảo hành website của bạn trọn đời. </p>
            </div>
          </div>
        </div>
        <div class="col-lg-6 whybox-wrap-right pl-lg-5 position-relative mt-lg-0 mt-4">
          <img src="assets/images/banner4.webp" alt="Thiết kế website chuyên nghiệp tại TruongThanhWeb" class="img-fluid radius-image" loading="lazy">

        </div>
      </div>

    </div>
  </div>
  <!-- //w3l-content-2-->
  <!-- /w3l-content-4-->
  <section class="w3l-content-4 py-5" id="features">
    <div class="content-4-main py-lg-5 py-md-4">
      <div class="container">
        <div class="title-content text-center">
          <!-- <h6 class="title-subhny">Extraordinary Services</h6> -->
          <h3 class="title-w3l mb-sm-5 mb-4 pb-lg-2">Dịch Vụ Của Chúng Tôi.</h3>
        </div>
        <div class="content-info-in row">
          <div class="content-left col-lg-6">
            <div class="row content4-right-grids mb-sm-5 mb-4">
              <div class="col-lg-2 col-3 content4-right-icon">
                <div class="content4-icon icon-clr1">
                  <span class="fa fa-american-sign-language-interpreting"></span>
                </div>
              </div>
              <div class="col-lg-10 col-9 content4-right-info pl-4">
                <h6><a href="#url"><span style="color: #2caee2;">Website</span> Trọn Gói</a></h6>
                <p>Việc có website sẽ trở nên dễ dàng khi có TruongThanhWeb đồng hành cùng bạn.</p>
              </div>
            </div>
            <div class="row content4-right-grids mb-sm-5 mb-4">
              <div class="col-lg-2 col-3 content4-right-icon">
                <div class="content4-icon icon-clr2">
                  <span class="fa fa-superpowers"></span>
                </div>
              </div>
              <div class="col-lg-10 col-9 content4-right-info pl-4">
                <h6><a href="#url"><span style="color: #2caee2;">Hosting</span> Chất Lượng Cao</a></h6>
                <p>Với hệ thống hạ tầng hiện đại, TruongThanhWeb cam kết sẽ mang đến chất lượng dịch vụ hosting tốt nhất thị trường.</p>
              </div>
            </div>
            <div class="row content4-right-grids mb-sm-5 mb-4">
              <div class="col-lg-2 col-3 content4-right-icon">
                <div class="content4-icon icon-clr2">
                  <span class="fa fa-snowflake-o"></span>
                </div>
              </div>
              <div class="col-lg-10 col-9 content4-right-info pl-4">
                <h6><a href="#url">Sáng Tạo Nội Dung Chuẩn <span style="color: #2caee2;">SEO</span></a></h6>
                <p>Nếu bạn bận, không có thời gian làm việc với website. Đã có TruongThanhWeb lo.</p>
              </div>
            </div>
          </div>
          <div class="content-right col-lg-6 pl-lg-4 mt-lg-0 mt-2">
            <div class="row content4-right-grids mb-sm-5 mb-4">
              <div class="col-lg-2 col-3 content4-right-icon">
                <div class="content4-icon icon-clr3">
                  <span class="fa fa-building-o"></span>
                </div>
              </div>
              <div class="col-lg-10 col-9 content4-right-info pl-4">
                <h6><a href="#url">Thiết Kế Theo <span style="color: #2caee2;">Yêu Cầu</span></a></h6>
                <p>TruongThanhWeb sẽ thiết kế website và đáp ứng mọi yêu cầu của bạn từ dễ tới khó.</p>
              </div>
            </div>
            <div class="row content4-right-grids mb-sm-5 mb-4">
              <div class="col-lg-2 col-3 content4-right-icon">
                <div class="content4-icon icon-clr4">
                  <span class="fa fa-heartbeat"></span>
                </div>
              </div>
              <div class="col-lg-10 col-9 content4-right-info pl-4">
                <h6><a href="#url"> <span style="color: #2caee2;">Tên Miền</span> Chất Lượng</a></h6>
                <p>TruongThanhWeb sẽ tặng bạn tên miền đẹp, chất lượng và thân thiện để bạn có thể bắt đầu công việc kinh doanh.</p>
              </div>
            </div>
            <div class="row content4-right-grids">
              <div class="col-lg-2 col-3 content4-right-icon">
                <div class="content4-icon icon-clr4">
                  <span class="fa fa-eye"></span>
                </div>
              </div>
              <div class="col-lg-10 col-9 content4-right-info pl-4">
                <h6><a href="#url">Chạy Quảng Cáo <span style="color: #2caee2;">Website</span></a></h6>
                <p>TruongThanhWeb sẽ giúp bạn chạy quảng cáo website của mình với chi phí tối ưu nhất.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- //w3l-content-4-->

  <!-- stats -->
  <section class="w3l-stats py-lg-0 py-5" id="stats">
    <div class="gallery-inner container py-lg-0 py-3">
      <div class="row stats-con">
        <div class="col-lg-3 col-6 stats_info counter_grid">
          <span class="fa fa-users"></span>
          <p class="counter">1100</p>
          <h4>Khách Hàng</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid1">
          <span class="fa fa-laptop"></span>
          <p class="counter">500</p>
          <h4>Mẫu Giao Diện</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid mt-lg-0 mt-5">
          <span class="fa fa-smile-o"></span>
          <p class="counter">912</p>
          <h4>Khách Hàng Hài Lòng</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid2 mt-lg-0 mt-5">
          <span class="fa fa-trophy"></span>
          <p class="counter">80</p>
          <h4>Website Lên Top Search</h4>
        </div>
      </div>
    </div>
  </section>
  <!-- //stats -->
  <!--/Blog-Posts-->
  <section class="w3l-blog py-5" id="hot-section" >
    <div class="container py-lg-5 py-md-4 py-2">
        <div class="title-content text-center">
        <h3 class="title-w3l pb-sm-o pb-2 text-center bouncing-text">
        <i class='fas fa-fire-alt' style='font-size:48px;color:ff9a00'></i> 
            Mẫu Website HOT
            <i class='fas fa-fire-alt' style='font-size:48px;color:ff9a00'></i>
        </h3>
    </div>


      <div class="swiper-container">
        <div id="owl-demo1" class="wiper-wrapper d-flex owl-carousel">
          <!--/services-grids-->
          <div class="item">
            <div class="about-in blog-grid-info text-left mt-5 swiper-slide">
              <div class="card img">
                <div class="card-body img">
                  <a href="https://giaodien.vvtek.net/giaodien/noithat1" class="d-block" target="_blank">
                    <img src="assets/images/g7.jpg" alt="Thiết kế website chuyên nghiệp tại TruongThanhWeb - Công Ty Thiết Kế Nội Thất" class="img-fluid radius-image" loading="lazy ">
                  </a>
                  <div class="blog-des mt-4">
                    <!-- <h6 class="card-cap mb-2"><a href="blog-single.html">Investigations</a></h6> -->
                    <h5 class="card-title mb-2"><a class="text-center" href="blog-single.html">Công Ty Thiết Kế Nội Thất.</a>
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="about-in blog-grid-info text-left mt-5 swiper-slide">
              <div class="card img">
                <div class="card-body img">
                  <a href="https://giaodien.vvtek.net/giaodien/giatla1" class="d-block" target="_blank">
                    <img src="assets/images/g5.jpg" alt="Thiết kế website chuyên nghiệp tại TruongThanhWeb - Tiệm Giặt Là" class="img-fluid radius-image" loading="lazy">
                  </a>
                  <div class="blog-des mt-4">
                    <!-- <h6 class="card-cap mb-2"><a href="blog-single.html">Researches</a></h6> -->
                    <h5 class="card-title mb-2"><a class="text-center" href="blog-single.html">Tiệm Giặt Là.</a>
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="about-in blog-grid-info text-left mt-5 swiper-slide">
              <div class="card img">
                <div class="card-body img">
                  <a href="https://giaodien.vvtek.net/giaodien/travel1" class="d-block" target="_blank">
                    <img src="assets/images/g3.jpg" alt="Thiết kế website chuyên nghiệp tại TruongThanhWeb - Du Lịch Mũi Né" class="img-fluid radius-image" loading="lazy">
                  </a>
                  <div class="blog-des mt-4">
                    <!-- <h6 class="card-cap mb-2"><a href="blog-single.html">Your Health </a></h6> -->
                    <h5 class="card-title mb-2"><a class="text-center" href="blog-single.html">Du Lịch Mũi Né.</a>
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="about-in blog-grid-info text-left mt-5 swiper-slide">
              <div class="card img">
                <div class="card-body img">
                  <a href="#blog-single.html" class="d-block">
                    <img src="assets/images/g2.jpg" alt="Thiết kế website chuyên nghiệp tại TruongThanhWeb - Spa Trị Liệu" class="img-fluid radius-image" loading="lazy">
                  </a>
                  <div class="blog-des mt-4">
                    <!-- <h6 class="card-cap mb-2"><a href="blog-single.html">Investigations</a></h6> -->
                    <h5 class="card-title mb-2"><a class="text-center" href="blog-single.html">Spa Trị Liệu.</a>
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="about-in blog-grid-info text-left mt-5 swiper-slide">
              <div class="card img">
                <div class="card-body img">
                <a href="https://giaodien.vvtek.net/giaodien/banhang1" class="d-block" target="_blank">
                    <img src="assets/images/g6.jpg" alt="Thiết kế website chuyên nghiệp tại TruongThanhWeb - Nước Mắm Thái Long" class="img-fluid radius-image" loading="lazy">
                  </a>
                  <div class="blog-des mt-4">
                    <!-- <h6 class="card-cap mb-2"><a href="blog-single.html">Researches</a></h6> -->
                    <h5 class="card-title mb-2"><a class="text-center" href="blog-single.html">Nước Mắm Thái Long.</a>
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="about-in blog-grid-info text-left mt-5 swiper-slide">
              <div class="card img">
                <div class="card-body img">
                <a href="https://giaodien.vvtek.net/giaodien/phlox1" class="d-block" target="_blank">
                    <img src="assets/images/g4.jpg" alt="Thiết kế website chuyên nghiệp tại TruongThanhWeb - Shop Đồ Công Nghệ" class="img-fluid radius-image" loading="lazy">
                  </a>
                  <div class="blog-des mt-4">
                    <!-- <h6 class="card-cap mb-2"><a href="blog-single.html">Your Health </a></h6> -->
                    <h5 class="card-title mb-2"><a class="text-center" href="blog-single.html">Shop Đồ Công Nghệ.</a>
                    </h5>
                    <!-- <ul class="admin-post mb-3">
                      <li>
                        <span class="fa fa-user-o"></span><a href="#admin"> by Admin</a>
                      </li>
                      <li>
                        <p><span class="fa fa-clock-o"></span> Jan 28,2021</p>
                      </li>
                      <li>
                        <a href="#comments"><span class="fa fa-comments-o"></span> 3</a>
                      </li>
                    </ul> -->

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </section>

  <!--//Blog-Posts-->
  <!-- /w3l-content-3-->
  <section class="w3l-content-3 py-5">
    <!-- /content-6-section -->
    <div class="content-3-info py-3">
      <div class="container py-lg-4">
        <div class="row appointment-formw3">
          <div class="col-lg-6 welcome-left">
            <h6 class="title-subhny mb-2">Tư vấn miễn phí</h6>
            <h3 class="title-w3l two mb-3">Đăng Ký Tư Vấn</h3>
            <p class="mb-3">
              Bạn cần website chuẩn SEO để bắt đầu kinh doanh?.</p>

            <a class="btn btn-style btn-outline-light mt-sm-5 mt-4 mr-2" href="lien-he.php">
              Liên Hệ Ngay</a>
          </div>
          <div class="col-lg-6 free-appointment pl-lg-5 mt-5">
            <div class="appointment-form">
              <form action="" method="post">
                <div class="fields-grid">
                  <div class="styled-input">

                    <div class="appointment-form-field">

                      <input type="text" name="fullname" placeholder="Họ Tên*" required="">
                    </div>
                  </div>
                  <div class="styled-input">

                    <div class="appointment-form-field">

                      <input type="email" name="email" placeholder="Email">
                    </div>
                  </div>
                  <div class="styled-input">

                    <div class="appointment-form-field">

                      <input type="text" name="phone" placeholder="Số Điện Thoại*" required="">
                    </div>
                  </div>

                  <div class="styled-input">

                    <div class="appointment-form-field">
                      <select name="service_package" id="require">
                        <option value="web-tron-goi">Website Trọn Gói</option>
                        <option value="Web-yeu-cau">Website thiết kế theo yêu cầu</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="appointment-btn text-lg-right">
                  <button type="submit" class="btn btn-style btn-primary mt-4">Đăng Ký Nhận Tin</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- //w3l-content-3-->
  <!-- testimonials section -->
  <section class="w3l-clients w3l-test pb-5" id="testimonials">
    <div class="midd-w3 py-5">
      <div class="container py-lg-5 py-md-4 pt-2 pb-lg-5">
        <div class="title-content text-center">
          <!-- <h6 class="title-subhny text-center">Happy Clients</h6> -->
          <h3 class="title-w3l mb-sm-5 mb-4 pb-sm-o pb-2 text-center">Đánh Giá Của Khách Hàng</h3>
        </div>
        <div id="owl-demo2" class="owl-carousel owl-theme mt-4 py-md-2 mb-md-4">
          <div class="item">
            <div class="testimonial-content">
              <div class="testimonial">
                <blockquote>
                  <q>Đội ngũ làm việc tận tâm</q>
                </blockquote>
                <p>Tôi rất bất ngờ về việc dịch vụ của truongthanhweb làm rất tốt. </p>
              </div>
              <div class="bottom-info mt-4">
                <a class="comment-img" href="#url"><img src="assets/images/avt-vd.jpg" class="img-responsive"
                    alt="Thiết kế website chuyên nghiệp tại TruongThanhWeb" loading="lazy"></a>
                <div class="people-info align-self">
                  <h3>Mr.Nam</h3>
                  <p class="identity">Sài Gòn</p>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="testimonial-content">
              <div class="testimonial">
                <blockquote>
                  <q>Quá tốt !!</q>
                </blockquote>
                <p>Dịch vụ ở đấy thật tuyệt vời, có bảo hành website trọn đời </p>
              </div>
              <div class="bottom-info mt-4">
                <a class="comment-img" href="#url"><img src="assets/images/avt-vd.jpg" class="img-responsive"
                    alt="Thiết kế website chuyên nghiệp tại TruongThanhWeb" loading="lazy"></a>
                <div class="people-info align-self">
                  <h3>Lan Anh</h3>
                  <p class="identity">Hà Nội</p>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="testimonial-content">
              <div class="testimonial">
                <blockquote>
                  <q>Website thiết kế rất đẹp</q>
                </blockquote>
                <p>Website được thiết kế rất đẹp, giá cả lại phù hợp. </p>
              </div>
              <div class="bottom-info mt-4">
                <a class="comment-img" href="#url"><img src="assets/images/avt-vd.jpg" class="img-responsive"
                    alt="Thiết kế website chuyên nghiệp tại TruongThanhWeb" loading="lazy"></a>
                <div class="people-info align-self">
                  <h3>Trung</h3>
                  <p class="identity">Hà Nội</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- //testimonials section -->

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
  <!-- owl carousel -->
  <script src="assets/js/owl.carousel.js"></script>
  <!-- script for tesimonials carousel slider -->
  <script>
    $(document).ready(function() {
      $("#owl-demo2").owlCarousel({
        loop: true,
        nav: false,
        margin: 50,
        responsiveClass: true,
        responsive: {
          0: {
            items: 1,
            nav: false
          },
          736: {
            items: 1,
            nav: false
          },
          991: {
            items: 2,
            margin: 30,
            nav: false
          },
          1080: {
            items: 3,
            nav: false
          }
        }
      })
      $("#owl-demo1").owlCarousel({
          loop: true,
          nav: false,
          margin: 50,
          autoplay: true, // Thêm tính năng tự động chạy
          autoplayTimeout: 2000, // Thời gian giữa các lần swipe (2000ms = 2 giây)
          autoplayHoverPause: true, // Tạm dừng khi di chuột vào
          responsiveClass: true,
          responsive: {
              0: {
                  items: 1,
                  nav: false
              },
              736: {
                  items: 1,
                  nav: false
              },
              991: {
                  items: 2,
                  margin: 30,
                  nav: false
              },
              1080: {
                  items: 3,
                  nav: false
              }
          }
      });

    })
  </script>
  <!-- //script for tesimonials carousel slider -->
  <!-- stats number counter-->
  <script src="assets/js/jquery.waypoints.min.js"></script>
  <script src="assets/js/jquery.countup.js"></script>
  <script>
    $('.counter').countUp();
  </script>
  <!-- //stats number counter -->
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
    document.querySelector('a[href="#hot-section"]').addEventListener('click', function (e) {
    e.preventDefault(); // Ngăn không cho chuyển hướng mặc định
    document.querySelector('#hot-section').scrollIntoView({
        behavior: 'smooth' // Cuộn mượt mà
    });
});

  </script>

  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

  <script src="assets/js/bootstrap.min.js"></script>

</body>

</html>