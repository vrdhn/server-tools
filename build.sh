#!/usr/bin/env bash

set -e


CADDY=2.9.0-beta.3
SUPERVISORD=0.7.3

BIN=server-tools/usr/bin

download-tools()
{
    echo "Downloading caddy"
    (
	wget https://github.com/caddyserver/caddy/releases/download/v${CADDY}/caddy_${CADDY}_linux_amd64.tar.gz
	tar xf caddy_${CADDY}_linux_amd64.tar.gz
	rm caddy_${CADDY}_linux_amd64.tar.gz README.md LICENSE
	mv caddy ${BIN}
    )
    echo "Downloading supervisord"
    (
	wget https://github.com/ochinchina/supervisord/releases/download/v${SUPERVISORD}/supervisord_${SUPERVISORD}_Linux_64-bit.tar.gz
	tar xf supervisord_${SUPERVISORD}_Linux_64-bit.tar.gz
	mv supervisord_${SUPERVISORD}_Linux_64-bit/supervisord ${BIN}
	rm supervisord_${SUPERVISORD}_Linux_64-bit.tar.gz
	rm -fr supervisord_${SUPERVISORD}_Linux_64-bit
    )
}


mkdir -p ${BIN}
download-tools
