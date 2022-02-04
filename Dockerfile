# Build peerflix server
FROM node:17-alpine

RUN apk --no-cache add git 

WORKDIR /usr/local/bin

RUN npm install -g peerflix-server
RUN npm prune --production

VOLUME /root/.config/peerflix-server /mnt/torrents/torrent-stream
COPY config.json /root/.config/peerflix-server/config.json

CMD [ "peerflix-server" ]