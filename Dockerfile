FROM ubuntu-16.04-32bit
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y -u ppa:webupd8team/java
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y libpangox-1.0-0 \
                       oracle-java8-installer \
                       oracle-java8-set-default \
                       firefox \
                       libpangoxft-1.0-0 \
                       libxft2 \
                       libxmu6 \
                       libxv1 \
                       fonts-takao-gothic \
                       fonts-takao-mincho \
                       fonts-takao-pgothic \
                       libasound2-plugins \
                       libcanberra-gtk3-0 \
                       libdbus-glib-1-2 \
                       libgtk2.0-0 \
                       libgtk-3-0 \
                       libpangoft2-1.0-0 \
                       libpangox-1.0-0 \
                       libpangoxft-1.0-0 \
                       libxft2 \
                       libxmu6 \
                       libxv1
RUN useradd -ms /bin/bash webex
USER webex
WORKDIR /home/webex
CMD /usr/bin/firefox
