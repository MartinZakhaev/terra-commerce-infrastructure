.PHONY: config up down apps logs

config:
	docker compose config

up:
	docker compose up -d

down:
	docker compose down

apps:
	docker compose --profile apps up --build

logs:
	docker compose logs -f
