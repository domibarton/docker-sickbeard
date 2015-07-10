## Build

```bash
git clone https://github.com/confirm-it-solutions/docker-sickbeard.git
cd docker-sickbeard
docker build -t <tag> .
```

## Run

```bash
docker run --name sickbeard -v <datadir path>:/datadir -v <media path>:/media confirm/sickbeard
```
