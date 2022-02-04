peerflix-server
===============

[![NPM Version][npm-image]][npm-url]
[![NPM Downloads][downloads-image]][downloads-url]
[![Docker Build Status](https://img.shields.io/github/workflow/status/romunro/peerflix-server/buildx-weekly)](https://github.com/romunro/peerflix-server) 
[![Docker Stars](https://img.shields.io/docker/stars/ronnieonthehub/peerflix-server.svg)](https://github.com/romunro/peerflix-server) 
[![Docker Pulls](https://img.shields.io/docker/pulls/ronnieonthehub/peerflix-server.svg)](https://github.com/romunro/peerflix-server)

<img src="https://cdn.jsdelivr.net/gh/asapach/peerflix-server@master/app/images/logo.svg" alt="logo" height="256">

Streaming torrent client for node.js with web ui.
Based on server application of peerflix [from asapach](https://github.com/asapach/peerflix-server). 
Since docker image was not being updated to latest version of peerflix, the docker image [from onisuly](https://github.com/onisuly/docker-peerflix-server) is used as a basis.

![screen capture](https://cdn.jsdelivr.net/gh/asapach/peerflix-server@master/capture.gif)

Based on [torrent-stream](https://github.com/mafintosh/torrent-stream), inspired by [peerflix](https://github.com/mafintosh/peerflix).

This Dockerfile build an image for [peerflix-server](https://github.com/asapach/peerflix-server) with password protection capability.

## Quick Start

```shell
docker run -d --name peerflix-server \
-p 9000:9000 \
-v /your/path/to/torrent-stream:/tmp/torrent-stream \
ronnieonthehub/peerflix-server
```

## Enable Password Protection

```shell
docker run -d --name peerflix-server \
-p 9000:9000 \
-e SECURE=true \
-e USERNAME=your_name \
-e PASSWORD=your_password \
-v /your/path/to/torrent-stream:/tmp/torrent-stream \
ronnieonthehub/peerflix-server
```

If you want to add multiple users, your can generate .htpasswd file [here](http://www.htaccesstools.com/htpasswd-generator/) and mount it to your container.

```shell
docker run -d --name peerflix-server \
-p 9000:9000 \
-v /your/path/to/.htpasswd:/etc/squid/users \
-v /your/path/to/torrent-stream:/tmp/torrent-stream \
ronnieonthehub/peerflix-server
```

---

Read [Peerflix Server Readme](https://github.com/asapach/peerflix-server/blob/master/README.md) for more information.

[npm-image]: https://img.shields.io/npm/v/peerflix-server?label=peerflix%20version
[npm-url]: https://npmjs.org/package/peerflix-server
[node-version-image]: https://img.shields.io/node/v/peerflix-server.svg?style=flat
[node-version-url]: http://nodejs.org/download/
[downloads-image]: https://img.shields.io/npm/dm/peerflix-server.svg?style=flat
[downloads-url]: https://npmjs.org/package/peerflix-server
