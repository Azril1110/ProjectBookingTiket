<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean AdminOn = (Boolean) session.getAttribute("AdminOn");
    if (AdminOn == null || !AdminOn) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Home Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="CSS/admin-home.css"> <!-- Admin-specific CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"> <!-- Font Awesome -->
    <style>
        body {
            background: url('gambar/Backgroundd.png') no-repeat center center fixed;
            background-size: cover;
            color: black;
            font-family: 'Roboto', sans-serif;
            height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .navbar-custom {
            background-color: #20bc9c; 
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.8em;
            color: white !important;
        }
        .navbar-nav .nav-item .nav-link {
            color: white;
            font-size: 1.2em;
        }
        .navbar-nav .nav-item .nav-link:hover {
            color: #d4d4d4;
        }
        .admin-dashboard {
            display: flex;
            flex: 1;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding-bottom: 50px; /* Add padding to create space between card and footer */
        }
        .card {
            background-color: #20bc9c;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
            margin: 0 auto;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card-header {
            border-bottom: 1px solid #bdc3c7;
            font-size: 1.2em;
            font-weight: bold;
            background-color: #1abc9c;
            color: black; /* Change the text color to black */
        }
        .btn-primary, .btn-info {
            background-color: #3498db;
            border-color: #3498db;
            color: #fff;
            border-radius: 20px;
            transition: background-color 0.3s, transform 0.3s;
            width: 100%;
            margin: 10px 0;
        }
        .btn-primary:hover, .btn-info:hover {
            background-color: #2980b9;
            border-color: #2980b9;
            color: #fff;
            transform: scale(1.05);
        }
        .card-body a {
            display: block;
            margin-bottom: 10px;
        }
        h1 {
            font-size: 2.5em;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.2em;
            color: #7f8c8d;
        }
        .footer {
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: auto;
        }
        .footer a {
            color: #3498db;
            margin: 0 10px;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .footer .social-icons a {
            margin: 0 10px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <a class="navbar-brand" href="#">Euphoria 2024</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp"><i class="fas fa-sign-out-alt"></i> Close</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    
    <!-- Admin Dashboard -->
    <div class="admin-dashboard">
        <div class="container">
            <h1>Welcome Admin</h1>
            <p>Here's the admin-specific content and features.</p>

            <div class="card">
                <div class="card-header">
                    <i class="fas fa-tasks"></i> Admin Actions
                </div>
                <div class="card-body">
                    <a href="user-list.jsp" class="btn btn-info btn-partnership"><i class="fas fa-users"></i> User Management</a>
                    <a href="TicketServlet" class="btn btn-info btn-partnership"><i class="fas fa-ticket-alt"></i> Ticket Management</a>
                    <a href="index.jsp" class="btn btn-info btn-partnership"><i class="fas fa-times"></i> Close</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <footer>
        <jsp:include page="footer.jsp" /> <!-- Include common footer -->
    </footer>

    <!-- Bootstrap and JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
