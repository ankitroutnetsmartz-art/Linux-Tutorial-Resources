#!/bin/bash

#network scripts
#ping is used to check network connection
#(ping -c 1) is used to send one packet

read -p "which webpage you want to check" 
ping -c 1 www.google.com
sleep 5s
if [[ $? -eq 0 ]]
then
echo "success"
else
echo "failed"
fi

