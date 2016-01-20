## About

This is a Docker image for [SickBeard](http://sickbeard.com/) - the Internet PVR for your TV shows.

The Docker image currently supports:

* running SickBeard under its __own user__ (not `root`)
* changing of the __UID and GID__ for the SickBeard user
* __automatic update__ of SickBeard on container restart
* instant __switching between different SickBeard versions__
* support for OpenSSL / HTTPS encryption

## Run

### Run via Docker CLI client

To run the SickBeard container you can execute:

```bash
docker run --name sickbeard -v <datadir path>:/datadir -v <media path>:/media -p 8081:8081 sickbeard/sickbeard
```

Open a browser and point it to [http://my-docker-host:8081](http://my-docker-host:8081)

### Run via Docker Compose

You can also run the SickBeard container by using [Docker Compose](https://www.docker.com/docker-compose).

If you've cloned the [git repository](https://github.com/domibarton/docker-sickbeard) you can build and run the Docker container locally (without the Docker Hub):

```bash
docker-compose up -d
```

If you want to use the Docker Hub image within your existing Docker Compose file you can use the following YAML snippet:

```yaml
sickbeard:
    image: "sickbeard/sickbeard"
    container_name: "sickbeard"
    volumes:
        - "<datadir path>:/datadir"
        - "<media path>:/media"
    ports:
        - "8081:8081"
    restart: always
```

## Configuration

### Volumes

Please mount the following volumes inside your SickBeard container:

* `/datadir`: Holds all the SickBeard data files (e.g. config, postProcessing)
* `/media`: Directory for TV shows

### Configuration file

By default the SickBeard configuration is located on `/datadir/config.ini`.
If you want to change this you've to set the `CONFIG` environment variable, for example:

```
CONFIG=/datadir/sickbeard.ini
```

### SickBeard Version

By default the latest SickBeard version will be used. This is achieved by pointing at the `master` tree of the [SickBeard git repository](https://github.com/midgetspy/Sick-Beard/tree/master). If you want a different version you've set the `VERSION` environment variable to a valid git [branch](https://github.com/midgetspy/Sick-Beard/branches) or [tag](https://github.com/midgetspy/Sick-Beard/tags), for example:

```
VERSION=development
```

Please note that `VERSION=master` always points to the latest stable version, while `VERSION=development` points to the bleeding-edge version of SickBeard.

_SickBeard will automatically be updated and switched to your defined version when you restart your container._

### UID and GID

By default SickBeard runs with user ID and group ID `666`.
If you want to run SickBeard with different ID's you've to set the `UID` and/or `GID` environment variables, for example:

```
UID=1234
GID=1234
```