<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | Ceylon Trails</title>
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

                    <li class="nav-item"><a class="nav-link active" href="profile.html">Profile</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Profile Section -->
    <section class="section-padding mt-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="customization-wrapper text-center">
                        <div class="mb-4">
                            <div class="profile-avatar mb-3">
                                <i class="fas fa-user"></i>
                            </div>
                        </div>
                        <h4 style="font-family: var(--font-heading);" id="profile-name">User</h4>
                        <p class="text-muted small mb-1" id="profile-email">Email</p>
                        <div class="text-start mt-4 border-top border-secondary pt-3">
                            <p class="mb-1 text-muted small"><i class="fas fa-phone me-2"></i>Phone: <span id="profile-phone" class="text-light"></span></p>
                            <p class="mb-2 text-muted small"><i class="fas fa-globe me-2"></i>Country: <span id="profile-country" class="text-light"></span></p>
                            <button class="btn btn-sm btn-outline-gold w-100 mt-2" onclick="openEditProfileModal()"><i class="fas fa-edit me-2"></i>Edit Profile</button>
                        </div>
                        <button class="btn btn-gold w-100 mt-3" onclick="logout()">Log Out</button>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="customization-wrapper">
                        <h4 class="mb-4" style="font-family: var(--font-heading);">My Bookings</h4>
                        
                        <div class="table-responsive">
                            <table class="table table-dark table-hover" style="background-color: transparent;">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Duration</th>
                                        <th>Travelers</th>
                                        <th>Status</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody id="user-bookings-table">
                                    <!-- Populated via JS -->
                                </tbody>
                            </table>
                        </div>
                        <div id="no-bookings" class="text-center text-muted d-none mt-4">
                            <p>You have no pending or confirmed bookings yet.</p>
                            <a href="packages.html" class="btn btn-gold mt-2">View Packages</a>
                        </div>
                        <div class="customization-wrapper mt-4">
                            <h4 class="mb-4" style="font-family: var(--font-heading);">My Reviews</h4>
                            <div id="user-reviews-list" class="row g-3">
                                <!-- Cards populated via JS -->
                            </div>
                            <div id="no-reviews" class="text-center mt-3 d-none">
                                <p class="text-muted">You haven't written any reviews yet.</p>
                            </div>
                        </div>
                </div>
                </div>
            </div>
        </div>
    </section>

    </div>
    <div class="modal fade" id="profileViewModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                <div class="modal-header border-0">
                    <h5 class="modal-title" style="color: var(--accent-color);"><i class="fas fa-eye me-2"></i>Your Journey Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body text-light">
                    <div class="row mb-2">
                        <div class="col-5 text-muted">Arrival Date:</div>
                        <div class="col-7" id="p-view-arrival"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-5 text-muted">Duration:</div>
                        <div class="col-7" id="p-view-duration"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-5 text-muted">Travelers:</div>
                        <div class="col-7" id="p-view-travelers"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-5 text-muted">Tour Guide:</div>
                        <div class="col-7" id="p-view-acc" style="text-transform: capitalize;"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-5 text-muted">Transport:</div>
                        <div class="col-7" id="p-view-transport" style="text-transform: capitalize;"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-5 text-muted">Extra Places:</div>
                        <div class="col-7 text-warning small" id="p-view-extra-dest"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-5 text-muted">Status:</div>
                        <div class="col-7"><span class="badge bg-secondary" id="p-view-status"></span></div>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-sm btn-outline-light" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Profile Modal -->
    <div class="modal fade" id="editProfileModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                <div class="modal-header border-0">
                    <h5 class="modal-title" style="color: var(--accent-color);"><i class="fas fa-user-edit me-2"></i>Edit Profile</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editProfileForm" onsubmit="updateProfile(event)">
                        <div class="mb-3">
                            <label class="form-label text-light">Full Name</label>
                            <input type="text" class="form-control bg-dark text-light border-secondary" id="edit-name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-light">Phone Number</label>
                            <input type="text" class="form-control bg-dark text-light border-secondary" id="edit-phone" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-light">Country</label>
                            <input type="text" class="form-control bg-dark text-light border-secondary" id="edit-country" required>
                        </div>
                        <button type="submit" class="btn btn-gold w-100 mt-2">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Custom JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const isLoggedIn = localStorage.getItem("isLoggedIn") === "true";
            const userEmail = localStorage.getItem("userEmail");
            
            if (!isLoggedIn || localStorage.getItem("userRole") === "admin") {
                window.location.href = "login.html";
                return;
            }
            
            const uName = localStorage.getItem("userName") || "Valued Traveler";
            const uEmail = localStorage.getItem("userEmail");
            const uPhone = localStorage.getItem("userPhone") || "N/A";
            const uCountry = localStorage.getItem("userCountry") || "N/A";

            document.getElementById("profile-name").innerText = uName;
            document.getElementById("profile-email").innerText = uEmail;
            document.getElementById("profile-phone").innerText = uPhone;
            document.getElementById("profile-country").innerText = uCountry;

            // Load bookings from API
            loadMyBookings(uEmail);
            loadUserReviews(uEmail);
        });

        function loadMyBookings(uEmail) {
            fetch('/api/bookings', { cache: 'no-store' })
                .then(res => res.json())
                .then(allBookings => {
                    let myBookings = allBookings.filter(b => b.userEmail === uEmail);
                    window.userBookingsList = myBookings;
                    
                    const tbody = document.getElementById("user-bookings-table");
                    tbody.innerHTML = '';
                    if (myBookings.length === 0) {
                        document.getElementById("no-bookings").classList.remove("d-none");
                    } else {
                        document.getElementById("no-bookings").classList.add("d-none");
                        myBookings.forEach(b => {
                            let statusBadge = '';
                            if (b.status === "Pending") statusBadge = '<span class="badge bg-warning text-dark">Pending</span>';
                            else if (b.status === "Confirmed") statusBadge = '<span class="badge bg-success">Confirmed</span>';
                            else statusBadge = `<span class="badge bg-secondary">\${b.status}</span>`;

                            let tr = document.createElement("tr");
                            tr.innerHTML = `
                                <td>\${b.arrivalDate || 'N/A'}</td>
                                <td>\${b.duration} Days</td>
                                <td>\${b.travelers} Pax</td>
                                <td>\${statusBadge}</td>
                                <td><button class="btn btn-sm btn-outline-light" onclick="openProfileViewModal('\${b.id}')">View</button></td>
                            `;
                            tbody.appendChild(tr);
                        });
                    }
                })
                .catch(err => console.error("Error loading bookings:", err));
        }

        function loadUserReviews(uEmail) {
            fetch('/api/reviews', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    const myReviews = data.filter(r => r.userEmail === uEmail);
                    const container = document.getElementById("user-reviews-list");
                    container.innerHTML = '';
                    
                    if (myReviews.length === 0) {
                        document.getElementById("no-reviews").classList.remove("d-none");
                    } else {
                        document.getElementById("no-reviews").classList.add("d-none");
                        myReviews.forEach(r => {
                            let stars = '';
                            for(let i=1; i<=5; i++) {
                                stars += `<i class="fas fa-star \${i <= r.rating ? 'text-warning' : 'text-muted'}"></i>`;
                            }

                            let col = document.createElement("div");
                            col.className = "col-md-6";
                            col.innerHTML = `
                                <a href="package-details.html?id=\${r.packageId}#review-\${r.id}" class="text-decoration-none">
                                    <div class="card bg-dark border-secondary h-100 review-hover-card" style="transition: transform 0.2s;">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="badge bg-gold-outline text-gold small">\${r.packageId}</span>
                                                <div>\${stars}</div>
                                            </div>
                                            <p class="card-text text-light small text-truncate">\${r.comment}</p>
                                        </div>
                                    </div>
                                </a>
                            `;
                            container.appendChild(col);
                        });
                    }
                });
        }

        let currentActiveReview = null;

        function deleteReview(id) {
            if (confirm("Delete this review?")) {
                fetch(`/api/reviews/\${id}`, { method: 'DELETE' })
                    .then(res => {
                        if (res.ok) {
                            showToast("Review deleted");
                            loadUserReviews(localStorage.getItem("userEmail"));
                        }
                    });
            }
        }

        function editReview(id, rating, comment) {
            const newComment = prompt("Update your review:", comment);
            if (newComment === null) return;
            const newRating = prompt("Update rating (1-5):", rating);
            if (newRating === null) return;

            const payload = {
                rating: parseInt(newRating),
                comment: newComment
            };

            fetch(`/api/reviews/\${id}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            .then(res => {
                if (res.ok) {
                    showToast("Review updated");
                    loadUserReviews(localStorage.getItem("userEmail"));
                }
            });
        }

        function showToast(msg) {
            alert(msg); // Simple for now
        }

        function openProfileViewModal(id) {
            const b = window.userBookingsList.find(x => x.id === id);
            if (b) {
                document.getElementById("p-view-arrival").innerText = b.arrivalDate || 'N/A';
                document.getElementById("p-view-duration").innerText = b.duration + " Days";
                document.getElementById("p-view-travelers").innerText = b.travelers + " Pax";
                document.getElementById("p-view-acc").innerText = b.accommodation || 'None';
                document.getElementById("p-view-transport").innerText = b.transport || 'None';
                document.getElementById("p-view-extra-dest").innerText = b.specialRequests || 'None';
                
                let badgeClass = 'bg-secondary';
                if (b.status === 'Pending') badgeClass = 'bg-warning text-dark';
                if (b.status === 'Confirmed') badgeClass = 'bg-success';
                if (b.status === 'Cancelled') badgeClass = 'bg-danger';
                
                const statusEl = document.getElementById("p-view-status");
                statusEl.className = 'badge ' + badgeClass;
                statusEl.innerText = b.status;
                
                const modal = new bootstrap.Modal(document.getElementById('profileViewModal'));
                modal.show();
            }
        }

        function logout() {
            localStorage.removeItem("isLoggedIn");
            localStorage.removeItem("userRole");
            localStorage.removeItem("userEmail");
            localStorage.removeItem("userName");
            localStorage.removeItem("userPhone");
            localStorage.removeItem("userCountry");
            window.location.href = "index.html";
        }

        function openEditProfileModal() {
            document.getElementById("edit-name").value = localStorage.getItem("userName") || "";
            document.getElementById("edit-phone").value = localStorage.getItem("userPhone") || "";
            document.getElementById("edit-country").value = localStorage.getItem("userCountry") || "";
            const modal = new bootstrap.Modal(document.getElementById('editProfileModal'));
            modal.show();
        }

        function updateProfile(e) {
            e.preventDefault();
            const email = localStorage.getItem("userEmail");
            const payload = {
                name: document.getElementById("edit-name").value,
                phoneNumber: document.getElementById("edit-phone").value,
                country: document.getElementById("edit-country").value
            };

            fetch(`/api/users/\${email}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            .then(res => {
                if (res.ok) {
                    localStorage.setItem("userName", payload.name);
                    localStorage.setItem("userPhone", payload.phoneNumber);
                    localStorage.setItem("userCountry", payload.country);
                    
                    document.getElementById("profile-name").innerText = payload.name;
                    document.getElementById("profile-phone").innerText = payload.phoneNumber;
                    document.getElementById("profile-country").innerText = payload.country;
                    
                    const modalEl = document.getElementById('editProfileModal');
                    bootstrap.Modal.getInstance(modalEl).hide();
                    showToast("Profile updated successfully!");
                }
            });
        }
    </script>
</body>
</html>
