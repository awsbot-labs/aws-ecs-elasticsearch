NAME = dcrbsltd/elasticsearch
VERSION = $(shell cat VERSION)
KEY_NAME = elasticsearch
DOMAIN_NAME = awsbot.com
DATE = $(shell date)
.PHONY: all docker build clean test tag_latest release run install

all: build

docker: build tag_latest push

build:
	docker build -f Dockerfile -t $(NAME):$(VERSION) .

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest

push:
	docker push $(NAME):$(VERSION)

cloudformation:
	aws cloudformation create-stack \
		elasticsearch-$(DOMAIN_NAME) \
		

release:
	@echo "Enter commit message:"
	@read REPLY; \
	echo "${DATE} - $$REPLY" >> CHANGELOG; \
	git add --all; \
	git commit -m "$$REPLY"; \
	git push
