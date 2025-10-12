FROM python:3.11-slim

WORKDIR /app

# Install build dependencies and dev headers
RUN apt update && apt install -y \
    gcc \
    libffi-dev \
    libssl-dev \
    build-essential \
    python3-dev \
    git \
    ffmpeg \
    && apt clean

# Copy requirements first for better caching
COPY requirements.txt .

# Avoid root pip warning
ENV PIP_ROOT_USER_ACTION=ignore

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

CMD ["python", "bot.py"]
