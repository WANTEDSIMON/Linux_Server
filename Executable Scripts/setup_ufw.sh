#!/bin/bash

# Step 1: Install UFW if not installed
if ! command -v ufw &> /dev/null; then
    echo "UFW is not installed. Installing now..."
    sudo apt update && sudo apt install -y ufw
fi

# Step 2: Check UFW status
echo "Checking UFW status..."
sudo ufw status

# Step 3: Set default UFW rules
echo "Setting up default UFW rules..."
sudo ufw default allow outgoing
sudo ufw default deny incoming

# Step 4: Allow necessary services
echo "Allowing SSH access..."
sudo ufw allow ssh

echo "Allowing HTTP access"
sudo ufw allow http

# Step 5: Enable UFW
echo "Enabling UFW..."
sudo ufw enable

# Step 6: Restart server
echo "Restarting server to apply firewall rules..."
sudo reboot

# Step 7: Wait for reboot and instruct user to SSH back in
echo "Reconnect via SSH after the server restarts."

# Step 8: After reboot add VNC
echo "Once reconnected, run the following commands manually:"
echo "sudo ufw allow <PORT>/tcp  # Replace with the youre VNC port"
echo "sudo reboot"
