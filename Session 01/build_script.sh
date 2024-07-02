#!/bin/bash

# Set the flag in flag1.txt
echo "LNBTI{F1r5st_Bl00d}" > /root/flag1.txt

# Add LNBTI{3tC_P4ssw0rd} to the bottom of /etc/passwd
echo "LNBTI{3tC_P4ssw0rd}" >> /etc/passwd

# Add LNBTI{Sh4d0w_F1l3s} to the bottom of /etc/shadow
echo "LNBTI{Sh4d0w_F1l3s}" >> /etc/shadow

# Create a hidden folder named "haha"
mkdir /root/.haha

# Create at least 50 random dummy files with hidden names inside the "haha" folder
for i in {1..500}; do
  rand_name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
  touch "/root/.haha/$rand_name"
done

# Create foundme.txt and add "LNBTI{F1nd_Cmd}" to it, hidden in the "haha" folder
echo "LNBTI{F1nd_Cmd}" > /root/.haha/foundme.txt

# Display a success message
echo "Script executed successfully."

