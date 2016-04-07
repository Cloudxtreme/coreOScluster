FROM fedora

MAINTAINER Kobe Housen

RUN dnf update -y
RUN dnf install -y tftp-server wget

RUN	cd /var/lib/tftpboot										&&\
	wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz		&&\
	wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz	&&\
	dnf remove -y wget

CMD /usr/sbin/in.tftpd --foreground --verbose --secure /var/lib/tftpboot
#This line in last because the grub2.efi file is generated each time you run the supplied build script.
COPY grub2.efi /var/lib/tftpboot/
