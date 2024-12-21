### cvmfs client per siti CERN e INFN

- per far patire il docker a mano:
- ```docker run -it -d --privileged=True --device /dev/fuse  --cap-add SYS_ADMIN --volume /cvmfs:/cvmfs:shared --restart=unless-stopped --log-driver local --log-opt max-size=100m --log-opt max-file=5 --name cvmfs-client gmazzitelli/cvmfs-client```
- e poi ```docker attach -it cvmfs```
- le publisher_keys servono solo per il publisher

