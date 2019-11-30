# Base dockerized ApiPlatform 2.5.3 with Traefik and Nuxt

### Install Project
- Edit environment `PROJECT_NAME` variables in `./.env` && `./Makefile`
- Edit `DATABASE_URL` variable in `./api/.env` & db variable in `./.env`
- Run `make network`
- Run `make install`

## Routes: 

| Service           | web router                              | web-secure router                         |
|-------------------|-----------------------------------------|-------------------------------------------|
| Traefik Dashboard | [http](127.0.0.1:8080)                  |                                           |
| API               | [http](http://api.localhost)            | [https](https://api.localhost)            |
| Nuxt              | [http](http://localhost)                | [https](https://localhost)                |
| Test Request      | [http](http://localhost/requests)       | [https](https://localhost/requests)       |
| Adminer           | [http](http://adminer.localhost/)       | [https](https://adminer.localhost/)       |
