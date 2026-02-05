DOCKER_DIR = ./backend/docker/

encrypt-env:
	cd "$(DOCKER_DIR)" && \
	ansible-vault encrypt .env
decrypt-env:
	cd "$(DOCKER_DIR)" && \
	ansible-vault decrypt .env
edit-env:
	cd "$(DOCKER_DIR)" && \
	ansible-vault edit .env

start-db:
	cd "${DOCKER_DIR}" && \
	sudo docker compose up -d
