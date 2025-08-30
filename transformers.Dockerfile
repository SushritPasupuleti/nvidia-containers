# Use official Python image with CUDA support
FROM nvidia/cuda:12.2.0-base-ubuntu22.04

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install --upgrade pip
RUN pip3 install torch transformers accelerate

# Add test script
COPY transformers_test.py .

# Run the test script
CMD ["python3", "transformers_test.py"]

