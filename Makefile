DOCKER_COMPOSE = docker compose
COMPOSE_FILE = ./srcs/docker-compose.yml
DB_VOL = /home/jdemers/data/mariadb
WP_VOL = /home/jdemers/data/wordpress
TARGET = undefined

all: build

build:
	@mkdir -p $(DB_VOL)
	@mkdir -p $(WP_VOL)
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up --build --detach

bash:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec $(TARGET) bash

debug: build
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) logs -f

down:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

kill:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) kill

clean:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down -v

fclean: clean
	sudo rm -rf $(DB_VOL)
	sudo rm -rf $(WP_VOL)
	docker system prune -af

restart: clean build

.PHONY: all build down kill clean fclean restart