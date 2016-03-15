FROM fedora
RUN dnf update -y
RUN dnf install -y tftp-server syslinux wget

RUN	cd /var/lib/tftpboot	&&\
	mkdir pxelinux.cfg	&&\
	wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz	&&\
	wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz	&&\
	cp /usr/share/syslinux/pxelinux.0 pxelinux.0	&&\
	cp /usr/share/syslinux/ldlinux.c32 ldlinux.c32	&&\
	dnf remove -y wget syslinux
	
COPY default /var/lib/tftpboot/pxelinux.cfg/default
CMD /usr/sbin/in.tftpd --foreground --verbose --secure /var/lib/tftpboot
