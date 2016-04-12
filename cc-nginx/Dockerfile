FROM fedora

MAINTAINER Kobe Housen

RUN	dnf update -y
RUN	dnf install -y nginx	&&\
	dnf clean all
COPY nginx.conf /etc/nginx/nginx.conf
CMD /usr/sbin/nginx -g "daemon off;"
# This line is last because the scripts/build.sh script changes the file being coppied so this image will need to be rebuild everytime.
COPY pxe-cloud-config.yml /usr/share/nginx/html/pxe-cloud-config.yml
