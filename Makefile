BEATNAME=cloudtrailbeat
BEAT_DIR=github.com/taxibeat/cloudtrailbeat
ES_BEATS=./vendor/github.com/elastic/beats
GOPACKAGES=$(shell glide novendor)
SYSTEM_TESTS=false

# Only crosscompile for linux because other OS'es use cgo.
#GOX_OS=linux darwin windows solaris freebsd netbsd openbsd
GOX_OS=linux

include $(ES_BEATS)/libbeat/scripts/Makefile

.PHONY: dockerize-builder
dockerize-builder: 
	docker build . -f Dockerfile.builder -t go_alpine_builder
	glide install
	docker run --rm -v ~/go/:/go -w /go/src/github.com/taxibeat/cloudtrailbeat go_alpine_builder bash -c 'glide install && make'

.PHONY: dockerize-runner
dockerize-runner: cloudtrailbeat
	docker build . -f Dockerfile.runner -t cloudtrailbeat

cloudtrailbeat: dockerize-builder

.PHONY: dockerize
dockerize: dockerize-runner
	docker images | grep cloudtrailbeat