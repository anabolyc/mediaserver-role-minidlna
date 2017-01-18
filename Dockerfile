FROM armhf/ubuntu:xenial

# required packages
RUN apt-get update && apt-get install minidlna -y && rm -rf /var/lib/apt/lists/*

# Define the media volume
VOLUME /media

# Add the config file
ADD minidlna.conf /etc/minidlna.conf

# Expose the required ports:
# UDP 1900 for UPnP
# 8200 for the web interface
EXPOSE 1900/udp 8200

ENTRYPOINT ["/usr/sbin/minidlnad", "-d", "-f", "/etc/minidlna.conf"]
