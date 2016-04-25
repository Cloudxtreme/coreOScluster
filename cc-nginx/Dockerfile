FROM fedora

MAINTAINER Kobe Housen

RUN	dnf install -y nginx gpg curl



#import coreOS image signing key
RUN curl -O https://coreos.com/security/image-signing-key/CoreOS_Image_Signing_Key.asc &&\
    gpg --import --keyid-format LONG CoreOS_Image_Signing_Key.asc

#download and verify coreOS
#RUN cd /usr/share/nginx/html                                                                           &&\
#    curl -O http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz            &\
#    curl -O http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz      &\
#    curl -O http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz.sig        &\
#    curl -O http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz.sig  &\
#    wait                                                                                               &&\
#    gpg --verify --yes coreos_production_pxe.vmlinuz.sig                                               &&\
#    gpg --verify --yes coreos_production_pxe_image.cpio.gz.sig                                         &&\
#    rm coreos_production_pxe.vmlinuz.sig                                                               &&\
#    rm coreos_production_pxe_image.cpio.gz.sig

RUN dnf remove -y gpg curl



COPY nginx.conf /etc/nginx/nginx.conf
CMD  /usr/sbin/nginx -g "daemon off;"
#check nginx config file
RUN /usr/sbin/nginx -t



# This line is last because the scripts/build.sh script changes the file being coppied so this image will need to be rebuild everytime.
COPY pxe-cloud-config.yml /usr/share/nginx/html/pxe-cloud-config.yml
