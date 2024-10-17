<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
  /* Popup tìm kiếm */
  .search-popup {
    display: none;
    /* Ẩn popup mặc định */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    /* Màu nền tối */
    justify-content: center;
    align-items: center;
    z-index: 1000;
  }

  /* Nội dung của popup */
  .search-popup-content {
    background-color: #fff;
    padding: 30px;
    border-radius: 5px;
    text-align: center;
    position: relative;
    width: 80%;
    max-width: 400px;
  }

  /* Nút đóng */
  .close-btn {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 30px;
    cursor: pointer;
  }

  /* Thiết kế form tìm kiếm */
  .search-form input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  .search-form .btn {
    width: 100%;
  }

  /* Hiển thị popup khi cần */
  .search-popup.show {
    display: flex;
  }

  .dropdown:hover .dropdown-menu {
    display: block;
  }
</style>
<?php
// Lấy URI hiện tại
$current_page = basename($_SERVER['REQUEST_URI'], ".php");
?>

<header id="site-header" class="header-w3l fixed-top">
  <div class="container">
    <nav class="navbar navbar-expand-lg stroke">
      <!-- <a class="navbar-brand" href="index.html">
         Med<span class="sub-logo">i</span>ck</span>
        </a> -->
      <!-- if logo is image enable this    -->
      <a class="navbar-brand" href="index.html">
        <img src="assets/images/logo.png" alt="Your logo" title="Your logo" style="height:75px; max-width: 300px;" />
      </a>
      <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
        data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
        <span class="navbar-toggler-icon fa icon-close fa-times"></span>
        </span>
      </button>

      <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav mx-lg-auto align-items-center">
          <!-- Trang Chủ -->
          <li class="nav-item <?php if ($current_page == 'index' || $current_page == '') {
                                echo 'active';
                              } ?>">
            <a class="nav-link" href="index.php">Trang Chủ</a>
          </li>

          <!-- Bảng Giá -->
          <li class="nav-item <?php if ($current_page == 'bang-gia') {
                                echo 'active';
                              } ?>">
            <a class="nav-link" href="bang-gia.php">Bảng Giá</a>
          </li>

          <!-- Dịch vụ Website -->
          <li class="nav-item dropdown <?php if ($current_page == 'website-tron-goi' || $current_page == 'lien-he?service_package=thiet-ke-theo-yeu-cau') {
                                          echo 'active';
                                        } ?>">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Dịch vụ Website
              <i class="fa-solid fa-caret-down"></i>
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="website-tron-goi.php">Website trọn gói</a>
              <a class="dropdown-item" href="lien-he.php?service_package=thiet-ke-theo-yeu-cau">Thiết kế theo yêu cầu</a>
            </div>
          </li>

          <!-- Search Icon -->
          <li class="search-icon ml-lg-3 mr-lg-5 mt-lg-0 mt-4">
            <a href="#" id="searchIcon"><span class="fa fa-search" style="font-size: 24px;"></span></a>
          </li>

          <!-- Search Popup -->
          <div id="searchPopup" class="search-popup">
            <div class="search-popup-content">
              <span id="closeSearchPopup" class="close-btn">&times;</span>
              <form class="search-form" method="GET" action="website-tron-goi.php">
                <input type="text" name="search" placeholder="Tìm kiếm mẫu website bạn mong muốn..." required>
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
              </form>
            </div>
          </div>


        </ul>

      </div>
    </nav>
  </div>
</header>
<script>
  // Lấy các phần tử
  const searchIcon = document.getElementById('searchIcon');
  const searchPopup = document.getElementById('searchPopup');
  const closeSearchPopup = document.getElementById('closeSearchPopup');

  // Hiển thị popup khi nhấn vào icon tìm kiếm
  searchIcon.addEventListener('click', function(e) {
    e.preventDefault();
    searchPopup.classList.add('show');
  });

  // Đóng popup khi nhấn vào nút đóng
  closeSearchPopup.addEventListener('click', function() {
    searchPopup.classList.remove('show');
  });

  // Đóng popup khi nhấn ra ngoài nội dung
  window.addEventListener('click', function(e) {
    if (e.target === searchPopup) {
      searchPopup.classList.remove('show');
    }
  });
</script>