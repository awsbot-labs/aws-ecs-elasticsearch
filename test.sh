#!/bin/bash
set -e

function abort()
{
	echo "$@"
	exit 1
}

function cleanup()
{
	echo " --> Stopping container"
	docker stop $ID >/dev/null
	docker rm $ID >/dev/null
}

PWD=`pwd`

echo " --> Starting container"
ID=`docker run -d -p 9200:9200 $NAME:$VERSION`
sleep 1

echo " --> Verifying container"
docker ps -q | grep ^${ID:0:12} > /dev/null
if [ $? -ne 0 ]; then
	abort "Unable to verify container IP"
else
  echo " --> Container verifyied"
fi

trap cleanup EXIT

echo " --> Running tests"

echo " --> Checking Elasticsearch process"
docker exec -it $ID ps -ef | grep java > /dev/null
if [ $? -ne 0 ]; then
	abort "No Elasticsearch Process running"
else
  echo " --> Elasticsearch is running"
fi

echo " --> Checking HTTP port 9200, please wait"
sleep 30
curl -s http://$(docker-machine ip default):9200 > /dev/null

if [ $? -ne 0 ]; then
	abort "Elasticsearch is not open on 9200"
else
  echo " --> Connected on port 9200"
fi



