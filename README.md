# aws-ecs-elasticsearch
A Dockerized [ElasticSearch](https://github.com/dockerfile/elasticsearch) cluster orchestrated via Amazon Web Services [CloudFormation](http://www.cloudsarelies.com.s3-website-eu-west-1.amazonaws.com/).

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

## Configuring A Container
For [configuring ecs](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html) to  output debug information, put
```
  ECS_LOGLEVEL=debug
```
in the ```/etc/ecs/ecs.config``` file, and restart the service (ecs-agent Docker containter).

