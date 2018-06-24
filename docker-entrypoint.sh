#!/bin/sh

/config2vars > /config.env
chmod 755 /config.env
source /config.env
env
exec ezs --daemon
