FROM fedora

MAINTAINER Kobe Housen

RUN dnf update -y
RUN dnf install -y tftp-server

CMD /usr/sbin/in.tftpd --foreground --verbose --secure /var/lib/tftpboot


#import coreOS image signing key
RUN curl -O https://coreos.com/security/image-signing-key/CoreOS_Image_Signing_Key.asc &&\
    gpg --import --keyid-format LONG CoreOS_Image_Signing_Key.asc

#download and verify coreOS
RUN cd /usr/share/nginx/html                                                                           &&\
    curl -O http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz           &&\
    curl -O http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz     &&\
    curl -O http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz.sig       &&\
    curl -O http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz.sig &&\
    gpg --verify --yes coreos_production_pxe.vmlinuz.sig                                               &&\
    gpg --verify --yes coreos_production_pxe_image.cpio.gz.sig                                         &&\
    rm coreos_production_pxe.vmlinuz.sig                                                               &&\
    rm coreos_production_pxe_image.cpio.gz.sig

RUN dnf remove -y gpg curl
RUN dnf clean all


COPY ipxe.efi /var/lib/tftpboot/
