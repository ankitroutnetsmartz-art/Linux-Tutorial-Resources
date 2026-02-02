#!/bin/bash

clear

monitor_system() {
while true; do
tput cup 0 0

echo "========================================"
echo "   SYSTEM MONITOR (Press Ctrl+C to Exit) "
echo "   Date: $(date '+%Y-%m-%d %H:%M:%S')"
echo "========================================"

cpu_usage=$(top -bn2 -d 0.5 | grep "Cpu(s)" | tail -1 | awk '{print 100 - $8}')
echo -e "CPU Usage:    [${cpu_usage}%]"

       
mem_info=$(free -m | awk 'NR==2{printf "%.2f%% (Used: %sMB / Total: %sMB)", $3*100/$2, $3, $2}')
echo -e "Memory:       $mem_info"
       
disk_usage=$(df -h / | awk 'NR==2{print $5 " (Available: " $4 ")"}')
echo -e "Disk (/):     $disk_usage"

        
echo "----------------------------------------"
echo "TOP 3 PROCESSES BY CPU:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 4 | tail -n 3
echo "========================================"
        
        
sleep 2
done
}

monitor_system
