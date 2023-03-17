# Use the official Python image as the base image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 8000 for the Waitress server to listen on
EXPOSE 8000

# Start the Waitress server using the entrypoint command
ENTRYPOINT ["waitress-serve", "--port=8000", "myapp:app"]
