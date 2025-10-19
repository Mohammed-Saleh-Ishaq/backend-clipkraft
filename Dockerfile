FROM python:3.11-slim

WORKDIR /app

#RUN apt-get update && apt-get install -y ffmpeg build-essential git python3-pip && rm -rf /var/lib/apt/lists/*
##RUN apt-get update && apt-get install -y ffmpeg && apt-get clean && rm -rf /var/lib/apt/lists/*
##RUN apt-get update && apt-get install -y ffmpeg libavcodec-extra && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y ffmpeg libav-tools libavcodec-extra && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app

ENTRYPOINT ["python"]
##CMD ["-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
CMD ["-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "${PORT}"]


##FROM python:3.11-slim

# Set working directory inside the container
##WORKDIR /app

# Install system dependencies
##RUN apt-get update && apt-get install -y ffmpeg build-essential git && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
##OPY requirements.txt .
##RUN pip install --no-cache-dir -r requirements.txt && pip show uvicorn

# Copy the entire app directory into the container
#COPY ./app ./app
#COPY . .
##COPY app/ ./app

# Run the app as a module so relative imports work
#CMD ["python", "-m", "main"]

# Start the FastAPI app
#CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
#CMD ["sh", "-c", "python -m uvicorn app.main:app --host 0.0.0.0 --port $PORT"]
##CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

