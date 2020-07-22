.PHONY: build
build:
	docker-compose build

.PHONY: run
run:
	docker-compose -f docker-compose.yml up

.PHONY: enter
enter:
	 docker-compose -f docker-compose.yml run --rm dev /bin/bash

.PHONY: clean-docker
clean-docker:
	docker-compose rm