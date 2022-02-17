FROM nginx:1.15.8

RUN rm /var/log/nginx/*
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/
COPY www.conf.template /etc/nginx/conf.d/www.conf.template

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
