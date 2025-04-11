DOCKER_COMPOSE = docker compose
COMPOSE_FILE = ./srcs/docker-compose.yml
DB_VOL = /home/jdemers/data/mariadb
WP_VOL = /home/jdemers/data/wordpress

all: build

build:
	@mkdir -p $(DB_VOL)
	@mkdir -p $(WP_VOL)
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up --build --detach

down:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

kill:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) kill

clean:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down -v

fclean: clean
	rm -r $(DB_VOL)
	rm -r $(WP_VOL)
	docker system prune -af

restart: clean build

.PHONY: all build down kill clean fclean restart