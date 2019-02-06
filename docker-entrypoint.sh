#!/bin/bash
/app/installPackages
/app/config2vars > /app/config.env
chmod 755 /app/config.env
source /app/config.env
echo "Starting ezs..."
exec npx ezs $*
