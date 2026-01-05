#!/bin/bash
echo "Starting Prompt2Poster Backend Server..."
echo ""
echo "Make sure you have activated the virtual environment first!"
echo "If not, run: source backend/venv/bin/activate"
echo ""
cd "$(dirname "$0")"
python app.py

