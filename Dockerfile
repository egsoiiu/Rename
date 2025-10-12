# Use a compatible and stable Python version
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install required build tools and headers
RUN apt update && apt install -y \
    gcc \
    libffi-dev \
    libssl-dev \
    build-essential \
    python3.11-dev \
    git \
    ffmpeg \
    && apt clean

# Copy requirements first to cache dependencies
COPY requirements.txt .

# Avoid root pip warning
ENV PIP_ROOT_USER_ACTION=ignore

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the full project
COPY . .

# Run your bot
CMD ["python", "bot.py"]
