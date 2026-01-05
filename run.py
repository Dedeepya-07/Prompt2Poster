#!/usr/bin/env python3
"""
Prompt2Poster - Cross-platform startup script
Run this file to start the application
"""
import os
import sys
import subprocess
import webbrowser
import time
from pathlib import Path

def main():
    print("=" * 50)
    print("Prompt2Poster - Starting Application")
    print("=" * 50)
    print()
    
    # Get the project root directory
    project_root = Path(__file__).parent.absolute()
    backend_dir = project_root / "backend"
    
    # Check if backend directory exists
    if not backend_dir.exists():
        print("ERROR: Backend directory not found!")
        sys.exit(1)
    
    # Change to backend directory
    os.chdir(backend_dir)
    
    # Check for virtual environment
    venv_python = None
    if sys.platform == "win32":
        venv_python = backend_dir / "venv" / "Scripts" / "python.exe"
    else:
        venv_python = backend_dir / "venv" / "bin" / "python"
    
    python_cmd = str(venv_python) if venv_python.exists() else sys.executable
    
    # Activate venv and install dependencies if needed
    if not venv_python.exists():
        print("Creating virtual environment...")
        subprocess.run([sys.executable, "-m", "venv", "venv"], check=True)
        
        if sys.platform == "win32":
            venv_python = backend_dir / "venv" / "Scripts" / "python.exe"
        else:
            venv_python = backend_dir / "venv" / "bin" / "python"
        
        python_cmd = str(venv_python)
        
        print("Installing dependencies...")
        subprocess.run([python_cmd, "-m", "pip", "install", "--upgrade", "pip"], check=True)
        subprocess.run([python_cmd, "-m", "pip", "install", "-r", "requirements.txt"], check=True)
    
    # Check if .env file exists
    env_file = backend_dir / ".env"
    if not env_file.exists():
        print()
        print("NOTE: No .env file found. Background removal will use a simpler method.")
        print("      To enable Hugging Face background removal, create backend/.env with:")
        print("      HUGGINGFACE_TOKEN=your_token_here")
        print()
    
    # Start the Flask server
    print("Starting Flask server on http://localhost:5000")
    print()
    print("Keep this window open while using the app.")
    print("Press Ctrl+C to stop the server.")
    print()
    print("-" * 50)
    print()
    
    # Open browser after a short delay
    def open_browser():
        time.sleep(2)
        webbrowser.open("http://localhost:5000")
    
    import threading
    browser_thread = threading.Thread(target=open_browser, daemon=True)
    browser_thread.start()
    
    # Run the Flask app
    try:
        subprocess.run([python_cmd, "app.py"], check=True)
    except KeyboardInterrupt:
        print()
        print("Server stopped.")
    except subprocess.CalledProcessError as e:
        print(f"Error starting server: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

