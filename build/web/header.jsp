<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoundsFest 2024</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Margarine&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, .navbar-brand, .navbar-nav .nav-link {
            font-family: 'Margarine', cursive;
        }

        .navbar-custom {
            background-color: #20bc9c; /* Ubah transparansi di sini */
            border-bottom: 1px solid rgba(255, 255, 255, 0.1); /* Batas bawah dengan sedikit transparansi */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Bayangan navbar */
            padding: 20px; /* Padding diperbesar */
        }

        .navbar-custom .navbar-brand,
        .navbar-custom .navbar-nav .nav-link {
            color: black; /* Warna teks putih */
            font-weight: bold;
            font-size: 22px; /* Ukuran teks disesuaikan */
        }

        .navbar-custom .navbar-nav .nav-link:hover {
            color: white;
        }

        .navbar-custom .navbar-toggler {
            border-color: rgba(255, 255, 255, 0.5); /* Warna border toggle */
        }

        .navbar-custom .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3e%3cpath stroke='rgba(255, 255, 255, 0.8)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }

        .btn-partnership {
            background-color: #ffd700;
            color: #000;
            border: none;
            padding: 12px 24px; /* Padding diperbesar */
            font-size: 18px;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-partnership:hover {
            background-color: #ffcf33;
            color: #000;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <a class="navbar-brand" href="#">Euphoria 2024</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- Navbar Links -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Galeri.jsp">Gallery</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="TicketServlet">Get a Ticket</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="kontak.jsp">Contact Us</a>
                </li>
                
                <%-- Check if user is logged in and display accordingly --%>
                <c:if test="${empty sessionScope.user}">
                    <li class="nav-item">
                        <a href="login.jsp" class="btn btn-partnership">Login</a>
                    </li>
                </c:if>
                
                <c:if test="${not empty sessionScope.user}">
                    <li class="nav-item">
                        <span class="navbar-text mr-3">Welcome, ${sessionScope.username}</span>
                    </li>
                    <li class="nav-item">
                        <form action="logout" method="post">
                            <button type="submit" class="btn btn-partnership">Logout</button>
                        </form>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
    
    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
