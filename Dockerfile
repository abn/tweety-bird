FROM cloudrouter/base-fedora:latest
MAINTAINER Arun Neelicattu <arun.neelicattu@gmail.com>

RUN dnf -y upgrade

ENV BUILDROOT /buildroot

ADD loadbins /usr/bin/loadbins

RUN dnf -y install bird

RUN mkdir -p ${BUILDROOT}

WORKDIR ${BUILDROOT}

RUN DEST=rootfs loadbins /usr/sbin/bird
RUN cp /etc/bird.conf ./rootfs/bird.conf
RUN mkdir -p ./rootfs/var/{log,run}

COPY Dockerfile.final ./Dockerfile

CMD docker build -t alectolytic/bird ${BUILDROOT}
