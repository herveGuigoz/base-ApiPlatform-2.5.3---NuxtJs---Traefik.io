DC=docker-compose
DC_UP=$(DC) up -d
PROJECT_NAME=familycooking

down: ## Down containers
	$(DC) down --remove-orphans

help: ## Show commands
	@grep -E '(^[0-9a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##
## Prod
## -----
##

##
## Dev
## -----
##

install: update ## Install, prepare and build project
	#docker network ${PROJECT_NAME}

update: ## Update project
	#git pull
	$(DC) down --remove-orphans
	$(DC) pull
	$(DC) build
	$(MAKE) up

up: ## Up containers
	$(DC_UP)

stop: ## Stop project
	$(DC) stop

checkout: ## Git checkout helper
	$(DC) stop
	$(DC) exec php composer install
	make back-db-schema-update
	make back-db-reset
	$(DC) exec php rm -rf var/cache
	$(DC) stop
	$(DC_UP) --remove-orphans --no-recreate

logs: ## Show logs
	# Follow the logs.
	$(DC) logs -f

reset: ## Reset all (use it with precaution!)
	make uninstall
	make install

uninstall:
	make stop
	# Kill containers.
	$(DC) kill
	# Remove containers.
	$(DC) down --volumes --remove-orphans
#	./scripts/linux/uninstall.sh
	
##
## Backend specific
## -----
##

back-ssh: ## Connect to the container in ssh
	docker exec -it php_${PROJECT_NAME} sh

back-db-schema-update: ## Update database schema
	$(DC) exec php bin/console doctrine:schema:update --dump-sql --force

back-db-reset: ## Reset the database with fixtures data
	$(DC) exec php bin/console hautelook:fixtures:load -n --purge-with-truncate

back-rm-cache: ## Clear cache
	$(DC) exec php rm -rf var/cache

##
## Frontend specific
## -----
##

front-ssh: ## Connect to the container in ssh
	docker exec -it client_${PROJECT_NAME} sh

front-lint: ## Run lint
	$(DC) exec client_${PROJECT_NAME} yarn lint --fix

##
## Tests & CI
## -----
##

test: ## Run all tests
	make cs
	make phpunit
	make stan
	$(DC) exec client_${PROJECT_NAME} yarn lint

cs: ## Run php cs fixer
	$(DC) exec php ./vendor/friendsofphp/php-cs-fixer/php-cs-fixer fix --dry-run --stop-on-violation --diff

cs-fix: ## Run php cs fixer and fix errors
	$(DC) exec php ./vendor/friendsofphp/php-cs-fixer/php-cs-fixer fix

phpunit: ## Run PHPUnit
	$(DC) exec php bin/phpunit

stan: ## Run php stan
	$(DC) exec php ./vendor/phpstan/phpstan/bin/phpstan analyse -c phpstan.neon src --level 6

.DEFAULT_GOAL := help

.PHONY: help
