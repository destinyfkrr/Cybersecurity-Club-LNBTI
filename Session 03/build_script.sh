#!/bin/bash

# Update package information
sudo apt update -y

# Create user 'chami' with a strong password
sudo useradd chami -m -s /bin/bash
echo -e "ilovechocolates\nilovechocolates" | sudo passwd chami

# Create directories for FTP and SMB
sudo mkdir -p /home/chami/ftp
sudo mkdir -p /home/chami/smb

# Create files with content
echo "Why are you keep forgetting your Samba share credentials chami? use the password 'sambaisfun' to login.." | sudo tee /home/chami/ftp/note.txt
echo "Chami, I resetted your account password again to 'ilovechocolates' as you keep forgetting it. Don't lose it again. - Admin" | sudo tee /home/chami/smb/password.txt

# Set permissions for the directories
sudo chown chami:chami /home/chami/ftp
sudo chown chami:chami /home/chami/smb

# FTP
echo "LNBTI{F1nally_Y0u_f0und_m3}" > /home/chami/user_flag.txt
echo "Chami, you know something? Our admin loves the batman series, i bruteforced his password and was able to find that his password is 'iLoveBatMan00##' . Pretty stupid isn't it? - Destiny" > /home/chami/mail.txt
sudo apt install vsftpd -y
sudo systemctl start vsftpd

# Configure vsftpd for anonymous access and custom directory
sudo sed -i 's/anonymous_enable=NO/anonymous_enable=YES/' /etc/vsftpd.conf
sudo sed -i 's/local_enable=NO/local_enable=YES/' /etc/vsftpd.conf
echo "anon_root=/home/chami/ftp" | sudo tee -a /etc/vsftpd.conf
echo "chroot_local_user=YES" | sudo tee -a /etc/vsftpd.conf

# SMB
sudo apt install samba -y
sudo smbpasswd -a chami #Use 'sambaisfun' as the Password here

# Create Samba share 'LNBTI'
echo "[LNBTI]" | sudo tee -a /etc/samba/smb.conf
echo "   path = /home/chami/smb" | sudo tee -a /etc/samba/smb.conf
echo "   browseable = yes" | sudo tee -a /etc/samba/smb.conf
echo "   read only = no" | sudo tee -a /etc/samba/smb.conf
sudo systemctl start smbd
sudo systemctl restart vsftpd

# Create root flag at /root
echo "LNBTI{CTF_CLUB_RULES_at_ROOT!}" | sudo tee /root/root_flag.txt