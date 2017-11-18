#!/bin/bash

# First we upgrade the system
sudo apt update
sudo apt upgrade

# Now we install the necessary tools needed
sudo apt install macchanger tor torify torsocks pidgin pidgin-otr nmap

# Change MAC address
echo 'Changing MAC address...'
sudo ifconfig wlp3s0 down
sudo macchanger -r wlp3s0
sudo ifconfig wlp3s0 up

echo 'Assessing open ports...'
nmap -Pn 127.0.0.1
echo 'Close any ports you may with iptables'



