FROM fedora

MAINTAINER Kobe Housen

RUN	dnf update -y
RUN	dnf install -y nginx	&&\
	dnf clean all
COPY pxe-cloud-config.yml /usr/share/nginx/html/pxe-cloud-config.yml
COPY nginx.conf /etc/nginx/nginx.conf
CMD /usr/sbin/nginx -g "daemon off;"
