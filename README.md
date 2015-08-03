# Tweety BIRD

This project puts [BIRD](http://bird.network.cz/) in scratch docker container. It is available on [Docker Hub](https://registry.hub.docker.com/u/alectolytic/bird/) and can be pulled using the following command.

```sh
docker pull alectolytic/bird
```

You will note that this is a tiny image.
```
$ docker images | grep docker.io/alectolytic/bird
docker.io/alectolytic/bird    latest    054ff3ccdef4    12 minutes ago    2.957 MB
```

#### BIRD (with defaults)
```sh
docker run -d --name bird -p 179:179 \
  alectolytic/bird
```

#### BIRD with custom configuration
```sh
docker run -d --name bird -p 179:179 \
  -v /path/to/bird.conf:/bird.conf \
  alectolytic/bird
```

**NOTE:** If running on an SELinux enabled system, run `chcon -Rt svirt_sandbox_file_t /path/to/bird.conf` before staring the container.

#### Starting and stopping
You can start or stop `bird` container using the following command.
```sh
# Starting
docker start bird

# stopping
docker stop bird
```

#### Debugging
If debugging your configuration you can, do the following to run an instance inn interactive session.

```sh
docker run --rm -it -p 179:179 \
  -v /path/to/bird.conf:/bird.conf \
  alectolytic/bird
```
