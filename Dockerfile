# Build peerflix server
FROM node:17-alpine

RUN apk --no-cache add git 

WORKDIR /usr/local/bin

#ENV PORT = 9000

RUN npm install -g peerflix-server
RUN npm prune --production

VOLUME /root/.config/peerflix-server /mnt/torrents/torrent-stream
COPY config.json $PEERFLIX_CONFIG_PATH/config.json

CMD [ "peerflix-server" ]
# RUN bower --allow-root install
# RUN grunt build
###Comment from here
# RUN npm prune --production

# RUN mkdir release && \
#     cp -r /app/node_modules release/node_modules && \
#     cp -r /app/dist release/dist && \
#     cp -r /app/server release/server && \
#     cp -r package.json release/

# # Create final image
# FROM node:14-alpine
# ENV PEERFLIX_CONFIG_PATH /app/config

# RUN apk --no-cache add ffmpeg

# WORKDIR /app
# COPY --from=build /app/release ./

# VOLUME /tmp/torrent-stream /app/config

# USER node

# ARG RUN_DEP="squid openrc apache2-utils"

# USER root

# RUN apk add --no-cache $RUN_DEP

# COPY squid_auth.conf /etc/squid/squid_auth.conf
# COPY squid_basic.conf /etc/squid/squid_basic.conf

# COPY startup.sh /script/startup.sh

# RUN chmod +x /script/startup.sh

# EXPOSE 9000

# CMD ["/script/startup.sh"]
