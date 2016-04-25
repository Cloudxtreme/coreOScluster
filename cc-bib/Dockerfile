FROM fedora

MAINTAINER Kobe Housen

RUN dnf install -y git gcc binutils make perl zlib-devel binutils-devel

COPY bootScript.ipxe /

RUN	git clone git://git.ipxe.org/ipxe.git			&&\
	cd ipxe/src						&&\
	make bin-x86_64-efi/ipxe.efi EMBED=/bootScript.ipxe

CMD /bin/true
