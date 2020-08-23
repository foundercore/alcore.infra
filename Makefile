ROOT_DIR=/home/ubuntu/.alcore

-include local.mk

env.setup.folder:
	mkdir -p $(ROOT_DIR)

env.setup.config:
	cp ./config.yml $(ROOT_DIR)/config.yml

env.demo.setup.config:
	cp ./demo.config.yml $(ROOT_DIR)/config.yml

env.setup.ssh:
	sh ./scripts/configure-ssh.sh

env.update.self:
	git pull

watch.log.installer:
	sudo tail -f ./nohup.out

watch.log.install:
	sudo tail -f ~/install.out

prepare.env: env.update.self env.setup.folder env.setup.config
	sh ./scripts/configure-instance.sh

prepare.env.demo: env.update.self env.setup.folder env.demo.setup.config
	sh ./scripts/configure-instance.sh

install.alcore:
	sudo chmod 755 ./scripts/install-alcore.sh
	sudo nohup ./scripts/install-alcore.sh &

install: prepare.env install.alcore
install.demo: prepare.env.demo install.alcore
