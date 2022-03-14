
build: Dockerfile
	docker build -t samfirm .

run:
	docker run --rm -it -v $(shell pwd)/images:/root/images samfirm /bin/bash

setup:
	git clone git@github.com:jesec/samfirm.js.git
	mkdir images
