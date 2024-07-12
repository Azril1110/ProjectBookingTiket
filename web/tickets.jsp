<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ticket Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
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
            color: #fff;
        }
        .container {
            background: rgba(44, 62, 80, 0.8);
            border-radius: 10px;
            padding: 20px;
            margin-top: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #fff;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
        }
        .form-control {
            background: rgba(255, 255, 255, 0.9);
            color: #000;
        }
        .btn-primary, .btn-danger, .btn-info {
            margin-top: 10px;
            margin-right: 5px;
        }
        .btn-primary:hover, .btn-danger:hover, .btn-info:hover {
            opacity: 0.8;
        }
        .table {
            background: rgba(255, 255, 255, 0.9);
            color: #000;
        }
        .table th, .table td {
            border-color: #ddd;
        }
        .alert {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Ticket Management</h1>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        
        <form action="TicketServlet" method="post">
            <input type="hidden" name="action" value="update">
            <div class="form-group">
                <label for="id_tiket">Ticket ID:</label>
                <input type="text" class="form-control" id="id_tiket" name="id_tiket" readonly>
            </div>
            <div class="form-group">
                <label for="day">Event Day:</label>
                <input type="text" class="form-control" id="day" name="day">
            </div>
            <div class="form-group">
                <label for="harga">Price:</label>
                <input type="text" class="form-control" id="harga" name="harga">
            </div>
            <div class="form-group">
                <label for="stok">Stock:</label>
                <input type="text" class="form-control" id="stok" name="stok">
            </div>
            <div class="form-group">
                <label for="ticketType">Ticket Type:</label>
                <input type="text" class="form-control" id="ticketType" name="ticketType">
            </div>
            <button type="submit" class="btn btn-primary">Update Ticket</button>
            <a href="admin-home.jsp" class="btn btn-primary">Close</a>
        </form>
        
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>ID Tiket</th>
                    <th>Hari Event</th>
                    <th>Harga</th>
                    <th>Stok</th>
                    <th>Ticket Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ticket" items="${ticketList}">
                    <tr>
                        <td>${ticket.id_tiket}</td>
                        <td>${ticket.day}</td>
                        <td>${ticket.harga}</td>
                        <td>${ticket.stok}</td>
                        <td>${ticket.ticketType}</td>
                        <td>
                            <form action="TicketServlet" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id_tiket" value="${ticket.id_tiket}">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                            <button type="button" class="btn btn-info" onclick="fillForm('${ticket.id_tiket}', '${ticket.day}', '${ticket.harga}', '${ticket.stok}', '${ticket.ticketType}')">Edit</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <script>
        function fillForm(id_tiket, day, harga, stok, ticketType) {
            document.getElementById('id_tiket').value = id_tiket;
            document.getElementById('day').value = day;
            document.getElementById('harga').value = harga;
            document.getElementById('stok').value = stok;
            document.getElementById('ticketType').value = ticketType;
        }
    </script>
</body>
</html>
