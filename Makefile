ROOT_DIR=./tmp

env.setup.folder:
	mkdir -p $(ROOT_DIR)

env.setup.config:
	cp ./config.yml ~/config.yml

prepare.env: env.setup.folder env.setup.config
	sh ./scripts/configure-instance.sh

install.alcore: prepare.env
	sudo chmod 755 ./scripts/install-alcore.sh
	sudo nohup ./scripts/install-alcore.sh &
