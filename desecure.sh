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

# Iptables
iptables -F FORWARD
iptables -P FORWARD DROP
iptables -A FORWARD -s 0.0.0.0/0.0.0.0 -d 0.0.0.0/0.0.0.0 -m state --state INVALID -j DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I FORWARD -j DROP -p tcp -s 0.0.0.0/0 -m string --string "cmd.exe"
iptables -A FORWARD -p tcp -s 0.0.0.0/0 -d 62.3.3.27/32 --dport 20:22 -j ACCEPT

# NMap
echo 'Checking ports...'
nmap -Pn 127.0.0.1
echo 'Close any ports you may use with iptables'
