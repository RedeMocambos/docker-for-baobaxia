Bootstrap of a docker ecosystem with clone of baobaxia project for tests
=======================================================================================

# Intro

This is a docker ecosystem with two nodes to test baobaxia project.

The ecosystem includes :
* Ubuntu 14.04 LTS (docker image: phusion/baseimage)
* Debian jessie/8.3 (docker image: debian)

More info:
* Baobaxia project: [https://github.com/RedeMocambos/baobaxia](https://github.com/RedeMocambos/baobaxia)
* phusion baseimage: [https://github.com/phusion/baseimage-docker](https://github.com/phusion/baseimage-docker)

# Requirements

* Docker version >= 1.10.1
* Docker Compose version >= 1.6.0

Reference:
* [https://www.docker.com/](https://www.docker.com/)
* [https://docs.docker.com/compose/](https://docs.docker.com/compose/)

# Start containers

```
cd REPO_DIR
```

To build docker image:

```
docker-compose build
```

To run docker containers :

```
docker-compose up -d
```

To enter in container node1:

```
docker exec -it baobaxia_node1 /bin/bash
```
or node2:

```
docker exec -it baobaxia_node2 /bin/bash
```

To install baobaxia in a node (it takes several minutes depending on the connection):

```
node1> cd /root/baobaxia && ./install.sh
```

**NOTICE:** you must generate ssh key for user "exu" in node1 and node2, then copy
public key in /home/exu/.ssh/authorized_keys in other node.
