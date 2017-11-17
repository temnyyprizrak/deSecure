#!/bin/bash

# First we upgrade the system
sudo apt update
sudo apt upgrade

# Now we install the necessary tools needed
sudo apt install macchanger tor torify torsocks pidgin pidgin-otr
