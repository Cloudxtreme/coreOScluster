FROM fedora
RUN dnf update -y
RUN dnf install -y nginx
COPY pxe-cloud-config.yml /usr/share/nginx/html/pxe-cloud-config.yml
COPY nginx.conf /etc/nginx/nginx.conf
CMD /usr/sbin/nginx -g "daemon off;"
