FROM node:8.11.1-alpine

RUN npm install -g ezs@5.4.5 && \
    npm install -g ezs-basics@3.6.2 && \
    npm install -g ezs-analytics@1.0.1 \
    npm install -g ezs-lodex@1.0.0 

# see https://github.com/Inist-CNRS/ezmaster
RUN echo '{ \
  "httpPort": 31976, \
  "configPath": "/config.json" \
}' > /etc/ezmaster.json

EXPOSE 31976 
WORKDIR /
COPY config.json /
COPY config2vars /
COPY docker-entrypoint.sh /
CMD [ "/docker-entrypoint.sh" ]
