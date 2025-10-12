FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt update && apt install -y \
    gcc \
    g++ \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    zlib1g-dev \
    build-essential \
    python3-dev \
    git \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/* \
    && apt clean

# Copy requirements
COPY requirements.txt .

# Install Python packages
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy application
COPY . .

CMD ["python", "bot.py"]
