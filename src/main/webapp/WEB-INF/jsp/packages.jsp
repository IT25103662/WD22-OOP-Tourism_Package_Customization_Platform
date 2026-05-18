<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Experiences | Ceylon Trails</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styles.css">
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="assets/images/favicon.png">
</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg fixed-top scrolled" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="index.html">Ceylon Trails</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars" style="color: var(--accent-color);"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="packages.html">Experiences</a></li>

                    <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Header -->
    <section class="section-padding mt-5 pb-0">
        <div class="container text-center pt-5">
            <h1 style="font-size: 3.5rem; margin-bottom: 20px;">Curated Experiences</h1>
            <div class="divider"></div>
            <p class="text-muted mt-4 mx-auto" style="max-width: 600px;">Explore our signature itineraries, designed to showcase the very best of Sri Lanka's heritage, nature, and luxury hospitality.</p>
        </div>
    </section>

    <!-- Packages List -->
    <section class="section-padding pt-5">
        <div class="container">
            <!-- Filter Options (UI Only) -->
            <div class="row g-4" id="all-packages">
                <!-- Dynamically loaded via JS -->
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row pt-4 text-center" style="border-top: 1px solid rgba(255,255,255,0.05);">
                <p class="footer-text mb-0">&copy; 2026 Ceylon Trails. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script src="js/main.js"></script>
</body>
</html>
