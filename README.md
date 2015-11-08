## Build

```bash
git clone https://github.com/dbarton/docker-sickbeard.git
cd docker-sickbeard
docker build -t <tag> .
```

## Run

```bash
docker run --name sickbeard -v <datadir path>:/datadir -v <media path>:/media dbarton/sickbeard
```
