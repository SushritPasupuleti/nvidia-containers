# Base image: Ubuntu 24.04
FROM ubuntu:24.04

# Environment setup
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget gnupg2 software-properties-common \
    python3-pip \
    git \
	python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Add NVIDIA CUDA repository and install CUDA 12.8
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i cuda-keyring_1.1-1_all.deb && \
    apt-get update && \
    apt-get install -y cuda-toolkit-12-8

# Set CUDA environment variables
ENV PATH=/usr/local/cuda-12.8/bin${PATH:+:${PATH}}
ENV LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Set virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
ENV VIRTUAL_ENV="/opt/venv"
ENV DEBIAN_FRONTEND=noninteractive

# Install Python packages
RUN pip3 install --upgrade pip
RUN pip3 install torch transformers accelerate

# Copy the test script
COPY transformers_test.py .

# Run the test script
CMD ["python3", "transformers_test.py"]
