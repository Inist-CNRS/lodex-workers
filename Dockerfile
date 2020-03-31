FROM node:12

RUN mkdir -p /app/public
WORKDIR /app
EXPOSE 31976

# see https://github.com/Inist-CNRS/ezmaster
RUN echo '{ \
  "httpPort": 31976, \
  "configPath": "/app/config.json", \
  "dataPath": "/app/public" \
}' > /etc/ezmaster.json

COPY package.json /app
RUN npm install --production && npm cache clean --force

COPY config.json /app
COPY config2vars /app
COPY crontab /app
COPY gitsync /app
COPY installPackages /app
COPY docker-entrypoint.sh /app
COPY public/ /app/public

ENTRYPOINT ["/app/docker-entrypoint.sh"]
