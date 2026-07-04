.PHONY: config up down build apps logs

config:
	docker compose config

up:
	docker compose up -d

down:
	docker compose down

build:
	COMPOSE_PARALLEL_LIMIT=1 docker compose --profile apps build

apps:
	COMPOSE_PARALLEL_LIMIT=1 docker compose --profile apps up --build

logs:
	docker compose logs -f
