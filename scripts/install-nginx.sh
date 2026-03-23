#!/bin/bash

set -e

echo "Updating system packages..."
sudo dnf update -y

echo "Installing Nginx..."
sudo dnf install nginx -y

echo "Starting Nginx service..."
sudo systemctl start nginx

echo "Enabling Nginx to start on boot..."
sudo systemctl enable nginx

echo "Checking Nginx status..."
sudo systemctl status nginx --no-pager

echo "Testing local HTTP response..."
curl -I http://localhost

echo "Nginx installation completed successfully."
