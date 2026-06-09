import os

main_css_path = r'd:\Personal Projects\BloodLink\bloodlink_backend\static\css\main.css'

missing_css = """
/* Portal & Map Specific Styles */
.main-content {
    padding-top: 120px;
    padding-bottom: 60px;
}

.btn-toggle {
    border-radius: 50px;
    padding: 10px 30px;
    font-weight: 600;
    margin: 0 10px;
    transition: all 0.3s ease;
}
.active-btn {
    background-color: var(--primary-red) !important;
    color: white !important;
    border-color: var(--primary-red) !important;
    box-shadow: var(--shadow-soft);
}

#searchBar, #reqSearchBar {
    width: 100%;
    max-width: 600px;
    padding: 15px 25px;
    border-radius: 50px;
    border: 1px solid var(--glass-border);
    background: var(--card-bg);
    box-shadow: var(--shadow-soft);
    margin-bottom: 40px;
    font-size: 1.1rem;
    transition: all 0.3s ease;
    color: var(--text-main);
}
#searchBar:focus, #reqSearchBar:focus {
    outline: none;
    border-color: var(--primary-red);
    box-shadow: var(--shadow-hover);
}

.donor-card, .request-card {
    background: var(--card-bg);
    border-radius: 20px;
    padding: 30px;
    margin-bottom: 25px;
    box-shadow: var(--shadow-soft);
    border-left: 5px solid var(--primary-red);
    transition: all 0.3s ease;
}
.donor-card:hover, .request-card:hover {
    transform: translateY(-5px);
    box-shadow: var(--shadow-hover);
}
.donor-header, .request-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    border-bottom: 1px solid rgba(0,0,0,0.05);
    padding-bottom: 15px;
}
.donor-header h5, .request-header h5, .donor-name {
    margin: 0;
    font-size: 1.4rem;
    font-weight: 700;
    color: var(--text-main);
}
.blood-badge, .blood-group {
    background: var(--primary-red);
    color: white;
    padding: 8px 15px;
    border-radius: 50px;
    font-weight: 800;
    font-size: 1.1rem;
    box-shadow: 0 4px 10px rgba(230,57,70,0.3);
}
.donor-details p, .request-details p, .info-item {
    color: var(--text-muted);
    font-size: 1.1rem;
    margin-bottom: 10px;
    display: flex;
    align-items: center;
}
.donor-details i, .request-details i, .info-item i {
    color: var(--primary-red);
    margin-right: 15px;
    font-size: 1.2rem;
}
.whatsapp-btn, .contact-btn, .fulfill-btn, .btn-fulfill {
    display: inline-block;
    background: #25D366;
    color: white;
    padding: 12px 25px;
    border-radius: 50px;
    text-decoration: none;
    font-weight: 600;
    margin-top: 15px;
    transition: all 0.3s ease;
    border: none;
    cursor: pointer;
}
.whatsapp-btn:hover, .contact-btn:hover {
    background: #128C7E;
    transform: translateY(-3px);
    color: white;
    box-shadow: 0 5px 15px rgba(37,211,102,0.4);
}
.fulfill-btn, .btn-fulfill {
    background: var(--primary-red);
}
.fulfill-btn:hover, .btn-fulfill:hover {
    background: var(--primary-red-hover);
    box-shadow: 0 5px 15px rgba(230,57,70,0.4);
}
.urgency-badge {
    padding: 8px 15px;
    border-radius: 50px;
    font-weight: 700;
    font-size: 0.9rem;
}

/* Verification Modal */
.verification-modal {
    display: none;
    position: fixed;
    top: 0; left: 0; right: 0; bottom: 0;
    background: rgba(0,0,0,0.6);
    backdrop-filter: blur(5px);
    z-index: 2000;
    align-items: center;
    justify-content: center;
}
.verification-content {
    background: var(--card-bg);
    padding: 40px;
    border-radius: 20px;
    max-width: 400px;
    width: 90%;
    position: relative;
    box-shadow: var(--shadow-hover);
    text-align: center;
}
.close-modal {
    position: absolute;
    top: 15px; right: 20px;
    font-size: 1.5rem;
    cursor: pointer;
    color: var(--text-muted);
}
.verification-title {
    color: var(--text-main);
    font-weight: 800;
    margin-bottom: 10px;
}
.verification-input {
    width: 100%;
    padding: 15px;
    font-size: 2rem;
    text-align: center;
    letter-spacing: 10px;
    border: 2px solid var(--glass-border);
    border-radius: 15px;
    margin-bottom: 20px;
    background: var(--bg-main);
    color: var(--text-main);
}
.verification-input:focus {
    outline: none;
    border-color: var(--primary-red);
}
.verification-btn {
    width: 100%;
    background: var(--primary-red);
    color: white;
    padding: 15px;
    border-radius: 15px;
    border: none;
    font-weight: 700;
    font-size: 1.1rem;
    cursor: pointer;
    transition: all 0.3s ease;
}
.verification-btn:hover {
    background: var(--primary-red-hover);
    box-shadow: 0 5px 15px rgba(230,57,70,0.4);
}

/* Map Page Specifics */
.search-section {
    background: var(--card-bg);
    padding: 30px;
    border-radius: 20px;
    box-shadow: var(--shadow-soft);
    margin-bottom: 40px;
}
.search-btn {
    background: var(--primary-red);
    color: white;
    border: none;
    padding: 12px 30px;
    border-radius: 50px;
    font-weight: 600;
    width: 100%;
    transition: all 0.3s ease;
}
.search-btn:hover {
    background: var(--primary-red-hover);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(230,57,70,0.4);
}
.map-section {
    display: flex;
    gap: 30px;
    margin-top: 40px;
    height: 600px;
}
.map-container {
    flex: 2;
    position: relative;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: var(--shadow-soft);
}
#map {
    height: 100%;
    width: 100%;
}
.donor-details {
    flex: 1;
    background: var(--card-bg);
    padding: 25px;
    border-radius: 20px;
    box-shadow: var(--shadow-soft);
    overflow-y: auto;
}
@media (max-width: 992px) {
    .map-section {
        flex-direction: column;
        height: auto;
    }
    .map-container {
        height: 400px;
    }
}
"""

with open(main_css_path, 'a', encoding='utf-8') as f:
    f.write(missing_css)

print("Appended missing CSS.")
