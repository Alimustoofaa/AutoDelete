#!/bin/bash

interval_time=$1

if [ -z "$interval_time" ]; then
    interval_time=7
else
    interval="$1"
fi

echo "[Unit]
Description=Auto Delete Service
After=auto_delete.target

[Service]
ExecStart=bash $(pwd)/auto_delete.sh $interval_time
Restart=always
User=$(whoami)

[Install]
WantedBy=default.target" | sudo tee /etc/systemd/system/auto_delete.service

sudo systemctl daemon-reload
sudo systemctl enable auto_delete.service
sudo systemctl start auto_delete.service
sudo systemctl status auto_delete.service