.venv: requirements-frozen.txt
	virtualenv .venv
	./.venv/bin/pip install -r requirements-frozen.txt

.PHONY: refreeze
refreeze:
	rm requirements-frozen.txt
	make requirements-frozen.txt


requirements-frozen.txt:
	virtualenv ./.venv-req
	./.venv-req/bin/pip install -r requirements.txt
	./.venv-req/bin/pip freeze > requirements-frozen.txt
	rm -rf ./.venv-req
	git add requirements-frozen.txt
	git add requirements.txt
	git commit -m "Update requirements"

.PHONY: build
build: requirements-frozen.txt
	docker-compose build

.PHONY: run
run:
	docker-compose -f docker-compose.yml up

.PHONY: enter
enter:
	 docker-compose -f docker-compose.yml run --rm estimator /bin/bash

.PHONY: clean
clean:
	rm -rf jira-backlog-estimator/cov_html
	rm -rf jira-backlog-estimator/.cache
	rm -rf jira-backlog-estimator/__pycache__
	rm -rf jira-backlog-estimator/.coverage
	rm -rf jira-backlog-estimator/tests/__pycache__

.PHONY: clean-docker
clean-docker:
	docker-compose rm