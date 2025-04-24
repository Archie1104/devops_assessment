# Use official Python image
FROM python:3.9-slim
# Set the working directory inside the container
WORKDIR /app
# Copy the local files into the container
COPY . /app
# Install Flask using pip
RUN pip install Flask
# Expose the port that Flask runs on
EXPOSE 5000
# Set the entry point to run the Flask app
CMD ["python", "app.py"]
