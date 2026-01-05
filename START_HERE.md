# How to Run Prompt2Poster

## Quick Start Guide

### Step 1: Start the Backend Server

1. **Open a terminal/command prompt** in the project root directory

2. **Activate the virtual environment:**
   ```powershell
   # Windows PowerShell
   .\backend\venv\Scripts\Activate.ps1
   
   # Or Windows CMD
   backend\venv\Scripts\activate.bat
   ```

3. **Install missing dependencies (if needed):**
   ```bash
   pip install numpy
   ```

4. **Set up Hugging Face Token (Optional - for background removal):**
   
   Create a `.env` file in the `backend` folder:
   ```
   HUGGINGFACE_TOKEN=hf_your_token_here
   ```
   
   **Note:** The app will work without this token, but background removal will fail. You can still use the app for design generation.

5. **Start the backend server:**
   ```bash
   cd backend
   python app.py
   ```
   
   You should see:
   ```
   [STARTUP] Flask server starting on port 5000
   * Running on http://0.0.0.0:5000
   ```

### Step 2: Open the Frontend

1. **Open `frontend/index.html` in your web browser**
   
   - Right-click on `frontend/index.html`
   - Select "Open with" → Choose your browser (Chrome, Firefox, Edge, etc.)
   
   OR
   
   - Navigate to the file in your browser's address bar:
     ```
     file:///C:/Users/Dedeepya Yakkala/Downloads/helloi (4) (2)/helloi/prompt2poster_visibility_fixed/frontend/index.html
     ```

### Step 3: Use the Application

1. **Login/Signup** - Use Firebase authentication
2. **Upload** - Upload your product image
3. **Prompt** - Enter your campaign description and select style
4. **Generate** - Wait for the poster to be generated
5. **Edit** - Customize your poster
6. **Export** - Download your final poster

## Troubleshooting

### Backend won't start
- Make sure Python is installed: `python --version`
- Make sure virtual environment is activated
- Install dependencies: `pip install -r backend/requirements.txt`

### Frontend can't connect to backend
- Make sure backend is running on port 5000
- Check browser console for errors (F12)
- Try accessing `http://localhost:5000/health` in your browser

### Background removal fails
- This is expected if you don't have a Hugging Face token
- The app will still work for design generation
- To enable background removal, add your token to `backend/.env`

## Alternative: Use the Start Scripts

### Windows:
```powershell
cd backend
.\start.bat
```

### Linux/Mac:
```bash
cd backend
chmod +x start.sh
./start.sh
```

