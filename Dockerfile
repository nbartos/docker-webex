FROM ubuntu:trusty
MAINTAINER Federico G. Schwindt <fgsch@lodoss.net>
ENV DEBIAN_FRONTEND noninteractive
RUN /bin/echo -e 'deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ trusty main restricted universe multiverse\ndeb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ trusty-updates main restricted universe multiverse\ndeb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse' > /etc/apt/sources.list
RUN dpkg --add-architecture i386 
RUN apt-get update
RUN apt-get install -y firefox:i386 icedtea-7-plugin:i386 \
    openjdk-7-jre:i386 libpangox-1.0-0:i386 libpangoxft-1.0-0:i386 \
    libxft2:i386 libxmu6:i386 libxv1:i386 fonts-takao
RUN useradd -ms /bin/bash webex
USER webex
WORKDIR /home/webex
CMD /usr/bin/firefox
