FROM python:3

WORKDIR /data

# Install dependencies for Python + distutils
RUN apt-get update && apt-get install -y python3-distutils

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Run migrations
RUN python manage.py migrate || true

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
