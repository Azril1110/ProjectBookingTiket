<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kontak</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <meta name="description" content="Hubungi kami untuk informasi lebih lanjut.">
    <style>
        body {
            font-family: 'Margarine', cursive;
            background: url('gambar/Backgroundd.png');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Full height to center vertically */
        }

        header, footer {
            padding: 10px 0; /* Top and bottom padding for header and footer */
            background-color: #333; /* Example background color */
            color: white; /* Example text color */
            text-align: center;
        }

        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px; /* Margin from header */
            margin-bottom: 20px; /* Margin from footer */
        }

        form {
            display: grid;
            gap: 15px;
            background: #1abc9c;
            padding: 30px;
            border-radius: 15px; /* More rounded corners */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3); /* Deeper shadow for elegance */
            max-width: 500px;
            width: 100%;
            backdrop-filter: blur(10px); /* Slight blur effect for a more modern look */
        }

        form h1 {
            color: #f5f5f5; /* Light color for better contrast */
            text-align: center;
            margin-bottom: 20px;
            font-size: 26px; /* Slightly larger font size */
            font-weight: bold;
        }

        form label {
            font-size: 14px;
            color: #f5f5f5; /* Light color for better contrast */
            text-align: left;
            font-weight: bold;
        }

        form input,
        form textarea {
            padding: 12px; /* Slightly more padding */
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background: rgba(255, 255, 255, 0.8); /* Light background with some transparency */
        }

        form input:focus,
        form textarea:focus {
            border-color: #ffa500;
            outline: none;
            box-shadow: 0 0 10px rgba(255, 165, 0, 0.5); /* Larger glow effect */
        }

        form button {
            padding: 12px;
            background-color: #ffa500;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s; /* Add transform for button press effect */
        }

        form button:hover {
            background-color: #e59400;
            transform: scale(1.05); /* Slightly enlarge button on hover */
        }

        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7); /* Darker overlay for better focus */
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .popup-content {
            background: #2c3e50; /* Dark background for popup */
            color: #f5f5f5; /* Light text color */
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            max-width: 400px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .popup-content button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #ffa500;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .popup-content button:hover {
            background-color: #e59400;
            transform: scale(1.05);
        }
    </style>
</head>

<body>
    <header>
        <jsp:include page="header.jsp" />
    </header>

    <div class="content">
        <form id="contactForm">
            <h1>Kontak Kami</h1>
            <label for="nama">Nama:</label>
            <input type="text" id="nama" name="nama" required aria-label="Nama">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required aria-label="Email">
            <label for="pesan">Pesan:</label>
            <textarea id="pesan" name="pesan" required aria-label="Pesan"></textarea>
            <button type="submit">Kirim</button>
        </form>
    </div>

    <div class="popup" id="popup">
        <div class="popup-content">
            <p>Terima kasih atas masukan dan saran Anda!<br>
                Kami sangat menghargai waktu yang Anda luangkan untuk berbagi pemikiran dengan kami. 
                Tim kami akan meninjau pesan Anda dan berusaha untuk memberikan tanggapan secepat mungkin.
                <br><br>
                Salam hangat,
                <br><br>
                [Tim Penyelenggara Konser]</p>
            <button id="closePopup">Tutup</button>
        </div>
    </div>
    
    <script>
        document.getElementById('contactForm').addEventListener('submit', function (event) {
            event.preventDefault();
            document.getElementById('popup').style.display = 'flex';
        });

        document.getElementById('closePopup').addEventListener('click', function () {
            document.getElementById('popup').style.display = 'none';
            document.getElementById('contactForm').reset();
        });
    </script>

    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
