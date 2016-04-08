FROM fedora

MAINTAINER Kobe Housen

RUN dnf update -y
RUN dnf install -y tftp-server wget git gcc binutils make perl zlib-devel binutils-devel

COPY bootFromOfficialSite.ipxe /

RUN	git clone git://git.ipxe.org/ipxe.git								&&\
	cd ipxe/src											&&\
	make bin-x86_64-efi/ipxe.efi EMBED=/bootFromOfficialSite.ipxe					&&\
	cp bin-x86_64-efi/ipxe.efi /var/lib/tftpboot/							&&\
#	wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz		&&\
#	wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz	&&\
	dnf remove -y wget git gcc binutils make perl zlib-devel binutils-devel				&&\
	dnf clean all

CMD /usr/sbin/in.tftpd --foreground --verbose --secure /var/lib/tftpboot
