#!/bin/bash

set -e

echo "Updating system..."
sudo apt update -y

echo "Installing required packages..."
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "Adding Docker GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating package index..."
sudo apt update -y

echo "Installing Docker Engine..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Starting and enabling Docker..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Docker status:"
sudo systemctl status docker --no-pager

echo "Docker version:"
docker --version

echo "Docker installed successfully ✅"

