@echo off
echo Starting Prompt2Poster Backend Server...
echo.
echo Make sure you have activated the virtual environment first!
echo If not, run: backend\venv\Scripts\activate
echo.
cd /d %~dp0
python app.py
pause

