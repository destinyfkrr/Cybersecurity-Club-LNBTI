#!/bin/bash

# Install MySQL
sudo apt-get update
sudo apt-get install mysql-server -y

# Set up MySQL with root user and password 'test'
sudo mysql <<MYSQL_SCRIPT
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'test';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

# Allow MySQL to listen on all interfaces
sudo sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL service
sudo service mysql restart

# Create a database named 'users'
sudo mysql -u root -p'test' -e "CREATE DATABASE IF NOT EXISTS users;"

# Create a database named 'users'
sudo mysql -u root -p'test' -e "CREATE DATABASE IF NOT EXISTS users;"

# Use the 'users' database
sudo mysql -u root -p'test' -e "USE users;"

# Create a table named 'credentials' with columns 'user' and 'password'
sudo mysql -u root -p'test' users -e "CREATE TABLE IF NOT EXISTS credentials (user VARCHAR(255), password VARCHAR(255));"

# Insert data into the 'credentials' table
sudo mysql -u root -p'test' users -e "INSERT INTO credentials (user, password) VALUES ('chami', 'ilovepuppies'), ('destiny', 'capybaraislife'), ('hareen', 'gymislife'), ('vinuk', 'switchisbetter');"

# Create a MySQL user for remote access
sudo mysql -u root -p'test' -e "CREATE USER 'hareen'@'%' IDENTIFIED BY 'gymislife';"
sudo mysql -u root -p'test' -e "GRANT ALL PRIVILEGES ON *.* TO 'hareen'@'%' WITH GRANT OPTION;"
sudo mysql -u root -p'test' -e "FLUSH PRIVILEGES;"

# Install Apache web server and enable it
sudo apt-get install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

# Remove current files in /var/www/html
sudo rm -rf /var/www/html/*

# Extract files from web.zip to /var/www/html
sudo apt-get install unzip -y
sudo unzip web.zip -d /var/www/html

# Create a directory /news
sudo mkdir -p /var/www/html/news

# Create a file 01.01.2024.txt with content "hehe"
sudo bash -c 'echo "Dear hareen, Due to a recent cyberattack to our company, our company database got leaked. I was able to see that your password was 'gymislife'. Please change it asap to avoid any kids hacking us! - Admin " > /var/www/html/news/01.01.2024.txt'

# Create a user 'chami' with password 'ilovechocolates'
sudo useradd chami -m -s /bin/bash
echo -e "ilovepuppies\nilovepuppies" | sudo passwd chami

# Add 'chami' user to sudoers file to run 'bash' command as sudo
echo "chami ALL=(ALL:ALL) NOPASSWD: /bin/bash" | sudo tee -a /etc/sudoers.d/chami

# Create a hidden /home/chami/.backup directory
sudo mkdir -p /home/chami/.backup

# Create 500 files in /home/chami/.backup with random names and content
for i in {1..500}; do
    filename=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1).txt
    filepath="/home/chami/.backup/$filename"
    random_word=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 100 | head -n 1)
    echo "$random_word" > "$filepath"
done

# Create user flag
echo "LNBTI{U53r_c4ptur3d!}" > /home/chami/user_flag.txt
# Create a file backup.txt with content "backup complete"
echo "LNBTI{G00d_j0b_f1nd1ng_m3}" > /home/chami/.backup/backup.txt
sudo systemctl restart apache2
echo "Database, web server, user, files, backup, and sudo setup completed successfully."

# Create root flags
echo "LNBTI{Pr0_H4ck3r!}" | sudo tee /root/root_flag.txt
echo "Congratulations on pwning the machine! Proud of you ;) - dest1ny" | sudo tee /root/readme.txt