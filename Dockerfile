# Use the official Python 3.7 image, slim runs a smaller image
FROM python:3.7-slim
# Set the working directory in the container
WORKDIR /app
# Copy the project files into the container
COPY . /app
# Install dependencies in one step to minimize layers
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
# Expose the port that the app will run on
EXPOSE 5000
# Set environment variables
ENV FLASK_APP=app.py
# allow app to be run outside of localhost (all addresses)
ENV FLASK_RUN_HOST=0.0.0.0
# Command to run the application
CMD ["python", "app.py"]