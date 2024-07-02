#!/bin/bash

# Install MySQL
sudo apt-get update
sudo apt-get install mysql-server -y

# Set up MySQL with root user and password 'password'
sudo mysql <<MYSQL_SCRIPT
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;
MYSQL_SCRIPT


# Create a database named 'employees'
sudo mysql -u root -p'password' -e "CREATE DATABASE IF NOT EXISTS employees;"

# Use the 'employees' database
sudo mysql -u root -p'password' -e "USE employees;"

# Create a table named 'credentials' with columns 'user' and 'password'
sudo mysql -u root -p'password' employees -e "CREATE TABLE IF NOT EXISTS credentials (user VARCHAR(255), password VARCHAR(255));"

# Insert data into the 'credentials' table
sudo mysql -u root -p'password' employees -e "INSERT INTO credentials (user, password) VALUES ('root', 'LNBTI##LNBTI123#'),('flag', 'LNBTI{InT3rn4l_S3rvic3s}');"

# Restart MySQL service
sudo service mysql restart

# Install Apache web server and enable it
sudo apt-get install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

# Remove current files in /var/www/html
sudo rm -rf /var/www/html/*

# Extract files from web.zip to /var/www/html
sudo apt-get install unzip -y
sudo unzip web.zip -d /var/www/html

# Create a user 'chami' with password 'blahblahblah'
sudo useradd chami -m -s /bin/bash
echo -e "blahblahblah\nblahblahblah" | sudo passwd chami

# Create directories for SMB
sudo mkdir -p /home/chami/smb

# SMB
sudo apt install samba -y
sudo smbpasswd -a chami #Use 'ichinisanyongo' as the Password here
# Create Samba share 'LNBTI'
echo "[LNBTI]" | sudo tee -a /etc/samba/smb.conf
echo "   path = /home/chami/smb" | sudo tee -a /etc/samba/smb.conf
echo "   browseable = yes" | sudo tee -a /etc/samba/smb.conf
echo "   read only = no" | sudo tee -a /etc/samba/smb.conf
sudo systemctl start smbd

echo "SMB Backup Completed on 8.02.2024 : chami:blahblahblah : Ubuntu Linux 20LTS" | sudo tee /home/chami/smb/backup.txt

sudo mkdir -p /home/chami/.backup
# Create 500 files in /home/chami/.backup with random names and content
for i in {1..500}; do
    filename=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1).txt
    filepath="/home/chami/.backup/$filename"
    random_word=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 100 | head -n 1)
    echo "$random_word" > "$filepath"
done

echo "LNBTI{G00d_j0b_f1nd1ng_m3}" > /home/chami/.backup/findmeifucan.txt

# Create user flag
echo "LNBTI{G00d_J0b_M4t3}" > /home/chami/user.txt
echo "root:password" > /home/chami/mysql.txt

sudo systemctl restart apache2
echo "Database, web server, user, files, backup, and sudo setup completed successfully."

# Create root flags
echo "LNBTI{ST0P_F1nD1ng_M3!!}" | sudo tee /root/root.txt
echo "Congratulations on pwning the machine! Proud of you ;) - dest1ny" | sudo tee /root/readme.txt