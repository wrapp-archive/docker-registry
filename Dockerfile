FROM registry:latest

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get -y install supervisor nginx apache2-utils

# Supervisor
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf

# Nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD run-nginx /usr/local/bin/run-nginx
RUN chmod 755 /usr/local/bin/run-nginx

ENV SETTINGS_FLAVOR prod
ENV WORKER_SECRET_KEY fsekfhefsefefe
ENV CACHE_LRU_REDIS_HOST docker-hub-001.4smnlw.0001.euw1.cache.amazonaws.com
ENV CACHE_LRU_REDIS_PORT 6379
#ENV CACHE_LRU_REDIS_PASSWORD fisk
ENV CACHE_REDIS_HOST docker-hub-001.4smnlw.0001.euw1.cache.amazonaws.com
ENV CACHE_REDIS_PORT 6379
#ENV CACHE_REDIS_PASSWORD fisk

EXPOSE 80

CMD ["/usr/bin/supervisord"]
