# How to Run Prompt2Poster

## Method 1: Quick Start (Windows) ⚡
**Double-click:** `START_HERE.bat`

## Method 2: Python Script (All Platforms) 🐍
```bash
python run.py
```

## Method 3: Manual Commands (Step by Step) 📝

### Windows (PowerShell/CMD):
```powershell
# Navigate to backend
cd backend

# Activate virtual environment
.\venv\Scripts\activate

# Start server
python app.py
```

Then open your browser to: **http://localhost:5000**

### Linux/Mac:
```bash
# Navigate to backend
cd backend

# Activate virtual environment
source venv/bin/activate

# Start server
python app.py
```

Then open your browser to: **http://localhost:5000**

## Method 4: Direct Python (If venv already set up)
```bash
cd backend
venv\Scripts\python.exe app.py    # Windows
# OR
cd backend
venv/bin/python app.py             # Linux/Mac
```

## Quick Reference Commands

### Check if server is running:
```bash
curl http://localhost:5000/health
```

### Stop the server:
- Press `Ctrl+C` in the terminal where it's running

### Install dependencies manually:
```bash
cd backend
pip install -r requirements.txt
```

## Troubleshooting

### Port 5000 already in use?
```bash
# Windows - Find what's using port 5000
netstat -ano | findstr :5000

# Linux/Mac - Find what's using port 5000
lsof -i :5000
```

### Virtual environment not found?
```bash
cd backend
python -m venv venv
venv\Scripts\activate    # Windows
# OR
source venv/bin/activate # Linux/Mac
pip install -r requirements.txt
```

