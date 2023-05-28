# Keycloak in docker

## [how to start keycloak for development](https://www.redpill-linpro.com/techblog/2022/10/20/into_to_oidc_with_keycloak_and_vertx.html)
```sh
docker run -p 8989:8080 -dt -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:19.0.2 start-dev
```
## keycloak prod start
```sh
docker run --name keycloak -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin -p 8543:8443 -v "$(pwd)"/config/keycloak-keystore.jks:/etc/keycloak-keystore.jks quay.io/keycloak/keycloak:{keycloak.version} start  --hostname-strict=false --https-key-store-file=/etc/keycloak-keystore.jks

# for custom config settings file:
#  --config=/etc/keycloak-gatekeeper.conf
```

## settings for keycloak 
possible solution for keycloak-gatekeeper.conf
```yaml
discovery-url: https://keycloak-installation-url/auth/realms/project-root
skip-openid-provider-tls-verify: true
client-id: project-root-application-id
client-secret: default
listen: :3000
enable-refresh-tokens: false
redirection-url: https://url-of-your-app
secure-cookie: false
encryption-key: secret-key-from-your-admin-panel
upstream-url: http://127.0.0.1:8080/
cors-methods:
- GET
- POST
- OPTIONS
- HEAD
- DELETE
cors-headers:
- authorization
- content-type
resources:
- uri: /*
  groups:
  - role-1
  - role-2
```
