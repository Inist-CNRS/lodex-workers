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
COPY generate-dotenv.js /app
COPY crontab.js /app
COPY gitsync /app
COPY install-packages.js /app
COPY public/ /app/public

CMD [ "npm", "start" ]
