@echo off
echo ========================================
echo   Prompt2Poster - Starting Application
echo ========================================
echo.

REM Check if virtual environment exists
if not exist "backend\venv\Scripts\activate.bat" (
    echo ERROR: Virtual environment not found!
    echo Please run: python -m venv backend\venv
    pause
    exit /b 1
)

echo [1/3] Activating virtual environment...
call backend\venv\Scripts\activate.bat

echo [2/3] Checking dependencies...
python -c "import numpy" 2>nul
if errorlevel 1 (
    echo Installing numpy...
    pip install numpy -q
)

echo [3/3] Starting backend server...
echo.
echo Backend will run on http://localhost:5000
echo Press Ctrl+C to stop the server
echo.
echo Opening frontend in browser...
timeout /t 2 /nobreak >nul
start "" "frontend\index.html"

cd backend
python app.py

pause
