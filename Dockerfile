FROM node:12-alpine AS build
RUN apk add --no-cache make gcc g++ python
RUN mkdir -p /app/public
COPY package.json /app
WORKDIR /app
RUN npm install --production && npm cache clean --force

FROM node:12-alpine AS release
RUN apk add --no-cache git su-exec
COPY --from=build /app /app
# see https://github.com/Inist-CNRS/ezmaster
RUN echo '{ \
  "httpPort": 31976, \
  "configPath": "/app/config.json", \
  "dataPath": "/app/public" \
}' > /etc/ezmaster.json
WORKDIR /app
COPY config.json crontab.js generate-dotenv.js gitsync gitsyncdir docker-entrypoint.sh public /app/
# To be compilant with Debian/Ubuntu container (and so with ezmaster-webdav)
RUN sed -i -e "s/daemon:x:2:2/daemon:x:1:1/" /etc/passwd && \
    sed -i -e "s/daemon:x:2:/daemon:x:1:/" /etc/group && \
    sed -i -e "s/bin:x:1:1/bin:x:2:2/" /etc/passwd && \
    sed -i -e "s/bin:x:1:/bin:x:2:/" /etc/group 
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
CMD [ "npm", "start" ]
