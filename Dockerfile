# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port (change if your app uses a different port)
EXPOSE 8080

# Set the PORT environment variable to match exposed port
ENV PORT=8080

# Command to run the application (adjust as needed)
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:${PORT} main:app"]

