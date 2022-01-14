FROM ubuntu:20.04

USER root

ENV GRIPSS_VER="v2.0"

RUN apt-get -yq update
ENV DEBIAN_FRONTEND "noninteractive"
RUN apt-get install -yq --no-install-recommends locales \
openjdk-11-jre-headless \
wget \
unattended-upgrades && \
unattended-upgrade -d -v && \
apt-get remove -yq unattended-upgrades && \
apt-get autoremove -yq

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

ENV OPT /opt/wtsi-cgp
ENV PERL5LIB $OPT/lib/perl5
ENV JAVA $OPT/java
ENV LD_LIBRARY_PATH $OPT/lib
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN mkdir -p ${JAVA}

RUN wget -O ${JAVA}/gripss.jar https://github.com/hartwigmedical/hmftools/releases/download/gripss-${GRIPSS_VER}/gripss_${GRIPSS_VER}.jar
ENV CLASSPATH ${JAVA}/gripss.jar

## USER CONFIGURATION
RUN adduser --disabled-password --gecos '' ubuntu && chsh -s /bin/bash && mkdir -p /home/ubuntu

USER    ubuntu
WORKDIR /home/ubuntu

CMD ["/bin/bash"]

