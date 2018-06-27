#!/bin/bash
/app/config2vars > /app/config.env
chmod 755 /app/config.env
source /app/config.env
exec npx ezs $*
