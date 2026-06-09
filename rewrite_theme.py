import os
import re

templates_dir = r'd:\Personal Projects\BloodLink\bloodlink_backend\core\templates'
static_css_dir = r'd:\Personal Projects\BloodLink\bloodlink_backend\static\css'

if not os.path.exists(static_css_dir):
    os.makedirs(static_css_dir)

html_files = [f for f in os.listdir(templates_dir) if f.endswith('.html')]

for file in html_files:
    filepath = os.path.join(templates_dir, file)
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace <style>...</style> with <link rel="stylesheet" href="{% static 'css/main.css' %}">
    # And also add custom.css if needed, but we'll just put it all in main.css
    new_content = re.sub(r'<style>.*?</style>', r'<link rel="stylesheet" href="{% static \'css/main.css\' %}">', content, flags=re.DOTALL)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)

print('Migrated inline styles.')
