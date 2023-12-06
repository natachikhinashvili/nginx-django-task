# Use an official Python runtime as a base image
FROM python:latest
# Install Nginx
RUN apt-get update && apt-get install -y nginx
# Create and set the working directory
WORKDIR /app
# Copy the requirements file to the working directory
COPY requirements.txt /app/
COPY . /app/

COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
# Expose ports
EXPOSE 80
# Command to run Nginx and the Django development server
CMD service nginx start && python manage.py runserver 0.0.0.0:8000