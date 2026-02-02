#!/bin/bash
FREE_SPACE= $(free -mt | grep "Total" | awk '{print $4}')
TH=500
if [[$FREE SPACE -lt $TH]]
then
echo "warning, RAM is running low"
else 
echo "RAM Space is sufficient - $FREE SPACE M" 
fi

