FROM fedora
RUN dnf update -y
RUN dnf install -y dhcp
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
CMD /usr/sbin/dhcpd -f
