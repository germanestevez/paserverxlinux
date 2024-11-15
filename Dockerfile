FROM ubuntu

#Install needed packages for RadStudio and some utils
RUN \
	apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y dist-upgrade && \
	apt-get -y install joe wget p7zip-full curl unzip build-essential zlib1g-dev libcurl4-gnutls-dev && \
	apt-get -y install mysecureshell && \
	apt-get -y autoremove && \
	apt-get -y autoclean


# Copy PAServer into container and unzip it
COPY LinuxPAServer23.0.tar.gz /root/LinuxPAServer23.0.tar.gz
RUN \
  cd /root && \
  tar xzvf LinuxPAServer23.0.tar.gz && \
  cd PAServer-23.0 && \
  mkdir scratch-dir


WORKDIR /root/PAServer-23.0

# Run PAServer
CMD ["/root/PAServer-23.0/paserver","-password=1234"]

# PAServer default port
EXPOSE 64211
