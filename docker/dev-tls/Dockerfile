# use this self-generated certificate only in dev, IT IS NOT SECURE!


# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG NGINX_VERSION=1.17


FROM nginx:${NGINX_VERSION}-alpine

# persistent / runtime deps
RUN apk add --no-cache \
		nss-tools \
	;

WORKDIR /certs

ARG MKCERT_VERSION=1.4.1
RUN set -eux; \
	wget -O /usr/local/bin/mkcert https://github.com/FiloSottile/mkcert/releases/download/v$MKCERT_VERSION/mkcert-v$MKCERT_VERSION-linux-amd64; \
	chmod +x /usr/local/bin/mkcert; \
	mkcert --cert-file local-cert.pem --key-file local-key.pem api.localhost adminer.localhost admin.localhost localhost;

VOLUME /certs

