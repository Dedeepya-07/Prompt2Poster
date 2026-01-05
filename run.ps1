# Prompt2Poster - PowerShell Startup Script

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Prompt2Poster - Starting Application" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if virtual environment exists
if (-not (Test-Path "backend\venv\Scripts\Activate.ps1")) {
    Write-Host "ERROR: Virtual environment not found!" -ForegroundColor Red
    Write-Host "Please run: python -m venv backend\venv" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "[1/3] Activating virtual environment..." -ForegroundColor Green
& "backend\venv\Scripts\Activate.ps1"

Write-Host "[2/3] Checking dependencies..." -ForegroundColor Green
try {
    python -c "import numpy" 2>$null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Installing numpy..." -ForegroundColor Yellow
        pip install numpy -q
    }
} catch {
    Write-Host "Installing numpy..." -ForegroundColor Yellow
    pip install numpy -q
}

Write-Host "[3/3] Starting backend server..." -ForegroundColor Green
Write-Host ""
Write-Host "Backend will run on http://localhost:5000" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

# Open frontend in browser
Start-Sleep -Seconds 2
Start-Process "frontend\index.html"

# Start backend server
Set-Location backend
python app.py

