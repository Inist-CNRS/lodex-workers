FROM node:8.11.3

RUN mkdir /app
WORKDIR /app

# see https://github.com/Inist-CNRS/ezmaster
RUN echo '{ \
  "httpPort": 31976, \
  "configPath": "/config.json" \
}' > /etc/ezmaster.json

EXPOSE 31976
COPY package.json /app
COPY config.json /app
COPY config2vars /app
COPY docker-entrypoint.sh /app

RUN npm install ezs@5.4.6
RUN npm install ezs-basics@3.6.2
RUN npm install ezs-mapreduce@1.0.0
RUN npm install ezs-analytics@1.0.1
RUN npm install ezs-istex@4.3.3
RUN npm install ezs-analytics@1.0.1
RUN npm install ezs-lodex@1.0.0

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["--daemon"]
