FROM ubuntu:18.04

# Environment variables
ENV PORT_STEAM 7778
ENV PORT_SERVER 27015

# Expose Steam ports
EXPOSE ${PORT_STEAM} 32330 ${PORT_SERVER}
EXPOSE ${PORT_STEAM}/udp ${PORT_SERVER}/udp
EXPOSE 7777

# Volume
VOLUME [ "/usr/games/ark" ]

# Adjusting System limits (because ARK is a bitch and needs at least 16TB+ RAM and 1 billion opend files at all times)
RUN echo "fs.file-max=100000" >> /etc/sysctl.conf && sysctl -p
RUN echo "* soft nofile 1000000" >> /etc/security/limits.conf
RUN echo "* hard nofile 1000000" >> /etc/security/limits.conf
RUN echo "session required pam_limits.so" >> /etc/pam.d/root # TODO: Check if this is correctly set

# Required 32-bit arch for steamcmd installation
RUN dpkg --add-architecture i386

# Update apt-get incl. repos
RUN apt-get -y update
RUN apt-get -y upgrade

# Install screen and Steamcmd
RUN apt-get install -y screen

# Fixing SSL error during installation and runtime
RUN apt-get install --reinstall -y ca-certificates
# Install steamcmd
RUN echo "I AGREE" | apt-get install -y steamcmd

# Update Steam
RUN /usr/games/steamcmd +quit

# Copy start script into image
COPY start.sh /usr/games/

# Run the start script
CMD [ "/bin/bash", "/usr/games/start.sh" ]
