# Use Python 3.12 Alpine image for a lightweight container
FROM python:3.12-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies listed in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy the rest of the application files into the container
COPY . .

# Expose the port the app will run on
EXPOSE 8080

# Use Gunicorn to run the app
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
