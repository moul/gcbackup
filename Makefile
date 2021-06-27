GOPKG ?=	moul.io/rrgc
DOCKER_IMAGE ?=	moul/rrgc
GOBINS ?=	.
NPM_PACKAGES ?=	.

include rules.mk

generate: install
	GO111MODULE=off go get github.com/campoy/embedmd
	mkdir -p .tmp
	echo 'foo@bar:~$$ rrgc hello world' > .tmp/usage.txt
	rrgc hello world 2>&1 >> .tmp/usage.txt
	embedmd -w README.md
	rm -rf .tmp
.PHONY: generate