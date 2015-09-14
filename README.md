# Tweety BIRD

This project puts [BIRD](http://bird.network.cz/) in scratch docker container. It is available on [Docker Hub](https://registry.hub.docker.com/u/alectolytic/bird/) and can be pulled using the following command.

```sh
docker pull alectolytic/bird
```

You will note that this is a tiny image.
```
$ docker images | grep docker.io/alectolytic/bird
docker.io/alectolytic/bird    latest    2af5c2001ea8    10 minutes ago    3.676 MB
```

#### BIRD (with defaults)
```sh
docker run -d --name bird -p 179:179 \
  alectolytic/bird
```

#### BIRD with custom configuration
```sh
docker run -d --name bird -p 179:179 \
  -v /path/to/bird.conf:/etc/bird.conf \
  alectolytic/bird
```

If you would like to preserve the default configuration, and extend it. You may add your configuration files to the `/etc/bird.d` directory. This is also exposed as a volume so that it may be mounted in other docker containers.

**NOTE:** If running on an SELinux enabled system, run `chcon -Rt svirt_sandbox_file_t /path/to/bird.conf` before staring the container.

#### Starting and stopping
You can start or stop `bird` container using the following command.
```sh
# Starting
docker start bird

# stopping
docker stop bird
```

#### Using the BIRD client
This container comes with full bird client. If you've started a bird docker container instance as shown about with `--name bird`, you can connect to the bird instance with the client by executing the following command.

```sh
docker exec -it bird /usr/sbin/birdc
```

#### Debugging
If debugging your configuration you can, do the following to run an instance inn interactive session.

```sh
docker run --rm -it -p 179:179 \
  -v /path/to/bird.conf:/etc/bird.conf \
  alectolytic/bird
```
