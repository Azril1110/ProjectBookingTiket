<%-- 
    Document   : Galeri
    Created on : 7 Jul 2024, 18.53.53
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header><jsp:include page="header.jsp" /></header>
<!DOCTYPE html>
<html>
   <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Galeri Artis - Euphoria: A Night of Modern Beats</title>
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
    
            .gallery-content {
                padding: 50px 0;
            }
    
            .artist-card {
                background: #1abc9c;
                border: none;
                border-radius: 15px;
                padding: 20px;
                margin-bottom: 30px;
                text-align: center;
                color: #fff;
                transition: transform 0.3s, box-shadow 0.3s;
                position: relative;
                overflow: hidden;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            }
    
            .artist-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            }
    
            .artist-card img {
                width: 100%;
                height: 400px;
                object-fit: cover;
                border-radius: 15px;
                margin-bottom: 15px;
                transition: transform 0.3s;
            }
    
            .artist-card:hover img {
                transform: scale(1.05);
            }
    
            .artist-card h5 {
                font-family: 'Playfair Display', serif;
                font-size: 24px;
                font-weight: bold;
                margin: 15px 0;
                letter-spacing: 1px;
                text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
            }
    
            .artist-card p {
                font-size: 16px;
                margin-bottom: 15px;
                letter-spacing: 0.5px;
            }
    
            .social-icons {
                position: relative;
                z-index: 10; 
                margin-top: 20px;
                display: flex;
                justify-content: center;
                gap: 10px;
            }
    
            .social-icons a {
                color: #fff;
                font-size: 18px;
                transition: color 0.3s;
            }
    
            .social-icons a:hover {
                color: #3498db;
            }
    
            .page-title {
                text-align: center;
                margin-bottom: 50px;
                font-size: 36px;
                font-weight: bold;
                color: #fff;
                font-family: 'Playfair Display', serif;
                text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.3);
            }
    
            .artist-card .overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.8);
                opacity: 0;
                transition: opacity 0.3s;
                border-radius: 15px;
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
                z-index: 5; 
            }
    
            .artist-card:hover .overlay {
                opacity: 1;
            }
    
            .artist-card .overlay-content {
                color: white;
                max-width: 80%;
            }
    
            .artist-card .overlay-content h5 {
                font-family: 'Playfair Display', serif;
                font-size: 28px;
                margin-bottom: 10px;
                text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
            }
    
            .artist-card .overlay-content p {
                font-size: 18px;
                letter-spacing: 0.5px;
            }
        </style>
    </head>
  
    <body>
    <!-- Bagian Galeri -->
    <div class="container gallery-content">
        <div class="page-title">Galeri Artis - Euphoria: A Night of Modern Beats</div>
        <div class="row">
            <!-- Rizky Febian -->
            <div class="col-md-4">
                <div class="artist-card">
                    <img src="gambar/rizky.jpeg" alt="Rizky Febian" data-toggle="modal" data-target="#imageModal" data-src="rizky.jpeg">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h5>Rizky Febian</h5>
                            <p>Rizky Febian, lahir pada 25 Februari 1998 di Bandung, adalah seorang penyanyi Indonesia yang dikenal dengan suaranya yang khas dan lagu-lagu hitsnya seperti "Kesempurnaan Cinta," "Cukup Tau," "Menari," dan "Penantian Berharga." Putra komedian Sule ini mulai meraih popularitas pada tahun 2015 dengan "Kesempurnaan Cinta," yang membawa namanya melambung di industri musik.</p>
                        </div>
                    </div>
                    <h5>Rizky Febian</h5>
                    <div class="social-icons">
                        <a href=""><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Mahalini Raharja -->
            <div class="col-md-4">
                <div class="artist-card">
                    <img src="gambar/mahalini-01.jpg" alt="Mahalini Raharja" data-toggle="modal" data-target="#imageModal" data-src="mahalini.jpeg">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h5>Mahalini Raharja</h5>
                            <p>Mahalini lahir di Denpasar, 4 Maret 2000; umur 21 tahun. Namanya mulai banyak dikenal publik atas keikutsertaannya dalam ajang pencarian bakat bernyanyi Indonesia Idol (musim kesepuluh) dan berhasil mencuri perhatian juri lewat babak audisinya dengan teknik vokal yang bagus dan di perhitungkan. Single solo Mahalini pertama berjudul Melawan Restu.</p>
                        </div>
                    </div>
                    <h5>Mahalini Raharja</h5>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Salma Salsabila -->
            <div class="col-md-4">
                <div class="artist-card">
                    <img src="gambar/salma.jpeg" alt="Salma Salsabila" data-toggle="modal" data-target="#imageModal" data-src="salma.jpg">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h5>Salma Salsabila</h5>
                            <p>Salma Salsabila, lahir pada 8 November 2000, adalah seorang penyanyi Indonesia yang dikenal dengan suaranya yang merdu dan lagu-lagu hitsnya seperti "Kenangan Terindah," "Rindu," dan "Selamanya." Penyanyi berbakat ini mulai meraih popularitas setelah mengikuti ajang pencarian bakat pada tahun 2019, yang membawa namanya melambung di industri musik. 
                            </p>
                        </div>
                    </div>
                    <h5>Salma Salsabila</h5>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Tiara Andini -->
            <div class="col-md-4">
                <div class="artist-card">
                    <img src="gambar/tiara.jpg" alt="Tiara Andini" data-toggle="modal" data-target="#imageModal" data-src="tiara.jpg">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h5>Tiara Andini</h5>
                            <p>Tiara Andini, lahir pada 23 September 2001 di Jember, adalah seorang penyanyi Indonesia yang dikenal dengan suaranya yang khas dan lagu-lagu hitsnya seperti "Gemintang Hatiku," "Maafkan Aku #TerlanjurMencinta," dan "365." Finalis Indonesian Idol 2019 ini mulai meraih popularitas dengan suara emasnya yang memukau banyak orang. Tiara telah menerima berbagai penghargaan, termasuk Anugerah Musik Indonesia (AMI) Awards.</p>
                        </div>
                    </div>
                    <h5>Tiara Andini</h5>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Lyodra Ginting -->
            <div class="col-md-4">
                <div class="artist-card">
                    <img src="gambar/lyodra.jpg" alt="Lyodra Ginting" data-toggle="modal" data-target="#imageModal" data-src="lyodra.jpg">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h5>Lyodra Ginting</h5>
                            <p>Lyodra Ginting, lahir pada 21 Juni 2003 di Medan, adalah seorang penyanyi Indonesia yang dikenal dengan suaranya yang kuat dan lagu-lagu hitsnya seperti "Gemintang Hatiku," "Mengapa Kita #TerlanjurMencinta," dan "Kalau Bosan." Juara Indonesian Idol 2019 ini mulai meraih popularitas dengan kemampuan vokalnya yang luar biasa. Lyodra telah menerima berbagai penghargaan, termasuk Anugerah Musik Indonesia (AMI) Awards.</p>
                        </div>
                    </div>
                    <h5>Lyodra Ginting</h5>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Andmesh -->
            <div class="col-md-4">
                <div class="artist-card">
                    <img src="gambar/andmash.jpeg" alt="Andmesh" data-toggle="modal" data-target="#imageModal" data-src="andmesh.jpg">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h5>Andmesh</h5>
                            <p>Andmesh Kamaleng, lahir pada 15 April 1997 di Kupang, adalah seorang penyanyi Indonesia yang dikenal dengan suaranya yang khas dan lagu-lagu hitsnya seperti "Hanya Rindu," "Cinta Luar Biasa," dan "Nyaman." Pemenang ajang pencarian bakat Rising Star Indonesia 2016 ini mulai meraih popularitas dengan lagu-lagu yang menyentuh hati.</p>
                        </div>
                    </div>
                    <h5>Andmesh</h5>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Nadin Amizah -->
            <div class="col-md-4">
                <div class="artist-card">
                    <img src="gambar/nadin.jpeg" alt="Nadin Amizah" data-toggle="modal" data-target="#imageModal" data-src="nadin.jpg">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h5>Nadin Amizah</h5>
                            <p>Nadin Amizah, lahir pada 28 Mei 2000 di Jakarta, adalah seorang penyanyi dan penulis lagu Indonesia yang dikenal dengan suaranya yang lembut dan lagu-lagu hitsnya seperti "Rumpang," "Sorai," dan "Bertaut." Penyanyi dan penulis lagu berbakat ini mulai meraih popularitas setelah merilis lagu-lagu yang penuh makna dan emosi.</p>
                        </div>
                    </div>
                    <h5>Nadin Amizah</h5>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Nadhif Basmalah -->
            <div class="col-md-4">
                <div class="artist-card">
                    <img src="gambar/nadhif.webp" alt="Nadhif Basalamah" data-toggle="modal" data-target="#imageModal" data-src="nadhif.jpg">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h5>Nadhif Basalamah</h5>
                            <p>Nadhif Basalamah, lahir pada 10 Januari 2001, adalah seorang penyanyi Indonesia yang dikenal dengan suaranya yang lembut dan lagu-lagu hitsnya seperti "Hati yang Tulus," "Selalu Bersamamu," dan "Mimpi Indah." Penyanyi ini mulai meraih popularitas setelah mengikuti ajang pencarian bakat dan menunjukkan kemampuan vokalnya yang memukau.</p>
                        </div>
                    </div>
                    <h5>Nadhif Basalamah</h5>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Keisya Levronka -->
            <div class="col-md-4">
                <div class="artist-card">
                    <img src="gambar/keysa.jpeg.jpg" alt="Keysa Levronka" data-toggle="modal" data-target="#imageModal" data-src="rony.jpg">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h5>Keiysa Levronka</h5>
                            <p>Keiysa Levronka, lahir pada 10 Januari 2001, adalah seorang penyanyi Indonesia yang dikenal dengan suaranya yang merdu dan lagu-lagu hitsnya seperti "Bersamamu," "Selamanya," dan "Impian." Penyanyi ini mulai meraih popularitas setelah mengikuti ajang pencarian bakat dan menunjukkan kemampuan vokalnya yang mengesankan.</p>
                        </div>
                    </div>
                    <h5>Keiysa Levronka</h5>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Gambar -->
    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="imageModalLabel">Gambar Artis</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <img id="modalImage" src="" alt="Gambar Artis" class="img-fluid">
                </div>

            </div>
        </div>
    </div>

    <!-- JavaScript Bootstrap dan jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        $('#imageModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var imageUrl = button.data('src');
            var modal = $(this);
            modal.find('#modalImage').attr('src', imageUrl);
        });
    </script>
</body>
</html>
<footer><jsp:include page="footer.jsp" /></footer>