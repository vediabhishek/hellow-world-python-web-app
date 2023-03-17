# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app code to the working directory
COPY . .

# Expose port 8000 for Gunicorn
EXPOSE 8000

# Start Gunicorn with 4 worker processes
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "4", "myapp:app"]

