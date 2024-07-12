<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Detail Pembelian Tiket</title>
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
        .detail-card {
            background: #1abc9c;
            border: none;
            border-radius: 15px;
            padding: 20px;
            margin: 20px auto;
            max-width: 600px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            color: #fff;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .detail-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }
        .detail-card h2 {
            color: #fff;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
        }
        .detail-card ul {
            list-style-type: none;
            padding: 0;
        }
        .detail-card li {
            margin-bottom: 10px;
        }
        .btn-instruksi {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            padding: 10px 20px;
            margin-top: 20px;
            transition: background-color 0.3s ease-in-out;
        }
        .btn-instruksi:hover {
            background-color: #0056b3;
        }
        .btn-konfirmasi {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            padding: 10px 20px;
            margin-top: 20px;
            transition: background-color 0.3s ease-in-out;
        }
        .btn-konfirmasi:hover {
            background-color: #218838;
        }
        .text-danger {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <div class="detail-card">
            <h2>Detail Tiket yang Dipilih</h2>
            <ul>
                <li><strong>ID Tiket:</strong> <%= request.getAttribute("id_tiket") %></li>
                <li><strong>Hari Acara:</strong> <%= request.getAttribute("day") %></li>
                <li><strong>Jenis Tiket:</strong> <%= request.getAttribute("ticketType") %></li>
                <li><strong>Harga:</strong> Rp <%= request.getAttribute("harga") %></li>
                <li><strong>Stok Tersedia:</strong> <%= request.getAttribute("stok") %></li>
                <li><strong>ID Event:</strong> <%= request.getAttribute("id_event") %></li>
                <li><strong>ID Tipe:</strong> <%= request.getAttribute("id_type") %></li>
                <li><strong>ID Pengguna:</strong> <%= request.getAttribute("id_user") %></li>
                <li><strong>Nama Pengguna:</strong> <%= request.getAttribute("username") %></li>
                <li><strong>Email:</strong> <%= request.getAttribute("email") %></li>
                <li><strong>Kode Pembayaran:</strong> <%= request.getAttribute("paymentCode") %></li>
            </ul>
            <button class="btn btn-instruksi" onclick="showInstructions()">Detail Pembayaran</button>
            <div id="instruksi" style="display: none;">
                <br>
                <p>Silakan lakukan pembayaran dengan mentransfer jumlah yang tertera di atas ke Virtual Account yang telah disediakan.</p>
                <p>Harap cantumkan kode pembayaran <strong><%= request.getAttribute("paymentCode") %></strong> pada deskripsi atau referensi pembayaran agar pembayaran Anda dapat diproses dengan cepat.</p>
            </div>
            <form action="KonfirmasiPembayaranServlet" method="POST">
                <input type="hidden" name="id_tiket" value="<%= request.getAttribute("id_tiket") %>">
                <input type="hidden" name="day" value="<%= request.getAttribute("day") %>">
                <input type="hidden" name="ticketType" value="<%= request.getAttribute("ticketType") %>">
                <input type="hidden" name="harga" value="<%= request.getAttribute("harga") %>">
                <input type="hidden" name="stok" value="<%= request.getAttribute("stok") %>">
                <input type="hidden" name="id_event" value="<%= request.getAttribute("id_event") %>">
                <input type="hidden" name="id_type" value="<%= request.getAttribute("id_type") %>">
                <input type="hidden" name="id_user" value="<%= request.getAttribute("id_user") %>">
                <input type="hidden" name="username" value="<%= request.getAttribute("username") %>">
                <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
                <input type="hidden" name="paymentCode" value="<%= request.getAttribute("paymentCode") %>">
                <button type="submit" class="btn btn-konfirmasi" id="btn-konfirmasi">Konfirmasi Pembayaran</button>
            </form>
            <p id="countdown" class="text-danger" style="display: none;"></p>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        var countDownDate = new Date().getTime() + 240000; // 4 menit dalam milidetik

        setTimeout(function() {
            document.querySelectorAll('.detail-card li').forEach(function(li) {
                li.innerHTML = '<strong>Pembayaran Kadaluarsa</strong>';
            });
            document.getElementById('btn-konfirmasi').style.display = 'none';
            document.getElementById('countdown').innerHTML = 'Pembayaran Kadaluarsa';
        }, 240000);

        function showInstructions() {
            var instruksiDiv = document.getElementById("instruksi");
            if (instruksiDiv.style.display === "none") {
                instruksiDiv.style.display = "block";
            } else {
                instruksiDiv.style.display = "none";
            }
        }
    </script>
</body>
</html>
