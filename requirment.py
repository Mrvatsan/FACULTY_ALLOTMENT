import os

structure = {
    "faculty_invigilation_system": {
        "": ["app.py", "config.py", "requirements.txt", "README.md"],
        "database": ["db.sql", "db_connect.py"],
        "auth": ["__init__.py", "login.py", "session_handler.py"],
        "faculty": ["__init__.py", "faculty_routes.py", "faculty_allocation.py",
                    "faculty_shuffle_logic.py", "faculty_availability.py", "faculty_substitute.py"],
        "exam": ["__init__.py", "semester_exam.py", "internal_exam.py"],
        "allocation": ["__init__.py", "hod_squad_assignment.py",
                       "invigilator_assignment.py", "reallocation_logic.py"],
        "templates": ["login.html", "faculty_dashboard.html",
                      "faculty_allocation_view.html", "faculty_availability.html",
                      "substitute_faculty.html", "allocation_status.html"],
        "static/css": ["style.css"],
        "static/js": ["main.js"],
        "logs": ["allocation_logs.txt"]
    }
}

def create_structure(base, content):
    for folder, files in content.items():
        base_path = os.path.join(base, folder)
        os.makedirs(base_path, exist_ok=True)
        for file in files:
            open(os.path.join(base_path, file), "w").close()

# Run
for root, content in structure.items():
    os.makedirs(root, exist_ok=True)
    create_structure(root, content)

print("Folder structure created successfully!")
