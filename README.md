## What?
Basic environment: jupyter & jupyter lab

## Build
```
docker run -dt -p 8888-8889:8888-8889 -v /opt/host_dir/:/opt/notebooks --name jupyter lmurawsk/docker_jupyter:latest
```

## Use
* Notebook - [localhost:8888](http://localhost:8888)
* Lab - [localhost:8889](http://localhost:8889)

