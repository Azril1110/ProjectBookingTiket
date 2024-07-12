<%-- 
    Document   : footer
    Created on : 4 Jul 2024, 12.53.17
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Margarine&display=swap" rel="stylesheet">
  <title>Footer with Bootstrap</title>

  <style>
    body, .footer {
      font-family: 'Margarine', cursive;
    }
    .footer {
      background-color: #20bc9c;
      color: black;
      padding: 40px 0;
    }
    .footer a {
      color: #f8f9fa;
      text-decoration: none;
    }
    .footer a:hover {
      color: #adb5bd;
    }
    .footer .social-icons a {
      font-size: 24px;
      margin: 0 15px;
      color: white;
    }
    .footer .social-icons a:hover {
      color: #adb5bd;
    }
    .footer .social-icons img {
      width: 40px; /* Ubah ukuran lebar sesuai kebutuhan */
      height: 40px; /* Ubah ukuran tinggi sesuai kebutuhan */
    }
  </style>
</head>
<body>

<!-- Footer -->
<footer class="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <h5>About Us</h5>
        <p>Selamat datang di Europhia 2024! Nikmati tiga hari penuh musik spektakuler dengan tiga artis terbaik setiap harinya. Bergabunglah dengan kami dan rasakan momen tak terlupakan di Euphhoria 2024!</p>
      </div>
      <div class="col-md-4">
        <h5>Social Media</h5>
        <ul class="list-unstyled social-icons">
            <a href="#"><img src="gambar/ig logo.png" alt="Instagram"></a>
          <a href="#"><img src="gambar/facebook logo.png"Facebook"></a>
          <a href="#"><img src="gambar/x logo.png" alt="X"></a>
        </ul>
      </div>
      <div class="col-md-4">
        <h5>Contact Us</h5>
        <p>
          <i class="fas fa-map-marker-alt"></i> Madani , depok, Indonesia<br>
          <i class="fas fa-phone"></i> (123) 456-7890<br>
          <i class="fas fa-envelope"></i> info@euprohia.com
        </p>
      </div>
    </div>
    <div class="row mt-3">
      <div class="col-12 text-center">
        <p>&copy; 2024 Your Company. All rights reserved.</p>
      </div>
    </div>
  </div>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
