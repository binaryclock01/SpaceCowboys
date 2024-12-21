# Base image with Fedora
FROM fedora:41

# Install development dependencies
RUN dnf install -y \
    git \
    wget \
    unzip \
    python3 \
    python3-pip \
    dotnet-sdk-9.0 && \
    dnf clean all

# Set up Python environment
RUN pip3 install --upgrade pip

# Create the vscode user with UID/GID matching Docker default
RUN useradd -m vscode -u 1000 -s /bin/bash
USER vscode
# Default working directory
WORKDIR /workspace
