# Base dockerized ApiPlatform with Traefik and Nuxt

## Installation

### Install Project
- Edit environment `PROJECT_NAME` variables in `./.env` && `./Makefile`
- Edit `DATABASE_URL` variable in `./api/.env` & db variable in `./.env`
- Create certs for tls
- Run `make network`
- Run `make install`

## Create Certs
- Install [mkcert](https://github.com/FiloSottile/mkcert)
- Run: `make certs`

## Routes: 

| Service           | web router                              | web-secure router                         |
|-------------------|-----------------------------------------|-------------------------------------------|
| Traefik Dashboard | [http](http://localhost:8080/dashboard/)| [https](https://localhost:8080/dashboard/)|
| API               | [http](http://api.localhost)            | [https](https://api.localhost)            |
| Nuxt              | [http](http://localhost)         | [https](https://localhost)         |
| Adminer           | [http](http://adminer.localhost/)       | [https](https://adminer.localhost/)       |
