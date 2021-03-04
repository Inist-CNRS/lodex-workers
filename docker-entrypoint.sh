#!/bin/sh
mkdir -p /sbin/.npm /sbin/.config
chown -R daemon:daemon /app /tmp /sbin/.npm /sbin/.config
PACKAGES=`node -e 'process.stdout.write(Array().concat(require("./config.json").packages).filter(Boolean).join(" ").trim())'`
[ -n "${PACKAGES}" ] && npm install --production  ${PACKAGES} &
exec su-exec daemon:daemon $*
