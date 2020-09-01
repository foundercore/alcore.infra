dev.get-config:
	sh ./scripts/devstack/get-config.sh

dev.put-config:
	sh ./scripts/devstack/put-config.sh

dev.clone.themes:
	sh ./scripts/devstack/clone-themes.sh

dev.put-theme:
	docker cp ../ironwood/alcore.themes/ edx.devstack.studio:/edx/app/edxapp/edx-platform/themes/

dev.restart.stack:
	sh ./scripts/devstack/restart-stack.sh

dev.update.config: dev.put-config dev.restart.stack

dev.lms.shell:
	cd ../ironwood/devstack/; make lms-shell

dev.static.lms:
	cd ../ironwood/devstack/; make lms-static

dev.static.cms:
	cd ../ironwood/devstack/; make studio-static

dev.update-static: dev.put-config dev.put-theme dev.static.lms dev.static.cms dev.restart.stack

dev.init:
	mkdir -p ../ironwood;
