FROM node:10

RUN mkdir -p /app/data
WORKDIR /app

# see https://github.com/Inist-CNRS/ezmaster
RUN echo '{ \
  "httpPort": 31976, \
  "configPath": "/app/config.json", \
  "dataPath": "/app/data" \
}' > /etc/ezmaster.json

EXPOSE 31976
COPY data/ /app/data
COPY config.json /app
COPY config2vars /app
COPY crontab /app
COPY gitsync /app
COPY installPackages /app
COPY docker-entrypoint.sh /app

RUN npm init -y
RUN npm install ezs@9.3.0
RUN npm install npm-programmatic
RUN npm install shelljs
RUN npm install node-schedule

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["--daemon", "/app/data"]
