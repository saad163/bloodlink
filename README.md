# BloodLink - Smart Blood Donation & Emergency Response System

## Overview
BloodLink is a comprehensive backend system built with Django, designed to bridge the gap between blood donors and patients in need. It streamlines the process of finding and requesting blood during emergencies, maintaining a robust database of donors and managing patient requests efficiently.

## Features
- **Donor Management**: Register and manage blood donors with detailed profiles including blood group, location (city, colony, address, coordinates), and donation history.
- **Patient Requests**: Create, track, and manage emergency blood requests with specific requirements (blood group, units needed, urgency level, hospital details).
- **Automated Responses**: Track email responses between donors and patient requests with status updates (Available, Accepted, Rejected, etc.).
- **Verification System**: Unique verification codes for secure patient request processing.
- **Geospatial Data**: Includes latitude and longitude tracking for donors to help find nearby blood matches.

## Tech Stack
- **Framework**: Django (Python)
- **Database**: SQLite (Development) / Supported Relational DBs (Production)

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/saad163/bloodlink.git
cd bloodlink/bloodlink_backend
```

### 2. Create Virtual Environment
```bash
python -m venv venv
source venv/bin/activate  # On Windows use: venv\Scripts\activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Database Setup
```bash
python manage.py makemigrations
python manage.py migrate
```

### 5. Run Development Server
```bash
python manage.py runserver
```

## Models Structure
- `Donor`: Stores comprehensive donor information.
- `PatientRequest`: Manages emergency blood requests.
- `EmailResponse`: Tracks the status of communications between donors and requests.
