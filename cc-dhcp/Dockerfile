FROM fedora

MAINTAINER Kobe Housen

RUN	dnf install -y dhcp	&&\
	dnf clean all
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
CMD /usr/sbin/dhcpd -f
