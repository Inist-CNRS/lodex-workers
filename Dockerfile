FROM node:12

RUN mkdir -p /app/www
WORKDIR /app
EXPOSE 31976

# see https://github.com/Inist-CNRS/ezmaster
RUN echo '{ \
  "httpPort": 31976, \
  "configPath": "/app/config.json", \
  "dataPath": "/app/www" \
}' > /etc/ezmaster.json

RUN npm init -y
RUN npm install @ezs/core@1.1.7
RUN npm install npm-programmatic
RUN npm install shelljs
RUN npm install node-schedule

COPY config.json /app
COPY config2vars /app
COPY crontab /app
COPY gitsync /app
COPY installPackages /app
COPY docker-entrypoint.sh /app
COPY www/ /app/www

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["--daemon", "/app/www"]
