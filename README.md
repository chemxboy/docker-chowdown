[![Docker Image CI](https://github.com/tylerobara/docker-chowdown/actions/workflows/docker-publish.yml/badge.svg?branch=master)](https://github.com/tylerobara/docker-chowdown/actions/workflows/docker-publish.yml)
<img alt="Docker last pushed" src="https://img.shields.io/badge/dynamic/json?color=blue&label=Last%20pushed&query=last_updated&url=https%3A%2F%2Fhub.docker.com%2Fv2%2Frepositories%2Ftylerobara%2Fchowdown%2F&logo=docker&?link=http://left&link=https://hub.docker.com/repository/docker/tylerobara/chowown">
[![Docker Image Size](https://img.shields.io/docker/image-size/tylerobara/chowdown?logo=Docker)](https://hub.docker.com/r/jokobsk/pi.alert)
<img src="https://img.shields.io/docker/pulls/tylerobara/chowdown?logo=docker&color=0aa8d2&logoColor=fff" alt="Docker Pulls">


# docker-chowdown
lightweight alpine container for chowdown.io

*** Now with arm64 builds!

### Docker run command
```bash
docker run --name chowdown -d -p 4000:4000/tcp -v "/opt/appdata/chowdown:/config" --restart=unless-stopped tylerobara/chowdown:latest
```

### Docker compose example
```yaml
version: "3"
services:
  chowdown:
    container_name: chowdown
    image: tylerobara/chowdown:latest
    volumes:
      - /opt/appdata/chowdown:/config # Align permissions to desired user set in environment
    restart: unless-stopped
    environment:
     - PUID=65534 # set to PUID of config directory owner
     - PGID=65534 # set to PGID of config directory owner
    ports:
      - "4000:4000"
```

