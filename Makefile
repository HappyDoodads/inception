DOCKER_COMPOSE = docker compose
COMPOSE_FILE = ./srcs/docker-compose.yml
DB_VOL = /home/jdemers/data/mariadb
WP_VOL = /home/jdemers/data/wordpress
TARGET = undefined

all: up

up:
	@mkdir -p $(DB_VOL)
	@mkdir -p $(WP_VOL)
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up --build --detach

bash:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec $(TARGET) bash

logs:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) logs -f

down:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

kill:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) kill

clean:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down -v

rm_volumes: clean
	sudo rm -rf $(DB_VOL)
	sudo rm -rf $(WP_VOL)

fclean: rm_volumes
	@docker system prune -af

restart: clean up

.PHONY: all up bash logs down kill clean rm_volumes fclean restart