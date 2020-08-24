ROOT_DIR=/home/ubuntu/.alcore

# Local Helper Scripts
-include local.mk

# Post Install Configuration Steps
include alcore.mk

env.setup.folder:
	mkdir -p $(ROOT_DIR)

env.setup.config:
	cp ./config.yml $(ROOT_DIR)/config.yml

env.demo.setup.config:
	cp ./demo.config.yml $(ROOT_DIR)/config.yml

env.setup.ssh:
	sh ./scripts/configure-ssh.sh

env.setup.themes:
	sudo rm -rf /home/ubuntu/alcore.themes
	sudo chmod 755 ./scripts/configure-themes.sh
	sh ./scripts/configure-themes.sh

env.update.self:
	git pull

watch.log.installer:
	sudo tail -f ./nohup.out

watch.log.install:
	sudo tail -f ~/install.out

prepare.env: env.update.self env.setup.folder env.setup.config env.setup.themes
	sh ./scripts/configure-instance.sh

prepare.env.demo: env.update.self env.setup.folder env.demo.setup.config env.setup.themes
	sh ./scripts/configure-instance.sh

prepare.alcore:
	sudo chmod 755 ./scripts/prepare-alcore-install.sh
	sudo sh ./scripts/prepare-alcore-install.sh

install.alcore: env.update.self
	sudo chmod 755 ./scripts/install-alcore.sh
	sudo sh ./scripts/install-alcore.sh

install: prepare.env prepare.alcore install.alcore
install.demo: prepare.env.demo prepare.alcore install.alcore
