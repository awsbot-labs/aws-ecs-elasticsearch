.PHONY: build
newtag ?= 1.7.1
image = dcrbsltd/elasticsearch

build:
	docker build -t "${image}:1.7.1" .
	docker tag -f "${image}:1.7.1" "${image}:${newtag}"