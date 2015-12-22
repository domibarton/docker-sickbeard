## About

This is a Docker image for [SickBeard](http://sickbeard.com/) - the Internet PVR for your TV shows.

## Configuration

### Volumes

Mount the following volumes inside your container:

* `<datadir path>:/datadir`
* `<media path>:/media`

### Configuration file

By default the SickBeard configuration is located on:

```
/datadir/config.ini
```

If you want to change this, set the `CONFIG` environment variable.

### SickBeard Version

By default the latest SickBeard version will be used by pointing at the `master` tree of the [SickBeard git repository](https://github.com/midgetspy/Sick-Beard).
If you want a different version you've set the `VERSION` environment variable to a valid git branch or tag.

_Please note that SickBeard will automatically be updated when you restart your container._

## Run

### Run via docker CLI

```bash
docker run --name sickbeard -v <datadir path>:/datadir -v <media path>:/media dbarton/sickbeard
```

### Run via docker-compose

```yaml
sickbeard:
    image: "dbarton/sickbeard"
    container_name: "sickbeard"
    volumes:
        - "<datadir path>:/datadir"
        - "<media path>:/media"
    tty: true
    stdin_open: true
    restart: always
```

