#!/bin/bash

echo "Loading environnment variables"
/app/config2vars > /app/config.env
chmod 755 /app/config.env
cat /app/config.env
source /app/config.env

echo "Starting..."
exec npm start
