# ✅ Use a stable version of Python
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# ✅ Install system dependencies for building Python packages
RUN apt update && apt install -y \
    build-essential \
    gcc \
    libffi-dev \
    libssl-dev \
    python3-dev \
    git \
    ffmpeg \
    && apt clean

# Copy only requirements first (for better caching)
COPY requirements.txt .

# ✅ Avoid pip root warnings
ENV PIP_ROOT_USER_ACTION=ignore

# ✅ Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the full project
COPY . .

# Default command
CMD ["python", "bot.py"]
