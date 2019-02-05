FROM node:8.9.1

RUN mkdir -p /app/data
WORKDIR /app

# see https://github.com/Inist-CNRS/ezmaster
RUN echo '{ \
  "httpPort": 31976, \
  "configPath": "/config.json", \
  "dataPath": "/app/data" \
}' > /etc/ezmaster.json

EXPOSE 31976
COPY data/ /app/data
COPY package.json /app
COPY config.json /app
COPY config2vars /app
COPY installPackages /app
COPY docker-entrypoint.sh /app

RUN npm install ezs@7.1.1
RUN npm install npm-programmatic

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["--daemon", "/app/data"]
