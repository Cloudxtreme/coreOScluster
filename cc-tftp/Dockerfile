FROM fedora

MAINTAINER Kobe Housen

RUN dnf install -y tftp-server

CMD /usr/sbin/in.tftpd --foreground --verbose --secure /var/lib/tftpboot


#this gives unknown errors needs investigation
RUN dnf clean all


COPY ipxe.efi /var/lib/tftpboot/
