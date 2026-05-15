<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Ceylon Trails</title>
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
                    <li class="nav-item"><a class="nav-link" href="packages.html">Experiences</a></li>

                    <li class="nav-item"><a class="nav-link active" href="login.html">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Login Section -->
    <section class="section-padding" style="min-height: 100vh; display: flex; align-items: center;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="customization-wrapper text-center">
                        <div id="login-section">
                            <h2 class="mb-4" style="font-family: var(--font-heading);">Welcome Back</h2>
                            <p class="text-muted mb-4">Please log in to submit your customization request and manage your bookings.</p>
                            
                            <form id="login-form">
                                <div class="mb-4 text-start">
                                    <label class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="loginEmail" required placeholder="Enter your email">
                                </div>
                                <div class="mb-4 text-start">
                                    <label class="form-label">Password</label>
                                    <input type="password" class="form-control" id="loginPassword" required placeholder="Enter your password">
                                </div>
                                <button type="submit" class="btn btn-gold-solid w-100 py-3 mt-2">Log In</button>
                            </form>
                            
                            <div class="mt-4">
                                <a href="#" class="text-muted small">Forgot Password?</a>
                                <br>
                                <p class="text-muted small mt-3">Don't have an account? <a href="#" onclick="toggleAuth('signup')" style="color: var(--accent-color);">Sign Up</a></p>
                            </div>
                        </div>

                        <div id="signup-section" class="d-none">
                            <h2 class="mb-4" style="font-family: var(--font-heading);">Create Account</h2>
                            <p class="text-muted mb-4">Join Ceylon Trails for exclusive access to bespoke travel packages.</p>
                            
                            <form id="signup-form">
                                <div class="mb-4 text-start">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="signupName" required placeholder="Enter your full name">
                                </div>
                                <div class="mb-4 text-start">
                                    <label class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="signupEmail" required placeholder="Enter your email">
                                </div>
                                <div class="mb-4 text-start">
                                    <label class="form-label">Password</label>
                                    <input type="password" class="form-control" id="signupPassword" required placeholder="Create a password">
                                </div>
                                <div class="row g-3">
                                    <div class="col-md-6 mb-4 text-start">
                                        <label class="form-label">Phone Number</label>
                                        <input type="text" class="form-control" id="signupPhone" required placeholder="+94...">
                                    </div>
                                    <div class="col-md-6 mb-4 text-start">
                                        <label class="form-label">Country</label>
                                        <input type="text" class="form-control" id="signupCountry" required placeholder="Your country">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-gold-solid w-100 py-3 mt-2">Sign Up</button>
                            </form>
                            
                            <div class="mt-4">
                                <p class="text-muted small mt-3">Already have an account? <a href="#" onclick="toggleAuth('login')" style="color: var(--accent-color);">Log In</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Custom Toast Notification -->
    <div id="notification-toast" class="custom-toast">
        <span id="toast-message">Message</span>
    </div>

    <!-- Custom JS for Login -->
    <script>
        function toggleAuth(type) {
            if (type === 'signup') {
                document.getElementById('login-section').classList.add('d-none');
                document.getElementById('signup-section').classList.remove('d-none');
            } else {
                document.getElementById('signup-section').classList.add('d-none');
                document.getElementById('login-section').classList.remove('d-none');
            }
        }

        document.getElementById("login-form").addEventListener("submit", function(e) {
            e.preventDefault();
            
            const btn = e.target.querySelector('button[type="submit"]');
            const originalText = btn.innerText;
            btn.innerText = "Authenticating...";
            btn.disabled = true;

            const email = document.getElementById("loginEmail").value;
            const password = document.getElementById("loginPassword").value;

            fetch('/api/users/login', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ email: email, password: password })
            })
            .then(res => {
                if (!res.ok) throw new Error("Invalid credentials");
                return res.json();
            })
            .then(user => {
                localStorage.setItem("isLoggedIn", "true");
                localStorage.setItem("userEmail", user.email);
                localStorage.setItem("userRole", user.role);
                if (user.name) {
                    localStorage.setItem("userName", user.name);
                } else {
                    localStorage.removeItem("userName");
                }
                localStorage.setItem("userPhone", user.phoneNumber || "N/A");
                localStorage.setItem("userCountry", user.country || "N/A");

                const urlParams = new URLSearchParams(window.location.search);
                const redirectPage = urlParams.get('redirect');
                const autoSubmit = urlParams.get('autosubmit');

                if (user.role === "admin") {
                    showToast("Login successful! Redirecting to Admin Panel...");
                    setTimeout(() => window.location.href = "admin.html", 1500);
                } else if (redirectPage) {
                    showToast("Login successful! Redirecting...");
                    let redirectUrl = redirectPage;
                    if (autoSubmit === 'true') {
                        redirectUrl += "?autosubmit=true";
                    }
                    setTimeout(() => window.location.href = redirectUrl, 1500);
                } else if (sessionStorage.getItem("returnToPackage")) {
                    const pkgId = sessionStorage.getItem("returnToPackage");
                    sessionStorage.removeItem("returnToPackage");
                    showToast("Login successful! Returning to package...");
                    setTimeout(() => window.location.href = "package-details.html?id=" + pkgId, 1500);
                } else {
                    showToast("Login successful! Redirecting to Experiences...");
                    setTimeout(() => window.location.href = "packages.html", 1500);
                }
            })
            .catch(err => {
                showToast(err.message);
                btn.innerText = originalText;
                btn.disabled = false;
            });
        });

        document.getElementById("signup-form").addEventListener("submit", function(e) {
            e.preventDefault();
            const btn = e.target.querySelector('button[type="submit"]');
            const originalText = btn.innerText;
            btn.innerText = "Creating Account...";
            btn.disabled = true;

            const email = document.getElementById("signupEmail").value;
            const password = document.getElementById("signupPassword").value;
            const name = document.getElementById("signupName").value;
            const phoneNumber = document.getElementById("signupPhone").value;
            const country = document.getElementById("signupCountry").value;

            fetch('/api/users/signup', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ email: email, password: password, name: name, phoneNumber: phoneNumber, country: country })
            })
            .then(res => {
                if (!res.ok) throw new Error("Email already exists");
                return res.json();
            })
            .then(user => {
                showToast("Account successfully created! Please log in to continue.");
                btn.innerText = originalText;
                btn.disabled = false;
                e.target.reset(); // Clear signup form
                
                // Pre-fill login email
                document.getElementById("loginEmail").value = email;
                
                // Switch to login tab
                toggleAuth('login');
            })
            .catch(err => {
                alert(err.message);
                btn.innerText = originalText;
                btn.disabled = false;
            });
        });

        function showToast(message) {
            const toast = document.getElementById("notification-toast");
            const toastMsg = document.getElementById("toast-message");
            
            if (toast && toastMsg) {
                toastMsg.innerText = message;
                toast.classList.add("show");
                
                setTimeout(() => {
                    toast.classList.remove("show");
                }, 4000);
            }
        }
    </script>
</body>
</html>
