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

EXPOSE 80

CMD ["/usr/bin/supervisord"]
