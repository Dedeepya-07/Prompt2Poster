#!/bin/bash
echo "========================================"
echo "  Prompt2Poster - Starting Application"
echo "========================================"
echo ""

echo "[1/2] Starting Backend Server..."
echo ""
cd backend
source venv/bin/activate
python app.py &
BACKEND_PID=$!
sleep 3

echo ""
echo "[2/2] Opening Frontend..."
echo ""
cd ../frontend
if command -v xdg-open > /dev/null; then
    xdg-open index.html
elif command -v open > /dev/null; then
    open index.html
else
    echo "Please open frontend/index.html in your browser"
fi

echo ""
echo "========================================"
echo "  Application Started!"
echo "========================================"
echo ""
echo "Backend: http://localhost:5000"
echo "Frontend: Check your browser"
echo ""
echo "Press Ctrl+C to stop the backend server"
wait $BACKEND_PID

