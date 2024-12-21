FROM ubuntu:22.04
USER root
WORKDIR /home/root
RUN apt update -y && apt install -y \
    wget
RUN wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest_all.deb
RUN dpkg -i cvmfs-release-latest_all.deb
RUN rm -f cvmfs-release-latest_all.deb

RUN apt update -y && apt install -y \     
    cvmfs \
    cvmfs-server \
    cvmfs-config-default

RUN echo "user_allow_other" >> /etc/fuse.conf \
    && echo -e "\nCVMFS_HTTP_PROXY=DIRECT\n" >> /etc/cvmfs/default.conf

COPY ./contents/common.infn.it.pub /etc/cvmfs/keys/infn.it/common.infn.it.pub
COPY ./contents/default.local /etc/cvmfs/default.local
COPY ./contents/infn.it.conf /etc/cvmfs/domain.d/infn.it.conf

COPY ./contents/startup.sh /opt/startup.sh

ENTRYPOINT ["/opt/startup.sh"]
