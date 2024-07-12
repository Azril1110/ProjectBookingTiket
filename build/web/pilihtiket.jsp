<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pembelian Tiket Event</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Margarine&display=swap" rel="stylesheet">
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
        .header-img {
            width: 100%;
            border-radius: 15px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .ticket-card {
            background: #1abc9c;
            border: none;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            color: #fff;
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        .ticket-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }
        .ticket-card h5 {
            font-size: 24px;
            font-weight: bold;
            letter-spacing: 1px;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
            margin-bottom: 10px;
        }
        .ticket-card h4 {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #ff4757;
        }
        .ticket-card .badge {
            font-size: 14px;
        }
        .btn-buy-ticket {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            padding: 10px 20px;
            transition: background-color 0.3s ease-in-out;
        }
        .btn-buy-ticket:hover {
            background-color: #0056b3;
        }
        .btn-link {
            color: #fff;
            font-size: 16px;
            text-decoration: none;
        }
        .btn-link:hover {
            text-decoration: underline;
            color: #3498db;
        }
        .ticket-detail {
            display: none;
            color: #fff;
        }
        .ticket-detail.show {
            display: block;
        }
        .ticket-group {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .ticket-group h4 {
            color: #fff;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <header><jsp:include page="header.jsp" /></header>
    <div class="container my-5">
        <!-- Gambar Header -->
        <div class="text-center">
            <img src="gambar/konser.jpg" alt="Banner Event" class="header-img">
        </div>

        <!-- Iterasi untuk Menampilkan Tiket -->
        <c:forEach var="ticket" items="${ticketList}">
            <div class="ticket-card">
                <h5>${ticket.getTicketType()}</h5>
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <span class="badge badge-success">Pesan Sebelum Kehabisan</span>
                    </div>
                    <button class="btn btn-link p-0" data-toggle="collapse" data-target="#detail${ticket.id_tiket}">Detail</button>
                </div>
                <h4>Rp ${ticket.getHarga()}</h4>
                <div id="detail${ticket.id_tiket}" class="collapse ticket-detail">
                    <hr>
                    <h6>Detail Tiket:</h6>
                    <ul>
                        <li><strong>Harga:</strong> Rp ${ticket.getHarga()}</li>
                        <li><strong>Stok Tersedia:</strong> ${ticket.getStok()}</li>
                        <li><strong>Hari Acara:</strong> ${ticket.getDay()}</li>
                    </ul>
                </div>
                <div class="text-center mt-3">
                    <form action="TransaksiServlet" method="post">
                        <input type="hidden" name="id_tiket" value="${ticket.getId_tiket()}">
                        <input type="hidden" name="day" value="${ticket.getDay()}">
                        <input type="hidden" name="ticketType" value="${ticket.getTicketType()}">
                        <input type="hidden" name="harga" value="${ticket.getHarga()}">
                        <input type="hidden" name="stok" value="${ticket.getStok()}">
                        <input type="hidden" name="id_event" value="${ticket.getId_event()}">
                        <input type="hidden" name="id_type" value="${ticket.getId_type()}">
                        <input type="hidden" name="id_user" value="${sessionScope.user}">
                        <input type="hidden" name="username" value="${sessionScope.username}">
                        <input type="hidden" name="email" value="${sessionScope.email}">
                        <button type="submit" class="btn btn-buy-ticket">Beli Tiket</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
    <footer><jsp:include page="footer.jsp" /></footer>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
