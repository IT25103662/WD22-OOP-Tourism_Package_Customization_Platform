/**
 * Ceylon Trails Main JavaScript
 * Handles UI interactions, dynamic content rendering, and mock API calls for Spring Boot backend.
 */

// Packages are now fetched from the Spring Boot API

document.addEventListener("DOMContentLoaded", () => {
    // Navbar Scroll Effect
    const navbar = document.getElementById("mainNav");
    if (navbar && !navbar.classList.contains("scrolled")) {
        window.addEventListener("scroll", () => {
            if (window.scrollY > 50) {
                navbar.classList.add("scrolled");
            } else {
                navbar.classList.remove("scrolled");
            }
        });
    }

    // Load Featured Packages on Index page
    const featuredContainer = document.getElementById("featured-packages");
    if (featuredContainer) {
        fetchPackagesFromAPI().then(data => {
            renderPackages(data.slice(0, 3), featuredContainer); // Only show top 3 on index
        });
    }

    // Load All Packages on Packages page
    const allPackagesContainer = document.getElementById("all-packages");
    if (allPackagesContainer) {
        // Mock API Fetch - simulating async backend call
        fetchPackagesFromAPI().then(data => {
            renderPackages(data, allPackagesContainer);
        });
    }

    const customForm = document.getElementById("customization-form");
    if (customForm) {
        // Pre-fill form if returning from login
        const pendingData = sessionStorage.getItem("pendingCustomization");
        if (pendingData) {
            try {
                const data = JSON.parse(pendingData);
                document.getElementById("arrivalDate").value = data.arrivalDate || '';
                document.getElementById("duration").value = data.duration || 7;
                document.getElementById("travelers").value = data.travelers || 2;
                document.getElementById("accommodation").value = data.accommodation || 'luxury';
                document.getElementById("transport").value = data.transport || 'suv';
                document.getElementById("specialRequests").value = data.specialRequests || '';
            } catch (e) {
                console.error("Error parsing pending data", e);
            }
        }
        
        customForm.addEventListener("submit", handleCustomizationSubmit);
        
        // Auto submit if returning from login specifically to submit
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('autosubmit') === 'true' && localStorage.getItem("isLoggedIn") === "true") {
            // Wait slightly for DOM to settle
            setTimeout(() => {
                const submitEvent = new Event("submit", { cancelable: true });
                customForm.dispatchEvent(submitEvent);
            }, 500);
        }
    }
    
    // Update Navbar based on login status
    updateNavbar();
});

/**
 * Render Package Cards to a container
 */
function renderPackages(packages, container) {
    container.innerHTML = '';
    packages.forEach((pkg, index) => {
        // Animation delay for cascading effect
        const delay = index * 0.2;
        
        const cardHtml = `
            <div class="col-lg-4 col-md-6" style="animation: fadeInUp 0.8s ease ${delay}s both;">
                <div class="card package-card h-100">
                    <div class="package-img-wrapper">
                        <img src="${pkg.image}" class="package-img" alt="${pkg.title}">
                        <div class="package-price">From ${pkg.price}</div>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${pkg.title}</h5>
                        <p class="text-warning mb-2" style="font-size: 0.85rem; letter-spacing: 1px;"><i class="far fa-clock me-1"></i> ${pkg.duration}</p>
                        <p class="card-text">${pkg.description}</p>
                        <a href="package-details.html?id=${pkg.id}" class="btn btn-gold mt-3">View Details</a>
                    </div>
                </div>
            </div>
        `;
        container.innerHTML += cardHtml;
    });
}

/**
 * API Call to Spring Boot Backend
 */
async function fetchPackagesFromAPI() {
    try {
        const response = await fetch('/api/packages', { cache: 'no-store' });
        if (!response.ok) throw new Error('Failed to fetch packages');
        return await response.json();
    } catch (error) {
        console.error("Error fetching packages:", error);
        return [];
    }
}

/**
 * Handle Customization Form Submit
 */
