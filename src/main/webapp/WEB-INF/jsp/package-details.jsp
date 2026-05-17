<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Package Details | Ceylon Trails</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" type="image/png" href="assets/images/favicon.png">
    <style>
        .hero-section {
            padding: 100px 0 40px;
            background-color: var(--primary-color);
        }
        .package-img-large {
            width: 100%;
            height: 450px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            margin-bottom: 30px;
        }
        .review-card {
            background-color: rgba(255,255,255,0.05);
            border: 1px solid rgba(212, 175, 55, 0.2);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .star-rating i { color: #ccc; }
        .star-rating i.active { color: var(--accent-color); }
        .sticky-booking {
            position: sticky;
            top: 100px;
            z-index: 10;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="index.html">Ceylon Trails</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto" id="nav-links">
                    <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="packages.html">Experiences</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="hero-section">
        <div class="container mt-4">
            <div class="row">
                <!-- Left Column: Package Details & Reviews -->
                <div class="col-lg-8" id="left-column">
                    <div id="package-content" class="text-light text-center">
                        <div class="spinner-border text-warning" role="status"></div>
                        <p class="mt-2">Loading Package Details...</p>
                    </div>

                    <div class="mt-5 text-light" id="reviews-section" style="display: none;">
                        <h3 style="color: var(--accent-color); font-family: var(--font-heading);" class="mb-4 border-bottom pb-2">Traveler Reviews</h3>
                        <div id="reviews-container">
                            <p class="text-muted">Loading reviews...</p>
                        </div>
                        
                        <div class="card mt-4" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                            <div class="card-body">
                                <h5 class="card-title text-light mb-4">Leave a Review</h5>
                                <form id="reviewForm" onsubmit="submitReview(event)">
                                    <div class="row">
                                        <div class="col-md-3 mb-3">
                                            <label class="form-label text-muted">Rating</label>
                                            <select class="form-select bg-dark text-light border-secondary" id="reviewRating" required>
                                                <option value="5">5 - Excellent</option>
                                                <option value="4">4 - Very Good</option>
                                                <option value="3">3 - Average</option>
                                                <option value="2">2 - Poor</option>
                                                <option value="1">1 - Terrible</option>
                                            </select>
                                        </div>
                                        <div class="col-md-9 mb-3">
                                            <label class="form-label text-muted">Comment</label>
                                            <textarea class="form-control bg-dark text-light border-secondary" id="reviewComment" rows="2" required></textarea>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-gold">Submit Review</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Sticky Booking Sidebar -->
                <div class="col-lg-4" id="right-column" style="display: none;">
                    <div class="card sticky-booking" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                        <div class="card-body">
                            <h4 class="card-title text-light mb-4" style="font-family: var(--font-heading);">Book This Package</h4>
                            
                            <div class="d-flex justify-content-between mb-3 border-bottom border-secondary pb-2">
                                <span class="text-muted">Base Price</span>
                                <strong class="text-warning" id="display-base-price">LKR 0</strong>
                            </div>

                            <form id="bookingForm">
                                <div class="mb-3">
                                    <label class="form-label text-light">Arrival Date</label>
                                    <input type="date" class="form-control bg-dark text-light border-secondary" id="b-arrival" required>
                                </div>
                                <div class="row g-2 mb-3">
                                    <div class="col-6">
                                        <label class="form-label text-light">Duration (Days)</label>
                                        <input type="number" class="form-control bg-dark text-light border-secondary" id="b-duration" required min="1" value="1" onchange="calculatePrice()">
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label text-light">Travelers</label>
                                        <input type="number" class="form-control bg-dark text-light border-secondary" id="b-travelers" required min="1" value="1" onchange="calculatePrice()">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-light">Tour Guide <small class="text-muted">(+10k/day)</small></label>
                                    <select class="form-select bg-dark text-light border-secondary" id="b-guide" onchange="calculatePrice()">
                                        <option value="None">No Guide Needed</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-light">Transport <small class="text-muted">(+15k/day)</small></label>
                                    <select class="form-select bg-dark text-light border-secondary" id="b-transport" onchange="calculatePrice()">
                                        <option value="None">No Transport Needed</option>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label text-light">Additional Destinations <small class="text-muted">(LKR 5k each)</small></label>
                                    <div id="dest-checkboxes" class="p-3 bg-dark rounded border border-secondary" style="max-height: 150px; overflow-y: auto;">
                                        <p class="text-muted small">Loading destinations...</p>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between mt-4 mb-3 border-top border-secondary pt-3">
                                    <span class="text-light" style="font-size: 1.1rem;">Total Estimated</span>
                                    <h4 class="text-warning" id="display-total-price">LKR 0</h4>
                                </div>

                                <button type="button" class="btn btn-gold-solid w-100 py-2" style="font-size: 1.1rem;" onclick="submitBookingBtn()"><i class="fas fa-check-circle me-2"></i> Confirm Booking</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer py-4 mt-5">
        <div class="container text-center">
            <p class="text-muted mb-0">&copy; 2026 Ceylon Trails. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Toast Notification -->
    <div class="custom-toast" id="notification-toast">
        <div id="toast-message"></div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/main.js"></script>
    
    <script>
        const urlParams = new URLSearchParams(window.location.search);
        const packageId = urlParams.get('id');
        let currentPackage = null;
        let basePackagePrice = 0;

        document.addEventListener("DOMContentLoaded", () => {
            if (!packageId) {
                window.location.href = "packages.html";
                return;
            }
            loadPackageDetails();
            loadReviews();
            loadProviders();
            loadAdditionalDestinations();
        });

        function loadPackageDetails() {
            fetch('/api/packages', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    const pkg = data.find(p => p.id === packageId);
                    if (pkg) {
                        currentPackage = pkg;
                        
                        // Render Left Column
                        document.getElementById("package-content").innerHTML = `
                            <img src="\${pkg.image}" class="package-img-large" alt="\${pkg.title}">
                            <div class="text-start">
                                <h1 style="font-family: var(--font-heading); color: var(--accent-color);">\${pkg.title}</h1>
                                <div class="d-flex gap-4 my-3">
                                    <span class="badge bg-secondary p-2"><i class="far fa-clock text-warning me-2"></i>\${pkg.duration}</span>
                                    <span class="badge bg-secondary p-2"><i class="fas fa-tag text-warning me-2"></i>\${pkg.price} Base</span>
                                </div>
                                <p class="lead text-light" style="line-height: 1.8;">\${pkg.description}</p>
                            </div>
                        `;
                        document.getElementById("package-content").classList.remove("text-center");
                        
                        // Setup Right Column
                        document.getElementById("reviews-section").style.display = "block";
                        document.getElementById("right-column").style.display = "block";

                        document.getElementById("display-base-price").innerText = pkg.price;
                        
                        // Parse base price
                        const priceStr = pkg.price.replace(/[^0-9]/g, '');
                        if (priceStr) basePackagePrice = parseInt(priceStr);

                        // Parse duration for default
                        const daysMatch = pkg.duration.match(/(\d+)\s*Days/i);
                        if (daysMatch) document.getElementById("b-duration").value = daysMatch[1];

                        calculatePrice();
                    } else {
                        document.getElementById("package-content").innerHTML = `<h4>Package Not Found</h4>`;
                    }
                })
                .catch(err => console.error(err));
        }

        function calculatePrice() {
            if (!currentPackage) return;
            
            const duration = parseInt(document.getElementById("b-duration").value) || 1;
            const travelers = parseInt(document.getElementById("b-travelers").value) || 1;
            const hasGuide = document.getElementById("b-guide").value !== "None";
            const hasTransport = document.getElementById("b-transport").value !== "None";

            // Calculation logic
            // Base package price applies for 1 traveler for the default duration.
            // Let's make a simple logic: Base Price + Extra Travelers (50,000 each) + Guide (10k/day) + Transport (15k/day)
            let extraTravelerCost = (travelers > 1) ? (travelers - 1) * 50000 : 0;
            let guideCost = hasGuide ? (10000 * duration) : 0;
            let transportCost = hasTransport ? (15000 * duration) : 0;
            
            // Just adjusting duration price linearly if they extend beyond base
            // Assuming base package duration is around 5 days. We'll just add 20k per extra day above base.
            let extraDaysCost = 0;
            const daysMatch = currentPackage.duration.match(/(\d+)\s*Days/i);
            const baseDays = daysMatch ? parseInt(daysMatch[1]) : 5;
            if (duration > baseDays) {
                extraDaysCost = (duration - baseDays) * 20000 * travelers;
            }

            const total = basePackagePrice + extraTravelerCost + guideCost + transportCost + extraDaysCost;

            // Additional Destinations cost
            const checkedDest = document.querySelectorAll('#dest-checkboxes input:checked');
            const destCost = checkedDest.length * 5000 * travelers;

            document.getElementById("display-total-price").innerText = "LKR " + (total + destCost).toLocaleString();
        }

        function loadAdditionalDestinations() {
            fetch('/api/destinations', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    const container = document.getElementById("dest-checkboxes");
                    container.innerHTML = '';
                    data.forEach(d => {
                        const div = document.createElement("div");
                        div.className = "form-check mb-1";
                        div.innerHTML = `
                            <input class="form-check-input" type="checkbox" value="\${d.name}" id="dest-\${d.id}" onchange="calculatePrice()">
                            <label class="form-check-label text-light small" for="dest-\${d.id}">\${d.name}</label>
                        `;
                        container.appendChild(div);
                    });
                });
        }

        function loadReviews() {
            fetch('/api/reviews', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    const actualReviews = data.filter(r => r.packageId === packageId);
                    const container = document.getElementById("reviews-container");
                    if (actualReviews.length === 0) {
                        container.innerHTML = `<p class="text-muted">No reviews yet. Be the first to review this package!</p>`;
                        return;
                    }

                    container.innerHTML = '';
                    actualReviews.forEach(r => {
                        let stars = '';
                        for(let i=1; i<=5; i++) {
                            stars += `<i class="fas fa-star \${i <= r.rating ? 'active' : ''}"></i>`;
                        }

                        const currentUser = localStorage.getItem("userEmail");
                        const isAdmin = localStorage.getItem("userRole") === "admin";
                        const isOwner = currentUser === r.userEmail;

                        let actionButtons = '';
                        if (isOwner) {
                            actionButtons = `
                                <div class="mt-2 border-top border-secondary pt-2">
                                    <button class="btn btn-sm btn-link text-info p-0 me-3" onclick="editReviewInline('\${r.id}', \${r.rating}, '\${r.comment.replace(/'/g, "\\'")}')" title="Edit"><i class="fas fa-edit"></i> Edit</button>
                                    <button class="btn btn-sm btn-link text-danger p-0" onclick="deleteReviewInline('\${r.id}')" title="Delete"><i class="fas fa-trash"></i> Delete</button>
                                </div>
                            `;
                        } else if (isAdmin) {
                            actionButtons = `
                                <div class="mt-2 border-top border-secondary pt-2">
                                    <button class="btn btn-sm btn-link text-danger p-0" onclick="deleteReviewInline('\${r.id}')" title="Delete"><i class="fas fa-trash"></i> Delete</button>
                                </div>
                            `;
                        }
                        
                        container.innerHTML += `
                            <div class="review-card" id="review-\${r.id}">
                                <div class="d-flex justify-content-between mb-2">
                                    <strong><i class="fas fa-user-circle me-2"></i>\${r.userEmail}</strong>
                                    <span class="star-rating">\${stars}</span>
                                </div>
                                <p class="mb-1 text-light review-comment-text">\${r.comment}</p>
                                \${r.verified ? '<small class="text-success d-block mb-1"><i class="fas fa-check-circle me-1"></i>Verified Booking</small>' : ''}
                                <div class="review-actions-area">\${actionButtons}</div>
                            </div>
                        `;
                    });
                });
        }

        function editReviewInline(id, rating, comment) {
            const card = document.getElementById(`review-\${id}`);
            const commentText = card.querySelector('.review-comment-text');
            const actionsArea = card.querySelector('.review-actions-area');
            
            // Create inline editor
            commentText.innerHTML = `
                <div class="mt-2">
                    <label class="small text-muted mb-1">Update Rating:</label>
                    <select class="form-select form-select-sm bg-dark text-light border-secondary mb-2" id="edit-rating-\${id}" style="width: auto;">
                        <option value="5" \${rating === 5 ? 'selected' : ''}>5 Stars</option>
                        <option value="4" \${rating === 4 ? 'selected' : ''}>4 Stars</option>
                        <option value="3" \${rating === 3 ? 'selected' : ''}>3 Stars</option>
                        <option value="2" \${rating === 2 ? 'selected' : ''}>2 Stars</option>
                        <option value="1" \${rating === 1 ? 'selected' : ''}>1 Star</option>
                    </select>
                    <textarea class="form-control bg-dark text-light border-secondary mb-2" id="edit-comment-\${id}" rows="3">\${comment}</textarea>
                    <div class="d-flex gap-2">
                        <button class="btn btn-sm btn-gold-solid px-3" onclick="saveReviewAction('\${id}')">Save Changes</button>
                        <button class="btn btn-sm btn-outline-light" onclick="loadReviews()">Cancel</button>
                    </div>
                </div>
            `;
            // Hide the original action buttons during edit
            actionsArea.style.display = 'none';
        }

        function saveReviewAction(id) {
            const newComment = document.getElementById(`edit-comment-\${id}`).value;
            const newRating = document.getElementById(`edit-rating-\${id}`).value;

            if (!newComment.trim()) {
                showToast("Please enter a comment");
                return;
            }

            const payload = {
                rating: parseInt(newRating),
                comment: newComment,
                packageId: packageId
            };

            fetch(`/api/reviews/\${id}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            .then(res => {
                if (res.ok) {
                    showToast("Review updated successfully");
                    loadReviews();
                }
            });
        }

        function deleteReviewInline(id) {
            if (confirm("Permanently delete this review?")) {
                fetch(`/api/reviews/\${id}`, { method: 'DELETE' })
                    .then(res => {
                        if (res.ok) {
                            showToast("Review deleted");
                            loadReviews();
                        }
                    });
            }
        }

        function loadProviders() {
            fetch('/api/providers', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    const guideSelect = document.getElementById("b-guide");
                    const driverSelect = document.getElementById("b-transport");
                    
                    data.forEach(p => {
                        if (!p.available) return;
                        if (p.type === 'GUIDE') {
                            guideSelect.innerHTML += `<option value="\${p.name}">\${p.name} (\${p.extraInfo})</option>`;
                        } else if (p.type === 'DRIVER') {
                            driverSelect.innerHTML += `<option value="\${p.name}">\${p.name} (\${p.extraInfo})</option>`;
                        }
                    });
                });
        }

        function checkAuth() {
            const isLoggedIn = localStorage.getItem("isLoggedIn") === "true";
            if (!isLoggedIn) {
                sessionStorage.setItem("returnToPackage", packageId);
                window.location.href = "login.html";
                return false;
            }
            return true;
        }

        function submitBookingBtn() {
            if (!checkAuth()) return;
            
            const arrivalEl = document.getElementById("b-arrival");
            if (!arrivalEl.value) {
                showToast("Please select an arrival date.");
                arrivalEl.focus();
                return;
            }

            const payload = {
                userEmail: localStorage.getItem("userEmail"),
                arrivalDate: arrivalEl.value,
                duration: parseInt(document.getElementById("b-duration").value),
                travelers: parseInt(document.getElementById("b-travelers").value),
                status: "Pending",
                accommodation: document.getElementById("b-guide").value,
                transport: document.getElementById("b-transport").value,
                specialRequests: Array.from(document.querySelectorAll('#dest-checkboxes input:checked')).map(i => i.value).join(', '),
                packageId: packageId
            };

            fetch('/api/bookings', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            .then(res => {
                if(res.ok) {
                    showToast("Booking Successful! Check your profile.");
                    setTimeout(() => window.location.href = "profile.html", 2000);
                }
            });
        }

        function submitReview(e) {
            e.preventDefault();
            if (!checkAuth()) return;

            const payload = {
                userEmail: localStorage.getItem("userEmail"),
                rating: parseInt(document.getElementById("reviewRating").value),
                comment: document.getElementById("reviewComment").value,
                verified: false,
                packageId: packageId
            };

            fetch('/api/reviews', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            .then(res => res.json())
            .then(() => {
                document.getElementById("reviewComment").value = '';
                showToast("Review submitted successfully!");
                loadReviews(); 
            });
        }
    </script>
</body>
</html>
