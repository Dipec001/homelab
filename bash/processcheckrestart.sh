#!/bin/bash

if pgrep -x "nginx" > /dev/null; then
    echo "Nginx is running"
else
    echo "Nginx is NOT running, restarting..."
    sudo systemctl restart nginx
fi

