.PHONY: build
newtag ?= latest
image = dcrbsltd/elasticsearch

build:
	docker build -t "${image}:latest" .
	docker tag -f "${image}:latest" "${image}:${newtag}"