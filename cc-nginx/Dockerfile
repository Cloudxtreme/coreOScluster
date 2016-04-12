FROM fedora

MAINTAINER Kobe Housen

RUN	dnf update -y
RUN	dnf install -y nginx gpg
	
COPY    nginx.conf /etc/nginx/nginx.conf
CMD /usr/sbin/nginx -g "daemon off;"

RUN cd /usr/share/nginx/html                                                                        &&\
    wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz           &&\
    wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz.sig       &&\
    wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz     &&\
    wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz.sig &&\
    gpg --verify coreos_production_pxe.vmlinuz.sig                                                  &&\
    gpg --verify coreos_production_pxe_image.cpio.gz.sig

RUN dnf clean -y all

# This line is last because the scripts/build.sh script changes the file being coppied so this image will need to be rebuild everytime.
COPY pxe-cloud-config.yml /usr/share/nginx/html/pxe-cloud-config.yml
