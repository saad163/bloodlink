import os

templates_dir = r'd:\Personal Projects\BloodLink\bloodlink_backend\core\templates'
html_files = [f for f in os.listdir(templates_dir) if f.endswith('.html')]

for file in html_files:
    filepath = os.path.join(templates_dir, file)
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Fix the escaping issue
    content = content.replace(r"\'css/main.css\'", "'css/main.css'")
    content = content.replace(r"\'css/main.css\'", "'css/main.css'")
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

print('Fixed template syntax error.')
