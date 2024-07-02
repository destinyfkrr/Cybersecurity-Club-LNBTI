#!/bin/bash

# Install MySQL
sudo apt-get update
sudo apt-get install mysql-server -y

# Set up MySQL with root user and password 'password'
sudo mysql <<MYSQL_SCRIPT
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

# Allow MySQL to listen on all interfaces
sudo sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL service
sudo service mysql restart

# Create a database named 'users'
sudo mysql -u root -p'password' -e "CREATE DATABASE IF NOT EXISTS users;"

# Use the 'users' database
sudo mysql -u root -p'password' -e "USE users;"

# Create a table named 'credentials' with columns 'user' and 'password'
sudo mysql -u root -p'password' users -e "CREATE TABLE IF NOT EXISTS credentials (user VARCHAR(255), password VARCHAR(255));"

# Insert data into the 'credentials' table
sudo mysql -u root -p'password' users -e "INSERT INTO credentials (user, password) VALUES ('sasindi', '1eef2ed29ebc81347aa56dce2995da6d'), ('destiny', '9f05aa4202e4ce8d6a72511dc735cce9'), ('marc', '8352269ae368edfeacfa7c1213c35015'), ('vinuk', '46ea0d5b246d2841744c26f72a86fc29');"

# Create a MySQL user for remote access
sudo mysql -u root -p'password' -e "CREATE USER 'hareen'@'%' IDENTIFIED BY 'mylifemyrules';"
sudo mysql -u root -p'password' -e "GRANT ALL PRIVILEGES ON *.* TO 'hareen'@'%' WITH GRANT OPTION;"
sudo mysql -u root -p'password' -e "FLUSH PRIVILEGES;"

# Install Apache web server and enable it
sudo apt-get install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

# Remove current files in /var/www/html
sudo rm -rf /var/www/html/*

# Extract files from web.zip to /var/www/html
sudo apt-get install unzip -y
sudo unzip web.zip -d /var/www/html


# Create a user 'marc' with password 'myspace1'
sudo useradd marc -m -s /bin/bash
echo -e "myspace1\nmyspace1" | sudo passwd marc

# Add 'marc' user to sudoers file to run 'nano' command as sudo
echo "marc ALL=(ALL:ALL) NOPASSWD: /usr/bin/nano" | sudo tee -a /etc/sudoers.d/chami


# Create user flag
echo "LNBTI{G00d_j0b_us3r}" > /home/marc/user_flag.txt

sudo systemctl restart apache2
echo "Database, web server, user, files, backup, and sudo setup completed successfully."

# Create root flags
echo "LNBTI{I_4m_4_Pr0}" | sudo tee /root/root_flag.txt
echo "Congratulations on pwning the machine! Proud of you ;) - dest1ny" | sudo tee /root/readme.txt