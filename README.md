docker-registry
===============

Docker registry backed by S3, a redis cache and an nginx frontend with basic
auth enabled. This container must have an additional frontend for terminating
HTTPS with a trusted SSL certificate, or the clients will refuse to send the
auth info.

```
docker run -p 8080:8080 -e AUTH_USERNAME=<username> -e AUTH_PASSWORD=<password> -e AWS_BUCKET=<bucket> wrapp/registry:latest
```
