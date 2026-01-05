# Prompt2Poster Backend Setup

## Environment Variables

This backend requires a Hugging Face API token for background removal functionality.

### Setup Instructions:

1. **Get a Hugging Face Token:**
   - Go to https://huggingface.co/settings/tokens
   - Create a new token with "read" permissions
   - Copy the token (it starts with `hf_`)

2. **Configure the token:**
   
   **Option A: Edit .env file**
   ```bash
   # Edit the .env file in this directory
   HUGGINGFACE_TOKEN=hf_your_actual_token_here
   ```

   **Option B: Set environment variable**
   ```powershell
   $env:HUGGINGFACE_TOKEN="hf_your_actual_token_here"
   ```

   **Option C: Create .env file with your token**
   ```bash
   echo "HUGGINGFACE_TOKEN=hf_your_actual_token_here" > .env
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   # Or manually:
   pip install flask flask-cors pillow requests python-dotenv
   ```

4. **Run the server:**
   ```bash
   python app.py
   ```

## API Endpoints

- `POST /remove-bg` - Remove background from uploaded image
- `POST /generate` - Generate base poster design
- `GET /health` - Health check
- `GET /test-hf` - Test Hugging Face API connectivity

## Testing

Once the server is running with a valid token, you can test:
```bash
curl http://localhost:5000/test-hf
```
