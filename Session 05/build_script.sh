#!/bin/bash

# Update package information
apt update -y

# Install Apache web server and enable it
sudo apt-get install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

# Remove current files in /var/www/html
sudo rm -rf /var/www/html/*

# Extract files from web.zip to /var/www/html
sudo apt-get install unzip -y
sudo unzip web.zip -d /var/www/html

# Create a user 'hareen' with password 'superman'
sudo useradd hareen -m -s /bin/bash
echo -e "superman\nsuperman" | sudo passwd hareen

# Create user flag
echo "LNBTI{500_b3aut1ful_500_3l3g4nt}" > /home/hareen/user.txt

# Restart Apache web server
sudo systemctl restart apache2

# Inform about successful setup
echo "Web server, user, files, backup, and sudo setup completed successfully."

# Give SUID permissions to /bin/bash (be cautious with this)
chmod u+s /bin/bash

# Create root flags
echo "LNBTI{PR0_H4ck3r_Br0}" | sudo tee /root/root.txt
echo "Congratulations on pwning the machine! Proud of you ;) - dest1ny" | sudo tee /root/readme.txt