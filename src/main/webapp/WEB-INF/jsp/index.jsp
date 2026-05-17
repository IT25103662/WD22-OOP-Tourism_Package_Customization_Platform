<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ceylon Trails | Premium Sri Lanka Tours</title>
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
    <nav class="navbar navbar-expand-lg fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="index.html">Ceylon Trails</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars" style="color: var(--accent-color);"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="packages.html">Experiences</a></li>

                    <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero" id="hero-header">
        <div class="hero-content">
            <div class="hero-subtitle">Curated Journeys in Sri Lanka</div>
            <h1 class="hero-title">Discover the Extraordinary</h1>
            <div class="hero-btn-group mt-4">
                <a href="packages.html" class="btn btn-gold me-3">Explore Packages</a>
                <a href="customize.html" class="btn btn-gold-solid">Craft Your Journey</a>
            </div>
        </div>
    </header>

    <!-- Featured Experiences -->
    <section class="section-padding" id="experiences">
        <div class="container">
            <div class="section-title">
                <h2>Signature Experiences</h2>
                <div class="divider"></div>
                <p class="mt-4 text-muted">Immerse yourself in the rich tapestry of Sri Lankan culture, wildlife, and landscapes with our carefully curated luxury packages.</p>
            </div>
            
            <div class="row g-4" id="featured-packages">
                <!-- Packages will be loaded here via JS -->
            </div>
            
            <div class="text-center mt-5">
                <a href="packages.html" class="btn btn-gold">View All Experiences</a>
            </div>
        </div>
    </section>

    <!-- Customization Teaser -->
    <section class="section-padding" style="background-color: var(--secondary-color);">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <h2 class="mb-4" style="font-family: var(--font-heading);">Your Journey, Your Way</h2>
                    <div class="divider" style="margin: 0 0 30px 0;"></div>
                    <p class="text-muted mb-4" style="line-height: 1.8;">
                        Every traveler is unique, and so should be their journey. Our bespoke travel design service allows you to craft the perfect itinerary tailored to your specific desires, pace, and interests.
                    </p>
                    <ul class="list-unstyled mb-5 text-muted">
                        <li class="mb-3"><i class="fas fa-check text-warning me-2"></i> Select your preferred accommodation style</li>
                        <li class="mb-3"><i class="fas fa-check text-warning me-2"></i> Handpick unique local experiences</li>
                        <li class="mb-3"><i class="fas fa-check text-warning me-2"></i> Choose your ideal mode of transport</li>
                        <li class="mb-3"><i class="fas fa-check text-warning me-2"></i> Expert guidance from our local concierges</li>
                    </ul>
                    <a href="packages.html" class="btn btn-gold-solid">View Packages</a>
                </div>
                <div class="col-lg-6">
                    <div class="position-relative">
                        <div style="border: 2px solid var(--accent-color); position: absolute; top: 20px; left: 20px; right: -20px; bottom: -20px; z-index: 0;"></div>
                        <img src="assets/images/sigiriya.png" alt="Customization" class="img-fluid position-relative" style="z-index: 1;">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <a href="#" class="footer-brand">Ceylon Trails</a>
                    <p class="footer-text mt-3">Redefining luxury travel in Sri Lanka. Experience the teardrop island in unparalleled comfort and style.</p>
                    <div class="mt-4">
                        <a href="#" class="me-3 fs-5"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="me-3 fs-5"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="fs-5"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-2 col-md-6 mb-5 mb-lg-0">
                    <h5 class="text-white mb-4" style="font-family: var(--font-body); font-size: 1rem; letter-spacing: 2px;">QUICK LINKS</h5>
                    <ul class="footer-links">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="packages.html">Experiences</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-6">
                    <h5 class="text-white mb-4" style="font-family: var(--font-body); font-size: 1rem; letter-spacing: 2px;">CONTACT US</h5>
                    <ul class="footer-links">
                        <li class="mb-3"><i class="fas fa-map-marker-alt me-2 text-warning"></i> 123 Galle Road, Colombo 03, Sri Lanka</li>
                        <li class="mb-3"><i class="fas fa-phone-alt me-2 text-warning"></i> +94 11 234 5678</li>
                        <li><i class="fas fa-envelope me-2 text-warning"></i> reservations@ceylontrails.com</li>
                    </ul>
                </div>
            </div>
            <div class="row mt-5 pt-4" style="border-top: 1px solid rgba(255,255,255,0.05);">
                <div class="col-md-6 text-center text-md-start">
                    <p class="footer-text mb-0">&copy; 2026 Ceylon Trails. All Rights Reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end mt-3 mt-md-0">
                    <a href="#" class="footer-text me-3">Privacy Policy</a>
                    <a href="#" class="footer-text">Terms of Service</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Custom Toast Notification -->
    <div id="notification-toast" class="custom-toast">
        <span id="toast-message">Message</span>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script src="js/main.js"></script>
    <script>
        // Set Hero Background dynamically
        document.addEventListener("DOMContentLoaded", function() {
            const hero = document.getElementById("hero-header");
            if(hero) {
                hero.style.backgroundImage = "url('assets/images/hero.png')";
            }
        });
    </script>
</body>
</html>
