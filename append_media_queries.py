import os

main_css_path = r'd:\Personal Projects\BloodLink\bloodlink_backend\static\css\main.css'

media_queries = """
/* =========================================
   RESPONSIVENESS (Mobile, Tablet, Desktop)
   ========================================= */

/* Desktop & Large Laptops (1200px and up) */
@media (min-width: 1200px) {
    .hero-title {
        font-size: 5rem;
    }
}

/* Tablets & Laptops (max-width: 992px) */
@media (max-width: 992px) {
    .hero-title {
        font-size: 3.5rem;
    }
    .hero-subtitle {
        font-size: 1.15rem;
        padding: 0 15px;
    }
    .section-title {
        font-size: 2.2rem;
    }
    .form-container {
        padding: 40px;
        margin-top: 100px;
    }
    .stats-section {
        margin-top: -30px;
    }
    .donor-header h5, .request-header h5, .donor-name {
        font-size: 1.2rem;
    }
    .blood-badge, .blood-group {
        font-size: 1rem;
        padding: 6px 12px;
    }
}

/* Mobile Devices (max-width: 768px) */
@media (max-width: 768px) {
    .hero-title {
        font-size: 2.5rem;
        margin-top: 40px;
    }
    .hero-subtitle {
        font-size: 1rem;
    }
    .carousel-item {
        min-height: 500px;
    }
    .navbar-brand img {
        height: 45px;
    }
    .section-title {
        font-size: 1.8rem;
    }
    .form-container {
        padding: 25px;
        margin-top: 90px;
        border-radius: 15px;
    }
    .form-title {
        font-size: 1.8rem;
        margin-bottom: 25px;
    }
    .address-section {
        padding: 15px;
    }
    .stat-card {
        padding: 20px 15px;
        margin-bottom: 15px;
    }
    .stat-icon {
        font-size: 2rem;
    }
    .stat-number {
        font-size: 2.2rem;
    }
    .btn-custom, .btn-primary-custom, .btn-bloodlink {
        padding: 10px 20px;
        font-size: 0.95rem;
    }
    .feature-card {
        padding: 25px 20px;
    }
    .myth-card {
        padding: 20px;
    }
    .donor-card, .request-card {
        padding: 20px;
    }
    .verification-content {
        padding: 25px;
        width: 95%;
    }
    .verification-input {
        font-size: 1.5rem;
        letter-spacing: 5px;
    }
    .footer {
        padding: 50px 0 20px;
    }
}

/* Small Mobile Devices (max-width: 480px) */
@media (max-width: 480px) {
    .hero-title {
        font-size: 2.2rem;
    }
    .btn-toggle {
        padding: 8px 15px;
        font-size: 0.9rem;
        margin: 5px;
    }
    .donor-header, .request-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
    }
    .whatsapp-btn, .contact-btn, .fulfill-btn, .btn-fulfill {
        width: 100%;
        text-align: center;
    }
}
"""

with open(main_css_path, 'a', encoding='utf-8') as f:
    f.write(media_queries)

print("Appended responsive media queries to main.css.")
