.PHONY: fmt
fmt:
	poetry run isort -rc --sl .
	poetry run autoflake --remove-all-unused-imports --ignore-init-module-imports --remove-unused-variable --exclude=.venv -r -i .
	poetry run black .
	poetry run isort -rc -m 3 .


.PHONY: check-fmt
check-fmt:
	poetry run isort -rc -m 3 --check-only .


.PHONY: lint
lint:
	poetry run mypy app.py --ignore-missing-imports
	poetry run flake8 app.py


.PHONY: build
build:
	docker build -t ysku/debug-api .


.PHONY: start
start:
	docker run --rm -it ysku/debug-api


.PHONY: push
push:
	docker push ysku/debug-api
