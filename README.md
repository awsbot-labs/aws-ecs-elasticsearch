# aws-ecs-elasticsearch
A Dockerized [ElasticSearch](https://github.com/dockerfile/elasticsearch) cluster orchestrated via Amazon Web Services CloudFormation.

## Make
To make the Docker container, run:
```
  make
```

## Run
To run the CloudFormation template simply execute the bash wrapper:
```
  ./run create|update default example.com
```

## Configuring a container
For [configuring ecs](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html) to  output debug information, put
```
  ECS_LOGLEVEL=debug
```
in the ```/etc/ecs/ecs.config``` file, and restart the service.

