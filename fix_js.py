import os
import re

templates_dir = r'd:\Personal Projects\BloodLink\bloodlink_backend\core\templates'
html_files = [f for f in os.listdir(templates_dir) if f.endswith('.html')]

for file in html_files:
    filepath = os.path.join(templates_dir, file)
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace the dark rgba colors with glass-bg from CSS variable or a light rgba
    content = content.replace("'rgba(5, 5, 5, 0.95)'", "'rgba(255, 255, 255, 0.95)'")
    content = content.replace("'rgba(10, 10, 10, 0.9)'", "'rgba(255, 255, 255, 0.85)'")
    
    # Replace navbar-dark with navbar-light so toggler icon is dark
    content = content.replace('navbar-dark', 'navbar-light')
    
    # In index.html, there's text-white that I redefined, but I should remove inline style hardcodes if any.
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

print('Fixed JS and navbar-dark.')