function handleCustomizationSubmit(e) {
    e.preventDefault();
    
    // Gather form data
    const formData = {
        arrivalDate: document.getElementById("arrivalDate").value,
        duration: document.getElementById("duration").value,
        travelers: document.getElementById("travelers").value,
        accommodation: document.getElementById("accommodation").value,
        transport: document.getElementById("transport").value,
        specialRequests: document.getElementById("specialRequests").value,
        interests: Array.from(document.querySelectorAll('.interest-checkbox:checked')).map(cb => cb.value)
    };

    // Check if user is logged in before submitting
    const isLoggedIn = localStorage.getItem("isLoggedIn") === "true";
    if (!isLoggedIn) {
        // Save form data to sessionStorage so it's not lost during redirect
        sessionStorage.setItem("pendingCustomization", JSON.stringify(formData));
        showToast("Please login first to submit your request. Redirecting...");
        
        setTimeout(() => {
            window.location.href = "login.html?redirect=customize.html&autosubmit=true";
        }, 2000);
        return;
    }

    // Simulate sending data to Spring Boot Backend via fetch
    console.log("Sending customization data to backend:", formData);
    
    /* 
    // Real Implementation
    fetch('http://localhost:8080/api/customization', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData)
    }).then(res => res.json())
      .then(data => showToast("Request sent successfully! Our team will contact you soon."))
      .catch(err => console.error(err));
    */

    // Mock Success Response
    const submitBtn = e.target.querySelector('button[type="submit"]');
    const originalText = submitBtn.innerText;
    submitBtn.innerText = "Processing...";
    submitBtn.disabled = true;

    // Call Spring Boot API
    const booking = {
        id: Date.now().toString(),
        userEmail: localStorage.getItem("userEmail") || "Unknown User",
        status: "Pending",
        ...formData
    };
    
    fetch('/api/bookings', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(booking)
    }).then(res => res.text())
      .then(data => {
          showToast("Your tailored journey request has been submitted successfully!");
          submitBtn.innerText = originalText;
          submitBtn.disabled = false;
          e.target.reset();
          sessionStorage.removeItem("pendingCustomization");
          updateEstimate();
          
          setTimeout(() => {
              window.location.href = "packages.html";
          }, 1500);
      })
      .catch(err => {
          console.error(err);
          showToast("Failed to submit request.");
          submitBtn.innerText = originalText;
          submitBtn.disabled = false;
      });
}

/**
 * Update Dynamic Estimate based on user selections
 */
function updateEstimate() {
    const duration = parseInt(document.getElementById("duration")?.value) || 7;
    const travelers = parseInt(document.getElementById("travelers")?.value) || 2;
    const accType = document.getElementById("accommodation")?.value || "luxury";
    const transportType = document.getElementById("transport")?.value || "suv";
    const interestsCount = document.querySelectorAll('.interest-checkbox:checked').length;

    // Base Costs (LKR)
    const baseRatePerDayPerPerson = 22500;
    
    // Multipliers / Additions
    let accCost = 0;
    if (accType === "luxury") accCost = 30000;
    else if (accType === "boutique") accCost = 22500;
    else if (accType === "eco") accCost = 15000;
    else accCost = 17500;

    let transCost = 0;
    if (transportType === "sedan") transCost = 9000;
    else if (transportType === "suv") transCost = 12000;
    else transCost = 7500;

    let actCost = interestsCount * 7500; // Per day per person

    // Calculations
    const dailyCostPerPerson = baseRatePerDayPerPerson + accCost + actCost + transCost;
    let total = dailyCostPerPerson * duration * travelers;

    // Update UI
    const elBase = document.getElementById("est-base");
    const elAcc = document.getElementById("est-acc");
    const elTrans = document.getElementById("est-trans");
    const elAct = document.getElementById("est-act");
    const elTotal = document.getElementById("est-total");
    const elDays = document.getElementById("est-days");
    const elPax = document.getElementById("est-pax");

    if (elBase) {
        elBase.innerText = `LKR ${(baseRatePerDayPerPerson * duration * travelers).toLocaleString()}`;
        elAcc.innerText = `+LKR ${(accCost * duration * travelers).toLocaleString()}`;
        elTrans.innerText = `+LKR ${(transCost * duration).toLocaleString()}`;
        elAct.innerText = `+LKR ${(actCost * duration * travelers).toLocaleString()}`;
        elTotal.innerText = `LKR ${total.toLocaleString()}`;
        elDays.innerText = duration;
        elPax.innerText = travelers;
    }
}

/**
 * Show Toast Notification
 */
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

/**
 * Update Navbar based on Login Status
 */
function updateNavbar() {
    const isLoggedIn = localStorage.getItem("isLoggedIn") === "true";
    const userRole = localStorage.getItem("userRole");
    
    // Find login link in navbar
    const navLinks = document.querySelectorAll('.nav-link');
    let loginLink = null;
    navLinks.forEach(link => {
        if (link.getAttribute('href') === 'login.html' || link.innerText === 'Login') {
            loginLink = link;
        }
    });

    if (isLoggedIn && loginLink) {
        if (userRole === "admin") {
            loginLink.href = "admin.html";
            loginLink.innerText = "Admin Panel";
        } else {
            loginLink.href = "profile.html";
            loginLink.innerText = "Profile";
        }
    }
}

/**
 * Step Wizard Navigation
 */
function showStep(step) {
    // Hide all steps
    document.querySelectorAll('.form-step').forEach(el => el.classList.add('d-none'));
    // Show target step
    const targetStep = document.getElementById(`step-${step}`);
    if(targetStep) targetStep.classList.remove('d-none');
    
    // Update navigation styles
    document.querySelectorAll('.vertical-steps .step').forEach(el => {
        el.classList.remove('active');
        // Simple logic: if id is nav-step-X where X < step, add 'completed' class
        const stepNum = parseInt(el.id.split('-').pop());
        if(stepNum < step) {
            el.classList.add('completed');
        } else {
            el.classList.remove('completed');
        }
    });
    
    const navStep = document.getElementById(`nav-step-${step}`);
    if(navStep) navStep.classList.add('active');
}

function nextStep(step) {
    showStep(step);
}

function prevStep(step) {
    showStep(step);
}
