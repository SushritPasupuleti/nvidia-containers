# Use NVIDIA's official PyTorch image (based on Ubuntu)
FROM nvcr.io/nvidia/pytorch:22.07-py3

# Set working directory
WORKDIR /workspace

# Install any additional Python packages if needed
# Setup your tooling like Poetry, pipenv, etc.

COPY torch_test.py .

# Set default command to run the test
CMD ["python", "torch_test.py"]

