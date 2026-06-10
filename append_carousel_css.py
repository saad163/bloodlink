import os

main_css_path = r'd:\Personal Projects\BloodLink\bloodlink_backend\static\css\main.css'

carousel_css = """
/* Custom Carousel Controls */
.carousel {
    position: relative;
}

.custom-carousel-btn {
    width: 50px;
    height: 50px;
    background: var(--white);
    border-radius: 50%;
    top: 50% !important;
    bottom: auto !important;
    transform: translateY(-50%);
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    opacity: 1 !important;
    z-index: 10;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--text-main);
    border: none;
    position: absolute;
}

.custom-carousel-btn:hover {
    background: var(--primary-red);
    color: var(--white) !important;
    box-shadow: 0 8px 20px rgba(230, 57, 70, 0.3);
}

.custom-carousel-btn i {
    font-size: 1.5rem;
    font-weight: bold;
    color: inherit;
}

.carousel-control-prev.custom-carousel-btn {
    left: -25px;
}

.carousel-control-next.custom-carousel-btn {
    right: -25px;
}

@media (max-width: 768px) {
    .carousel-control-prev.custom-carousel-btn {
        left: -10px;
    }
    .carousel-control-next.custom-carousel-btn {
        right: -10px;
    }
}
"""

with open(main_css_path, 'a', encoding='utf-8') as f:
    f.write(carousel_css)

print("Appended carousel CSS to main.css.")
