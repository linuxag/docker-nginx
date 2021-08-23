#! /bin/bash
sudo apt update
sudo apt install -y nginx
echo "<h1>server 2</h1>" | sudo tee /var/www/html/index.html