
ROOT		:= $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BUILDER		:= local/builder

REPOSITORY	:= docker.io/alectolytic/bird
VERSION		:= 1.5.0

.PHONY: all build clean

all: build

build:
	@docker build -t $(BUILDER) $(ROOT)
	@docker run \
		--privileged \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(shell which docker):$(shell which docker) \
		-it $(BUILDER)

push/$(VERSION):
	@docker tag -f $(REPOSITORY):latest $(REPOSITORY):$(VERSION)
	@docker push $(REPOSITORY):$(VERSION)

push/latest:
	@docker push $(REPOSITORY):latest

push: | push/latest push/$(VERSION)

clean:
	@docker rmi -f $(BUILDER)
