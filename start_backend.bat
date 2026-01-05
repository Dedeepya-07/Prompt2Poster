@echo off
echo ========================================
echo Prompt2Poster - Backend Server
echo ========================================
echo.

cd backend

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
echo Starting Flask server on http://localhost:5000
echo.
echo NOTE: If you see a warning about HUGGINGFACE_TOKEN, background removal will not work.
echo       Create a .env file in the backend folder with: HUGGINGFACE_TOKEN=your_token_here
echo.
python app.py

pause

