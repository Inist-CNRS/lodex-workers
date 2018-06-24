#!/bin/sh

/config2vars > /config.env
chmod 755 /config.env
source /config.env
exec ezs --daemon
