COMPOSE := docker compose -f infra/docker-compose.yml

.DEFAULT_GOAL := help
.PHONY: help env up down restart logs ps clean hooks

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | \
		awk -F ':.*## ' '{printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

env: ## Create infra/.env from the example if it does not exist
	@test -f infra/.env || (cp infra/.env.example infra/.env && echo "Created infra/.env")

up: env ## Start the whole stack
	$(COMPOSE) up -d

down: ## Stop the stack (data is kept)
	$(COMPOSE) down

restart: down up ## Restart the stack

logs: ## Follow logs: make logs, or make logs s=postgres
	$(COMPOSE) logs -f $(s)

ps: ## Show containers and their health
	$(COMPOSE) ps

clean: ## Stop the stack and DELETE all local data
	@read -p "This deletes all local data (database, queues). Continue? [y/N] " ans && [ "$$ans" = "y" ]
	$(COMPOSE) down -v

hooks: ## Install git hooks (run once after cloning)
	pre-commit install
