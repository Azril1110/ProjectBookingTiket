<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %> 
<header><jsp:include page="header.jsp" /></header>
<!DOCTYPE html>
<html>
    <head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoundsFest 2024</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Margarine&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Margarine', cursive;
            background: url('gambar/Backgroundd.png');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }
        
        .hero {
            background: url('gambar/back.png') no-repeat center center;
            background-size: cover;
            height: 100vh;
            position: relative;
            color: black;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
        }
        
        .hero::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
        }

        .hero-content {
            z-index: 2;
            animation: fadeIn 2s ease-in-out;
        }

        .hero-content h1 {
            font-size: 64px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .hero-content h2 {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .hero-content p {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .hero-content a {
            font-size: 18px;
            font-weight: bold;
            color: #1abc9c;
            text-decoration: none;
            transition: color 0.3s;
        }

        .hero-content a:hover {
            color: #16a085;
        }

        .jumbotron {
            background-color: #EEEDEB;
            margin-bottom: 0;
            color: #fff;
            padding: 2rem 1rem;
            text-align: center;
        }

        .concert-schedule .card {
            margin-bottom: 20px;
            background-color: #fff; /* Warna cerah */
            color: #2c3e50; /* Teks lebih gelap untuk kontras */
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        .concert-schedule .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 16px 32px rgba(0, 0, 0, 0.4);
        }

        .concert-schedule .card-header {
            font-size: 20px;
            font-weight: bold;
            background-color: #1abc9c;
            border-bottom: none;
            color: #fff;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }

        .concert-schedule .card-body p {
            font-size: 18px;
            margin: 10px 0;
        }

        .btn-buy-ticket {
            background-color: #1abc9c;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
            width: 100%;
            transition: background-color 0.3s, transform 0.3s;
            border-radius: 0 0 10px 10px;
        }

        .btn-buy-ticket:hover {
            background-color: #16a085;
            transform: translateY(-3px);
        }

        .schedule-info {
            margin-top: 20px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            color: #2c3e50; /* Warna teks lebih gelap untuk kontras */
        }

        .slider {
            width: 80%;
            max-width: 800px;
            margin: 0 auto;
            overflow: hidden;
            border-radius: 10px;
            position: relative;
        }

        .slides {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        .slide {
            min-width: 100%;
            transition: transform 0.5s ease-in-out;
        }

        .slide img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .navigation-manual {
            position: absolute;
            width: 100%;
            bottom: 10px;
            display: flex;
            justify-content: center;
        }

        .manual-btn {
            border: 2px solid #ecf0f1;
            padding: 5px;
            border-radius: 50%;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .manual-btn:not(:last-child) {
            margin-right: 10px;
        }

        .manual-btn:hover {
            background: #ecf0f1;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .display-4 {
            text-align: center;
            margin-bottom: 40px;
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
<!-- Hero Section -->
<div class="hero">
    <div class="hero-content">
        <h1>Euphoria</h1>
        <h2>A Night of Modern Beats</h2>
        <h3>At Parking Ground Summarecon Mall Bekasi</h3>
        <h3>02-04 Desember 2024</h3>
    </div>
</div>

<br><br>
<h1 class="display-4">About us</h1>

<div class="slider">
    <div class="slides">
        <div class="slide"><img src="gambar/konser 1.jpg" alt="Slide 1"></div>
        <div class="slide"><img src="gambar/konser.jpg" alt="Slide 2"></div>
        <div class="slide"><img src="gambar/konser 3.jpg" alt="Slide 3"></div>
    </div>
    <div class="navigation-manual">
        <div class="manual-btn" onclick="moveSlide(0)"></div>
        <div class="manual-btn" onclick="moveSlide(1)"></div>
        <div class="manual-btn" onclick="moveSlide(2)"></div>
    </div>
</div>

<br><br>

<!-- Jumbotron -->
<div class="container">
    <h1 class="display-4">Jadwal Konser</h1>
    <p class="lead text-center">Berikut adalah jadwal konser untuk Euphoria 2024.</p>
</div>

<!-- Concert Schedule -->
<div class="container concert-schedule">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    SELASA, 02 Desember 2024
                </div>
                <div class="card-body">
                    <p><strong>Rizky Febian</strong></p>
                    <p><strong>Mahalini Raharaja</strong></p>
                    <p><strong>Salma Salsabila</strong></p>
                    <a href="TicketServlet"><button class="btn btn-buy-ticket">Beli Tiket</button></a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    RABU, 03 Desember 2024
                </div>
                <div class="card-body">
                    <p><strong>Tiara Andini</strong></p>
                    <p><strong>Lyodra Ginting</strong></p>
                    <p><strong>Andmesh</strong></p>
                    <a href="TicketServlet"><button class="btn btn-buy-ticket">Beli Tiket</button></a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    KAMIS, 04 Desember 2024
                </div>
                <div class="card-body">
                    <p><strong>Nadin Amizah</strong></p>
                    <p><strong>Nadhif Basmalah</strong></p>
                    <p><strong>Keisha Levronka</strong></p>
                    <a href="TicketServlet"><button class="btn btn-buy-ticket">Beli Tiket</button></a>
                </div>
            </div>
        </div>
    </div>
    <div class="schedule-info">
        <p>Acara konser dimulai pukul 18:00 dan berakhir pada pukul 22:00.</p>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
            var currentIndex = 0;
            function moveSlide(index) {
                var slides = document.querySelector('.slides');
                var totalSlides = document.querySelectorAll('.slide').length;
                if (index >= totalSlides) {
                    index = 0;
                } else if (index < 0) {
                    index = totalSlides - 1;
                }
                slides.style.transform = 'translateX(' + (-index * 100) + '%)';
                currentIndex = index;
            }

            setInterval(function() {
                currentIndex++;
                if (currentIndex >= document.querySelectorAll('.slide').length) {
                    currentIndex = 0;
                }
                moveSlide(currentIndex);
            }, 5000);
        </script>
        
        <%-- Check if user is admin and show message --%>
        <script>
            <% 
                Boolean isAdmin = (Boolean) session.getAttribute("AdminOn");
                if (isAdmin != null && isAdmin) {
            %>
            alert("You are logged in as admin.");
            <% } %>
        </script>

</body>
 </html> 
<footer><jsp:include page="footer.jsp" /></footer>
        

