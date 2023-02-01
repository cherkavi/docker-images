# Keycloak in docker
## [how to start keycloak for development](https://www.redpill-linpro.com/techblog/2022/10/20/into_to_oidc_with_keycloak_and_vertx.html)
```sh
docker run -p 8989:8080 -dt -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:19.0.2 start-dev
```
## keycloak prod start
```sh
docker run --name keycloak -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin -p 8543:8443 -v "$(pwd)"/config/keycloak-keystore.jks:/etc/keycloak-keystore.jks quay.io/keycloak/keycloak:{keycloak.version} start  --hostname-strict=false --https-key-store-file=/etc/keycloak-keystore.jks
```
