.PHONY: build
build:
	docker build -t ysku/debug-api .

.PHONY: start
start:
	docker run --rm -it ysku/debug-api

.PHONY: push
push:
	docker push ysku/debug-api
