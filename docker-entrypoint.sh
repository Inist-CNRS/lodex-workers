#!/bin/bash

cd /app

echo "Installing packages..."
/app/installPackages

echo "Rebuild packages..."
npm rebuild

echo "Loading environnment variables..."
/app/config2vars > /app/config.env
chmod 755 /app/config.env
source /app/config.env

echo "Starting cron..."
/app/crontab &

sleep 2

echo "Starting ezs..."
exec npx ezs $*
