##############################
# makefile
##############################

# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
STATIC=-ldflags '-extldflags "-static"'

## wire di 文件
WIRE_SOURCE=internal/gobase/server

SOURCE=cmd/main.go

BINARY_NAME=mqttSrv
BINARY_UNIX=$(BINARY_NAME)

.PHONY: env clean

all: service

env:
	export GO111MODULE=on GOPROXY=https://goproxy.cn,direct

env:
	export GO111MODULE=on GOPROXY=https://goproxy.cn,direct

service: env
	$(GOBUILD) $(STATIC) -o $(BINARY_NAME) -v $(SOURCE)

service-static:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) $(STATIC) -o $(BINARY_NAME) -v $(SOURCE)

clean:
	rm -f $(BINARY_NAME)