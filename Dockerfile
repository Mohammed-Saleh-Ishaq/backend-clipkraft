FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y ffmpeg build-essential git && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire app directory into the container
#COPY ./app ./app
COPY . .
# Run the app as a module so relative imports work
#CMD ["python", "-m", "main"]

# Start the FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
#CMD ["sh", "-c", "python -m uvicorn app.main:app --host 0.0.0.0 --port $PORT"]
