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
COPY package.json /app
COPY config.json /app
COPY config2vars /app
COPY docker-entrypoint.sh /app

RUN npm install ezs@6.0.0
RUN npm install ezs-basics@3.6.7
RUN npm install ezs-mapreduce@1.0.0
RUN npm install ezs-analytics@1.8.1
RUN npm install ezs-istex@5.0.0
RUN npm install ezs-lodex@1.0.0

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["--daemon"]
