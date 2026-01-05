@echo off
echo ========================================
echo Prompt2Poster - Quick Start
echo ========================================
echo.
echo Starting the application...
echo.
echo The backend server will start and automatically open
echo the application in your default browser.
echo.
echo NOTE: If you see a warning about HUGGINGFACE_TOKEN,
echo       background removal will not work. You can still
echo       use the app for design generation.
echo.
echo Press any key to start...
pause >nul

cd backend

echo.
echo Checking virtual environment...
if exist "venv\Scripts\activate.bat" (
    echo Activating virtual environment...
    call venv\Scripts\activate.bat
) else (
    echo Virtual environment not found. Creating one...
    python -m venv venv
    call venv\Scripts\activate.bat
    echo Installing dependencies...
    pip install -r requirements.txt
)

echo.
echo Starting Flask server...
echo The app will open at http://localhost:5000
echo.
echo Keep this window open while using the app.
echo Press Ctrl+C to stop the server.
echo.

timeout /t 2 /nobreak >nul
start http://localhost:5000

python app.py

