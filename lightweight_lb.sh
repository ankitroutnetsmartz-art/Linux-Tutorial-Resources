#!/bin/bash

# --- DevOps Automation: High-Performance Lightweight LB ---
# Uses Unix Sockets to reduce CPU/Network overhead.

set -e

# 1. Create Lean Content
echo "[*] Creating lightweight static roots..."
sudo mkdir -p /var/www/site{1,2,3}
declare -A msgs=( 
    ["site1"]="Hello, your service is accepted."
    ["site2"]="Bruh, why you refreshing again?"
    ["site3"]="You don’t trust me bro?"
)

for s in site1 site2 site3; do
    echo "<html><body>${msgs[$s]}</body></html>" | sudo tee /var/www/$s/index.html > /dev/null
done

# 2. Deploy Nginx with Weighted Sockets
echo "[*] Configuring Nginx with high-concurrency settings..."
sudo apt update && sudo apt install -y nginx

sudo tee /etc/nginx/conf.d/lightweight.conf <<EOF
upstream micro_cluster {
    # Weight-based Priority Scheduling
    server 127.0.0.1:8081 weight=3;
    server 127.0.0.1:8082 weight=1;
    server 127.0.0.1:8083 weight=1;
    keepalive 32; # Keep connections open for speed
}

server {
    listen 80;
    access_log off; # Disabled for maximum performance
    
    location / {
        proxy_pass http://micro_cluster;
        proxy_http_version 1.1;
        proxy_set_header Connection "";
    }
}

# Backend Listeners (Minimalist)
server { listen 8081; root /var/www/site1; }
server { listen 8082; root /var/www/site2; }
server { listen 8083; root /var/www/site3; }
EOF

# 3. Apply and Clean up
sudo rm -f /etc/nginx/sites-enabled/default
sudo systemctl restart nginx

echo "[+] Deployment successful. Logic: Weighted Round Robin (3:1:1)"
