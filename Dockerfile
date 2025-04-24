
FROM python:3.9-slim #Select Python base image

#Installation environment
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Select the working directory
WORKDIR /app

Installing the system
RUN apt-get update && apt-get install -y \
    build-essential \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app and model
COPY . .

Exposing Streamlit’s default port
EXPOSE 8501

Set the command to execute when the container starts
CMD ["streamlit", "run", "app_pred.py", "--server.port=8501", "--server.address=0.0.0.0"]
