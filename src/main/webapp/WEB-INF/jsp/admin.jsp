<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel | Ceylon Trails</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styles.css">
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="assets/images/favicon.png">
    <style>
        body { background-color: var(--primary-color); }
        .admin-sidebar {
            height: 100vh;
            background-color: var(--secondary-color);
            padding-top: 20px;
            border-right: 1px solid rgba(255,255,255,0.05);
        }
        .admin-content {
            padding: 40px;
        }
        .table-dark th { color: var(--accent-color); }
    </style>
</head>
<body>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 admin-sidebar position-fixed">
                <a class="navbar-brand d-block text-center mb-5" href="index.html" style="font-size: 1.5rem;">Ceylon Trails</a>
                <ul class="nav flex-column">
                    <li class="nav-item mb-3">
                        <a class="nav-link active" href="#" id="nav-bookings" onclick="showSection('bookings')" style="color: var(--accent-color);"><i class="fas fa-list me-2"></i> All Bookings</a>
                    </li>
                    <li class="nav-item mb-3">
                        <a class="nav-link" href="#" id="nav-packages" onclick="showSection('packages')" style="color: var(--text-light);"><i class="fas fa-box me-2"></i> Packages</a>
                    </li>
                    <li class="nav-item mb-3">
                        <a class="nav-link" href="#" id="nav-destinations" onclick="showSection('destinations')" style="color: var(--text-light);"><i class="fas fa-map-marker-alt me-2"></i> Destinations</a>
                    </li>
                    <li class="nav-item mb-3">
                        <a class="nav-link" href="#" id="nav-providers" onclick="showSection('providers')" style="color: var(--text-light);"><i class="fas fa-users me-2"></i> Service Providers</a>
                    </li>
                    <li class="nav-item mb-3">
                        <a class="nav-link" href="#" id="nav-reviews" onclick="showSection('reviews')" style="color: var(--text-light);"><i class="fas fa-star me-2"></i> Reviews</a>
                    </li>
                    <li class="nav-item mb-3">
                        <a class="nav-link" href="#" id="nav-users" onclick="showSection('users')" style="color: var(--text-light);"><i class="fas fa-user-shield me-2"></i> Manage Users</a>
                    </li>
                    <li class="nav-item mb-3">
                        <a class="nav-link" href="index.html" style="color: var(--text-light);"><i class="fas fa-globe me-2"></i> Go to Site</a>
                    </li>
                    <li class="nav-item mt-5">
                        <button class="btn btn-outline-danger w-100" onclick="logout()"><i class="fas fa-sign-out-alt me-2"></i> Log Out</button>
                    </li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 offset-md-3 col-lg-10 offset-lg-2 admin-content">
                <h2 class="mb-4" style="font-family: var(--font-heading);">Admin Dashboard</h2>
                
                <div class="customization-wrapper" id="section-bookings">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 style="margin: 0; color: var(--accent-color);">Manage Bookings</h4>
                        <span class="badge bg-secondary" id="total-bookings">0 Total</span>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-dark table-hover align-middle">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>User Email</th>
                                    <th>Arrival</th>
                                    <th>Details</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="admin-bookings-table">
                                <!-- Populated via JS -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="customization-wrapper d-none" id="section-packages">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 style="margin: 0; color: var(--accent-color);">Manage Packages</h4>
                        <button class="btn btn-sm btn-gold-solid" onclick="openPackageModal()"><i class="fas fa-plus me-1"></i> Add New</button>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-dark table-hover align-middle">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Duration</th>
                                    <th>Price</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="admin-packages-table">
                                <!-- Populated via JS -->
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="customization-wrapper d-none" id="section-destinations">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 style="margin: 0; color: var(--accent-color);">Manage Destinations</h4>
                        <button class="btn btn-sm btn-gold-solid" onclick="openDestModal()"><i class="fas fa-plus me-1"></i> Add Destination</button>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-dark table-hover align-middle">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Location</th>
                                    <th>Type</th>
                                    <th>Entry Fee</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="admin-destinations-table">
                                <!-- Populated via JS -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="customization-wrapper d-none" id="section-providers">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 style="margin: 0; color: var(--accent-color);">Manage Service Providers</h4>
                        <button class="btn btn-sm btn-gold-solid" onclick="openProviderModal()"><i class="fas fa-plus me-1"></i> Register Provider</button>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-dark table-hover align-middle">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Contact</th>
                                    <th>Extra Details</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="admin-providers-table">
                                <!-- Populated via JS -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="customization-wrapper d-none" id="section-reviews">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 style="margin: 0; color: var(--accent-color);">Manage Package Reviews</h4>
                    </div>
                    <div id="admin-reviews-list" class="row g-3">
                        <!-- Cards populated via JS -->
                    </div>
                </div>

                <div class="customization-wrapper d-none" id="section-users">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 style="margin: 0; color: var(--accent-color);">Manage Users</h4>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-dark table-hover align-middle">
                            <thead>
                                <tr>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="admin-users-table">
                                <!-- Populated via JS -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                <div class="modal-header border-0">
                    <h5 class="modal-title" style="color: var(--accent-color);">Edit Booking Status</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="edit-booking-id">
                    <div class="mb-3">
                        <label class="form-label text-light">Status</label>
                        <select class="form-select" id="edit-status" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                            <option value="Pending">Pending</option>
                            <option value="Confirmed">Confirmed</option>
                            <option value="Cancelled">Cancelled</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-sm btn-outline-light" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-sm btn-gold-solid" onclick="saveEdit()">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- View Modal -->
    <div class="modal fade" id="viewModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                <div class="modal-header border-0">
                    <h5 class="modal-title" style="color: var(--accent-color);"><i class="fas fa-eye me-2"></i>Booking Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body text-light">
                    <div class="row mb-2">
                        <div class="col-4 text-muted">ID:</div>
                        <div class="col-8" id="view-id"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 text-muted">User Email:</div>
                        <div class="col-8" id="view-email"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 text-muted">Arrival Date:</div>
                        <div class="col-8" id="view-arrival"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 text-muted">Duration:</div>
                        <div class="col-8" id="view-duration"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 text-muted">Travelers:</div>
                        <div class="col-8" id="view-travelers"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 text-muted">Tour Guide:</div>
                        <div class="col-8" id="view-acc" style="text-transform: capitalize;"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 text-muted">Transport:</div>
                        <div class="col-8" id="view-transport" style="text-transform: capitalize;"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 text-muted">Extra Destinations:</div>
                        <div class="col-8" id="view-extra-dest" style="color: var(--accent-color); font-size: 0.9rem;"></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-4 text-muted">Status:</div>
                        <div class="col-8"><span class="badge bg-secondary" id="view-status"></span></div>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-sm btn-outline-light" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Package Modal -->
    <div class="modal fade" id="packageModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                <div class="modal-header border-0">
                    <h5 class="modal-title" style="color: var(--accent-color);" id="packageModalTitle">Add Package</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="pkg-id">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label text-light">Title</label>
                            <input type="text" class="form-control" id="pkg-title" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-light">Image Path</label>
                            <input type="text" class="form-control" id="pkg-image" placeholder="assets/images/..." style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-light">Duration</label>
                            <input type="text" class="form-control" id="pkg-duration" placeholder="e.g. 5 Days / 4 Nights" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-light">Price</label>
                            <input type="text" class="form-control" id="pkg-price" placeholder="e.g. LKR 360,000" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                        </div>
                        <div class="col-12">
                            <label class="form-label text-light">Description</label>
                            <textarea class="form-control" id="pkg-description" rows="3" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-sm btn-outline-light" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-sm btn-gold-solid" onclick="savePackage()">Save Package</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Provider Modal -->
    <div class="modal fade" id="providerModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                <div class="modal-header border-0">
                    <h5 class="modal-title" style="color: var(--accent-color);" id="providerModalTitle">Register Service Provider</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="prov-id">
                    <div class="mb-3">
                        <label class="form-label text-light">Provider Type</label>
                        <select class="form-select" id="prov-type" onchange="toggleProvFields()" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                            <option value="GUIDE">Tour Guide</option>
                            <option value="DRIVER">Transport Driver</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-light">Full Name</label>
                        <input type="text" class="form-control" id="prov-name" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-light">Contact Number</label>
                        <input type="text" class="form-control" id="prov-contact" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                    </div>
                    <div class="mb-3" id="field-languages">
                        <label class="form-label text-light">Languages (comma separated)</label>
                        <input type="text" class="form-control" id="prov-languages" placeholder="e.g. English, French" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                    </div>
                    <div class="mb-3 d-none" id="field-vehicle">
                        <label class="form-label text-light">Vehicle Type</label>
                        <input type="text" class="form-control" id="prov-vehicle" placeholder="e.g. Luxury SUV, Van" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-sm btn-outline-light" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-sm btn-gold-solid" onclick="saveProvider()">Register</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Destination Modal -->
    <div class="modal fade" id="destModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                <div class="modal-header border-0">
                    <h5 class="modal-title" style="color: var(--accent-color);" id="destModalTitle">Add Destination</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="dest-id">
                    <div class="mb-3">
                        <label class="form-label text-light">Type</label>
                        <select class="form-select" id="dest-type" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                            <option value="HISTORICAL">Historical Site</option>
                            <option value="NATURE">Nature Reserve</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-light">Name</label>
                        <input type="text" class="form-control" id="dest-name" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-light">Location</label>
                        <input type="text" class="form-control" id="dest-location" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-light">Entry Fee (LKR)</label>
                        <input type="number" class="form-control" id="dest-fee" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-sm btn-outline-light" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-sm btn-gold-solid" onclick="saveDest()">Save Destination</button>
                </div>
            </div>
        </div>
    </div>
    
    </div>
    <div class="modal fade" id="userEditModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                <div class="modal-header border-0">
                    <h5 class="modal-title" style="color: var(--accent-color);">Edit User</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label text-light">User Email</label>
                        <input type="text" class="form-control" id="edit-user-email" disabled style="background-color: var(--primary-color); color: var(--text-light); border-color: rgba(255,255,255,0.1);">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-light">Select Role</label>
                        <select class="form-select" id="edit-user-role" style="background-color: var(--primary-color); color: white; border-color: rgba(255,255,255,0.1);">
                            <option value="user">User</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-sm btn-outline-light" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-sm btn-gold-solid" onclick="saveUserEdit()">Save Changes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- User View Modal -->
    <div class="modal fade" id="userViewModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: var(--secondary-color); border: 1px solid var(--accent-color);">
                <div class="modal-header border-0">
                    <h5 class="modal-title" style="color: var(--accent-color);">User Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body text-light">
                    <div class="row mb-3">
                        <div class="col-4 text-muted">Full Name:</div>
                        <div class="col-8" id="view-user-name"></div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-4 text-muted">Email:</div>
                        <div class="col-8" id="view-user-email"></div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-4 text-muted">Phone:</div>
                        <div class="col-8" id="view-user-phone"></div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-4 text-muted">Country:</div>
                        <div class="col-8" id="view-user-country"></div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-4 text-muted">Role:</div>
                        <div class="col-8"><span class="badge bg-secondary" id="view-user-role"></span></div>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-sm btn-gold-solid" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
        <div id="toast-message"></div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        let bookings = [];
        let packagesList = [];

        document.addEventListener("DOMContentLoaded", function() {
            if (localStorage.getItem("userRole") !== "admin") {
                window.location.href = "login.html";
                return;
            }

            loadBookings();
            loadPackages();
            loadProviders();
            loadDestinations();
            loadUsers();
            loadReviewsAdmin();
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

        function showSection(section) {
            const sections = ['bookings', 'packages', 'destinations', 'providers', 'reviews', 'users'];
            
            sections.forEach(sec => {
                const secEl = document.getElementById(`section-\${sec}`);
                const navEl = document.getElementById(`nav-\${sec}`);
                if (secEl) secEl.classList.add("d-none");
                if (navEl) navEl.style.color = "var(--text-light)";
            });
            
            const activeSec = document.getElementById(`section-\${section}`);
            const activeNav = document.getElementById(`nav-\${section}`);
            if (activeSec) activeSec.classList.remove("d-none");
            if (activeNav) activeNav.style.color = "var(--accent-color)";
        }

        function loadBookings() {
            fetch('/api/bookings', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    bookings = data;
                    document.getElementById("total-bookings").innerText = `\${bookings.length} Total`;
                    
                    const tbody = document.getElementById("admin-bookings-table");
                    tbody.innerHTML = '';
                    
                    bookings.forEach(b => {
                        let statusBadge = '';
                        if (b.status === "Pending") statusBadge = '<span class="badge bg-warning text-dark">Pending</span>';
                        else if (b.status === "Confirmed") statusBadge = '<span class="badge bg-success">Confirmed</span>';
                        else statusBadge = `<span class="badge bg-danger">\${b.status}</span>`;

                        let tr = document.createElement("tr");
                        tr.innerHTML = `
                            <td class="text-muted small">\${b.id ? b.id.substring(b.id.length - 6) : 'N/A'}</td>
                            <td><strong>\${b.userEmail || 'Unknown User'}</strong></td>
                            <td>\${b.arrivalDate || 'N/A'}</td>
                            <td class="small text-muted">\${b.duration}d, \${b.travelers}pax, \${b.accommodation}</td>
                            <td>\${statusBadge}</td>
                            <td>
                                <button class="btn btn-sm btn-outline-light me-1" onclick="openViewModal('\${b.id}')" title="View Details"><i class="fas fa-eye"></i></button>
                                <button class="btn btn-sm btn-outline-info me-1" onclick="openEditModal('\${b.id}')" title="Edit Status"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger" onclick="deleteBooking('\${b.id}')" title="Delete Booking"><i class="fas fa-trash"></i></button>
                            </td>
                        `;
                        tbody.appendChild(tr);
                    });
                })
                .catch(err => console.error("Error loading bookings:", err));
        }

        function deleteBooking(id) {
            if (confirm("Are you sure you want to delete this booking?")) {
                fetch(`/api/bookings/\${id}`, { method: 'DELETE' })
                    .then(res => {
                        if (res.ok) {
                            showToast("Booking deleted successfully");
                            loadBookings();
                        } else {
                            showToast("Failed to delete booking");
                        }
                    })
                    .catch(err => {
                        console.error("Error deleting booking:", err);
                        showToast("Error deleting booking");
                    });
            }
        }

        function openEditModal(id) {
            const b = bookings.find(x => x.id === id);
            if (b) {
                document.getElementById("edit-booking-id").value = b.id;
                document.getElementById("edit-status").value = b.status || 'Pending';
                const modal = new bootstrap.Modal(document.getElementById('editModal'));
                modal.show();
            }
        }

        function openViewModal(id) {
            const b = bookings.find(x => x.id === id);
            if (b) {
                document.getElementById("view-id").innerText = b.id;
                document.getElementById("view-email").innerText = b.userEmail;
                document.getElementById("view-arrival").innerText = b.arrivalDate;
                document.getElementById("view-duration").innerText = b.duration + " Days";
                document.getElementById("view-travelers").innerText = b.travelers + " Pax";
                document.getElementById("view-acc").innerText = b.accommodation || 'None';
                document.getElementById("view-transport").innerText = b.transport || 'None';
                document.getElementById("view-extra-dest").innerText = b.specialRequests || 'None';
                document.getElementById("view-status").innerText = b.status;
                const modal = new bootstrap.Modal(document.getElementById('viewModal'));
                modal.show();
            }
        }

        function saveEdit() {
            const id = document.getElementById("edit-booking-id").value;
            const newStatus = document.getElementById("edit-status").value;
            
            fetch(`/api/bookings/\${id}/status?status=\${newStatus}`, { method: 'PUT' })
                .then(res => {
                    if (res.ok) {
                        const modalEl = document.getElementById('editModal');
                        const modalInstance = bootstrap.Modal.getInstance(modalEl);
                        modalInstance.hide();
                        showToast("Status updated successfully");
                        loadBookings();
                    } else {
                        showToast("Failed to update status");
                    }
                })
                .catch(err => {
                    console.error("Error updating status:", err);
                    showToast("Error updating status");
                });
        }

        function logout() {
            localStorage.removeItem("isLoggedIn");
            localStorage.removeItem("userRole");
            localStorage.removeItem("userEmail");
            window.location.href = "index.html";
        }

        // --- Packages API ---
        function loadPackages() {
            fetch('/api/packages', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    packagesList = data;
                    const tbody = document.getElementById("admin-packages-table");
                    tbody.innerHTML = '';
                    
                    packagesList.forEach(pkg => {
                        let tr = document.createElement("tr");
                        tr.innerHTML = `
                            <td><strong>\${pkg.title}</strong></td>
                            <td class="text-muted">\${pkg.duration}</td>
                            <td>\${pkg.price}</td>
                            <td>
                                <button class="btn btn-sm btn-outline-info me-1" onclick="openPackageModal('\${pkg.id}')" title="Edit Package"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger" onclick="deletePackage('\${pkg.id}')" title="Delete Package"><i class="fas fa-trash"></i></button>
                            </td>
                        `;
                        tbody.appendChild(tr);
                    });
                })
                .catch(err => console.error("Error loading packages:", err));
        }

        function openPackageModal(id = null) {
            if (id) {
                const pkg = packagesList.find(x => x.id === id);
                document.getElementById("packageModalTitle").innerText = "Edit Package";
                document.getElementById("pkg-id").value = pkg.id;
                document.getElementById("pkg-title").value = pkg.title;
                document.getElementById("pkg-image").value = pkg.image;
                document.getElementById("pkg-duration").value = pkg.duration;
                document.getElementById("pkg-price").value = pkg.price;
                document.getElementById("pkg-description").value = pkg.description;
            } else {
                document.getElementById("packageModalTitle").innerText = "Add Package";
                document.getElementById("pkg-id").value = "";
                document.getElementById("pkg-title").value = "";
                document.getElementById("pkg-image").value = "assets/images/";
                document.getElementById("pkg-duration").value = "";
                document.getElementById("pkg-price").value = "";
                document.getElementById("pkg-description").value = "";
            }
            const modal = new bootstrap.Modal(document.getElementById('packageModal'));
            modal.show();
        }

        function savePackage() {
            const id = document.getElementById("pkg-id").value;
            const payload = {
                title: document.getElementById("pkg-title").value,
                image: document.getElementById("pkg-image").value,
                duration: document.getElementById("pkg-duration").value,
                price: document.getElementById("pkg-price").value,
                description: document.getElementById("pkg-description").value
            };

            const url = id ? `/api/packages/\${id}` : '/api/packages';
            const method = id ? 'PUT' : 'POST';

            fetch(url, {
                method: method,
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            .then(res => {
                if (res.ok) {
                    const modalEl = document.getElementById('packageModal');
                    const modalInstance = bootstrap.Modal.getInstance(modalEl);
                    modalInstance.hide();
                    showToast(id ? "Package updated successfully" : "Package added successfully");
                    loadPackages();
                } else {
                    showToast("Failed to save package");
                }
            })
            .catch(err => {
                console.error("Error saving package:", err);
                showToast("Error saving package");
            });
        }

        function deletePackage(id) {
            if (confirm("Are you sure you want to delete this package?")) {
                fetch(`/api/packages/\${id}`, { method: 'DELETE' })
                    .then(res => {
                        if (res.ok) {
                            showToast("Package deleted successfully");
                            loadPackages();
                        } else {
                            showToast("Failed to delete package");
                        }
                    })
                    .catch(err => {
                        console.error("Error deleting package:", err);
                        showToast("Error deleting package");
                    });
            }
        }

        // --- Providers API ---
        let providersList = [];

        function loadProviders() {
            fetch('/api/providers', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    providersList = data;
                    const tbody = document.getElementById("admin-providers-table");
                    tbody.innerHTML = '';
                    
                    data.forEach(p => {
                        let statusBadge = p.available 
                            ? '<span class="badge bg-success">Available</span>' 
                            : '<span class="badge bg-secondary">Unavailable</span>';
                        
                        let typeBadge = p.type === 'GUIDE' 
                            ? '<span class="badge bg-info">Guide</span>' 
                            : '<span class="badge bg-primary">Driver</span>';

                        let extra = p.extraInfo || 'N/A';

                        let tr = document.createElement("tr");
                        tr.innerHTML = `
                            <td><strong>\${p.name}</strong></td>
                            <td>\${typeBadge}</td>
                            <td>\${p.contactNumber}</td>
                            <td class="text-muted small">\${extra}</td>
                            <td>\${statusBadge}</td>
                            <td>
                                <button class="btn btn-sm btn-outline-info me-1" onclick="openProviderModal('\${p.id}')" title="Edit Details"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-warning me-1" onclick="toggleProviderStatus('\${p.id}', \${!p.available})" title="Toggle Availability"><i class="fas fa-sync-alt"></i></button>
                                <button class="btn btn-sm btn-outline-danger" onclick="deleteProvider('\${p.id}')" title="Delete"><i class="fas fa-trash"></i></button>
                            </td>
                        `;
                        tbody.appendChild(tr);
                    });
                });
        }

        function openProviderModal(id = null) {
            if (id) {
                const p = providersList.find(x => x.id === id);
                document.getElementById("providerModalTitle").innerText = "Update Service Provider";
                document.getElementById("prov-id").value = p.id;
                document.getElementById("prov-name").value = p.name;
                document.getElementById("prov-contact").value = p.contactNumber;
                
                document.getElementById("prov-type").value = p.type;
                if (p.type === "GUIDE") {
                    document.getElementById("prov-languages").value = p.extraInfo;
                } else {
                    document.getElementById("prov-vehicle").value = p.extraInfo;
                }
                document.getElementById("prov-type").disabled = true;
                toggleProvFields();
            } else {
                document.getElementById("providerModalTitle").innerText = "Register Service Provider";
                document.getElementById("prov-id").value = "";
                document.getElementById("prov-name").value = "";
                document.getElementById("prov-contact").value = "";
                document.getElementById("prov-languages").value = "";
                document.getElementById("prov-vehicle").value = "";
                document.getElementById("prov-type").disabled = false;
            }
            const modal = new bootstrap.Modal(document.getElementById('providerModal'));
            modal.show();
        }

        function toggleProvFields() {
            const type = document.getElementById("prov-type").value;
            if (type === "GUIDE") {
                document.getElementById("field-languages").classList.remove("d-none");
                document.getElementById("field-vehicle").classList.add("d-none");
            } else {
                document.getElementById("field-languages").classList.add("d-none");
                document.getElementById("field-vehicle").classList.remove("d-none");
            }
        }

        function saveProvider() {
            const id = document.getElementById("prov-id").value;
            const type = document.getElementById("prov-type").value;
            const payload = {
                name: document.getElementById("prov-name").value,
                contactNumber: document.getElementById("prov-contact").value,
                available: true,
                type: type,
                extraInfo: type === "GUIDE" ? document.getElementById("prov-languages").value : document.getElementById("prov-vehicle").value
            };

            let endpoint = id ? `/api/providers/\${id}` : "/api/providers";
            let method = id ? 'PUT' : 'POST';

            fetch(endpoint, {
                method: method,
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            .then(res => {
                if (res.ok) {
                    const modalEl = document.getElementById('providerModal');
                    const modalInstance = bootstrap.Modal.getInstance(modalEl);
                    modalInstance.hide();
                    showToast(id ? "Provider updated successfully" : "Provider registered successfully");
                    loadProviders();
                }
            });
        }

        function toggleProviderStatus(id, newStatus) {
            fetch(`/api/providers/\${id}/status?status=\${newStatus}`, { method: 'PUT' })
                .then(res => {
                    if (res.ok) {
                        showToast("Provider status updated");
                        loadProviders();
                    }
                });
        }

        function deleteProvider(id) {
            if (confirm("Are you sure you want to delete this provider?")) {
                fetch(`/api/providers/\${id}`, { method: 'DELETE' })
                    .then(res => {
                        if (res.ok) {
                            showToast("Provider deleted");
                            loadProviders();
                        }
                    });
            }
        }

        // --- Destinations API ---
        let destList = [];

        function loadDestinations() {
            fetch('/api/destinations', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    destList = data;
                    const tbody = document.getElementById("admin-destinations-table");
                    tbody.innerHTML = '';
                    
                    data.forEach(d => {
                        let typeBadge = '<span class="badge bg-secondary">Destination</span>';

                        let tr = document.createElement("tr");
                        tr.innerHTML = `
                            <td><strong>\${d.name}</strong></td>
                            <td>\${d.location}</td>
                            <td>\${typeBadge}</td>
                            <td>LKR \${d.baseEntryFee}</td>
                            <td>
                                <button class="btn btn-sm btn-outline-info me-1" onclick="openDestModal('\${d.id}')" title="Edit"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger" onclick="deleteDest('\${d.id}')" title="Delete"><i class="fas fa-trash"></i></button>
                            </td>
                        `;
                        tbody.appendChild(tr);
                    });
                });
        }

        function openDestModal(id = null) {
            if (id) {
                const d = destList.find(x => x.id === id);
                document.getElementById("destModalTitle").innerText = "Update Destination";
                document.getElementById("dest-id").value = d.id;
                document.getElementById("dest-name").value = d.name;
                document.getElementById("dest-location").value = d.location;
                document.getElementById("dest-fee").value = d.baseEntryFee;
                document.getElementById("dest-type").value = d.historicalValue !== undefined ? "HISTORICAL" : "NATURE";
                document.getElementById("dest-type").disabled = true;
            } else {
                document.getElementById("destModalTitle").innerText = "Add Destination";
                document.getElementById("dest-id").value = "";
                document.getElementById("dest-name").value = "";
                document.getElementById("dest-location").value = "";
                document.getElementById("dest-fee").value = "";
                document.getElementById("dest-type").disabled = false;
            }
            const modal = new bootstrap.Modal(document.getElementById('destModal'));
            modal.show();
        }

        function saveDest() {
            const id = document.getElementById("dest-id").value;
            const payload = {
                name: document.getElementById("dest-name").value,
                location: document.getElementById("dest-location").value,
                baseEntryFee: parseFloat(document.getElementById("dest-fee").value)
            };

            let method = id ? 'PUT' : 'POST';
            let endpoint = id ? `/api/destinations/\${id}` : "/api/destinations";

            fetch(endpoint, {
                method: method,
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            .then(res => {
                if (res.ok) {
                    const modalEl = document.getElementById('destModal');
                    const modalInstance = bootstrap.Modal.getInstance(modalEl);
                    modalInstance.hide();
                    showToast(id ? "Destination updated" : "Destination added");
                    loadDestinations();
                }
            });
        }

        function deleteDest(id) {
            if (confirm("Are you sure you want to delete this destination?")) {
                fetch(`/api/destinations/\${id}`, { method: 'DELETE' })
                    .then(res => {
                        if (res.ok) {
                            showToast("Destination deleted");
                            loadDestinations();
                        }
                    });
            }
        }

        // --- Users API ---
        let usersList = [];

        function loadUsers() {
            fetch('/api/users', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    usersList = data;
                    const tbody = document.getElementById("admin-users-table");
                    tbody.innerHTML = '';
                    
                    data.forEach(u => {
                        let roleBadge = u.role === 'admin' 
                            ? '<span class="badge bg-danger">Admin</span>' 
                            : '<span class="badge bg-info">User</span>';

                        let tr = document.createElement("tr");
                        tr.innerHTML = `
                            <td>\${u.email}</td>
                            <td>\${roleBadge}</td>
                            <td>
                                <button class="btn btn-sm btn-outline-warning me-1" onclick="viewUser('\${u.email}')" title="View Details"><i class="fas fa-eye"></i></button>
                                <button class="btn btn-sm btn-outline-info me-1" onclick="openUserEditModal('\${u.email}')" title="Edit"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger" onclick="deleteUser('\${u.email}')" title="Delete"><i class="fas fa-trash"></i></button>
                            </td>
                        `;
                        tbody.appendChild(tr);
                    });
                });
        }

        function viewUser(email) {
            console.log("Viewing user:", email);
            const u = usersList.find(x => x.email === email);
            console.log("User found:", u);
            if (u) {
                document.getElementById("view-user-name").innerText = u.name;
                document.getElementById("view-user-email").innerText = u.email;
                document.getElementById("view-user-phone").innerText = u.phoneNumber || 'N/A';
                document.getElementById("view-user-country").innerText = u.country || 'N/A';
                document.getElementById("view-user-role").innerText = u.role;
                
                const modal = new bootstrap.Modal(document.getElementById('userViewModal'));
                modal.show();
            }
        }

        function openUserEditModal(email) {
            const u = usersList.find(x => x.email === email);
            if (u) {
                document.getElementById("edit-user-email").value = u.email;
                document.getElementById("edit-user-role").value = u.role;
                
                const modal = new bootstrap.Modal(document.getElementById('userEditModal'));
                modal.show();
            }
        }

        function saveUserEdit() {
            const email = document.getElementById("edit-user-email").value;
            const u = usersList.find(x => x.email === email);
            if (!u) return;

            const payload = {
                ...u,
                role: document.getElementById("edit-user-role").value
            };

            fetch(`/api/users/\${email}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            .then(res => {
                if (res.ok) {
                    const modalEl = document.getElementById('userEditModal');
                    const modalInstance = bootstrap.Modal.getInstance(modalEl);
                    modalInstance.hide();
                    showToast("User role updated successfully");
                    loadUsers();
                }
            });
        }

        function deleteUser(email) {
            if (email === localStorage.getItem("userEmail")) {
                alert("You cannot delete yourself!");
                return;
            }
            if (confirm("Are you sure you want to delete this user?")) {
                fetch(`/api/users/\${email}`, { method: 'DELETE' })
                    .then(res => {
                        if (res.ok) {
                            showToast("User deleted");
                            loadUsers();
                        }
                    });
            }
        }

        // --- Reviews API ---
        function loadReviewsAdmin() {
            fetch('/api/reviews', { cache: 'no-store' })
                .then(res => res.json())
                .then(data => {
                    const container = document.getElementById("admin-reviews-list");
                    container.innerHTML = '';
                    
                    data.forEach(r => {
                        let stars = '';
                        for(let i=1; i<=5; i++) {
                            stars += `<i class="fas fa-star \${i <= r.rating ? 'text-warning' : 'text-muted'}"></i>`;
                        }

                        let col = document.createElement("div");
                        col.className = "col-md-6 col-lg-4";
                        col.innerHTML = `
                            <a href="package-details.html?id=\${r.packageId}#review-\${r.id}" class="text-decoration-none">
                                <div class="card bg-dark border-secondary h-100 review-hover-card" style="transition: transform 0.2s;">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <span class="badge bg-gold-outline text-gold small">\${r.packageId}</span>
                                            <div class="small">\${stars}</div>
                                        </div>
                                        <p class="card-text text-light small text-truncate">\${r.comment}</p>
                                        <div class="mt-2 text-muted x-small">By: \${r.userEmail}</div>
                                    </div>
                                </div>
                            </a>
                        `;
                        container.appendChild(col);
                    });
                });
        }



        function deleteReviewAdmin(id) {
            if (confirm("Are you sure you want to delete this review?")) {
                fetch(`/api/reviews/\${id}`, { method: 'DELETE' })
                    .then(res => {
                        if (res.ok) {
                            showToast("Review deleted");
                            loadReviewsAdmin();
                        }
                    });
            }
        }
    </script>
</body>
</html>
