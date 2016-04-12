FROM fedora

MAINTAINER Kobe Housen

RUN dnf update -y
RUN dnf install -y tftp-server
RUN dnf clean all

CMD /usr/sbin/in.tftpd --foreground --verbose --secure /var/lib/tftpboot

COPY ipxe.efi /var/lib/tftpboot/
