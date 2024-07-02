#!/bin/bash
# Create user 'john'
sudo useradd john
# Set a password for the user 'john' (you'll be prompted to enter a password)
sudo passwd john

# Create the home directory for user 'john'
sudo mkdir /home/john

# Create and write content to user.txt in John's home directory
echo "LNBTI{you_f0und_th3_f1r5t}" | sudo tee /home/john/user.txt > /dev/null


# Create and write content to root.txt in the root user's home directory
echo "LNBTI{I_4m_Gr00t}" | sudo tee /root/root.txt > /dev/null

# Adjust ownership and permissions
sudo chown john:john /home/john/user.txt
sudo chown root:root /root/root.txt
sudo chmod 644 /home/john/user.txt /root/root.txt

# Install Apache2
sudo apt-get update
sudo apt-get install apache2 -y

# Enable and start Apache2
sudo systemctl enable apache2
sudo systemctl start apache2