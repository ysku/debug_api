FROM python:3.6-slim

WORKDIR /srv

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential libssl-dev libffi-dev python-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install poetry

COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false && poetry install --no-dev --no-root

COPY . .

ENTRYPOINT ["poetry", "run"]
CMD ["flask", "run", "--host=0.0.0.0"]
