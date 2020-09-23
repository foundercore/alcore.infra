alcore.apply.configuration:
	sudo cp ./local/configurations/lms.env.json /opt/bitnami/apps/edx/conf/lms.env.json
	sudo cp ./local/configurations/lms.auth.json /opt/bitnami/apps/edx/conf/lms.auth.json
	sudo cp ./local/configurations/cms.env.json /opt/bitnami/apps/edx/conf/cms.env.json
	sudo cp ./local/configurations/cms.auth.json /opt/bitnami/apps/edx/conf/cms.auth.json

alcore.setup.theme:
	sudo chmod 755 ./scripts/cloud/setup-themes.sh
	sh ./scripts/cloud/setup-themes.sh

alcore.rebuild.static: alcore.setup.theme
	sudo /opt/bitnami/apps/edx/bin/edxapp-update-assets-lms
	sudo /opt/bitnami/apps/edx/bin/edxapp-update-assets-cms

alcore.restart: alcore.apply.configuration
	sudo /opt/bitnami/ctlscript.sh restart apache
	sudo /opt/bitnami/ctlscript.sh restart edx

alcore.restart.all: alcore.apply.configuration
	sudo /opt/bitnami/ctlscript.sh restart

alcore.run.plop:
	npm run apply

alcore.update.theme: alcore.run.plop alcore.rebuild.static alcore.restart

alcore.init:
	sudo /opt/bitnami/bnhelper-tool

alcore.log.lms:
	cat /opt/bitnami/apps/edx/var/log/lms/edx.log

alcore.log.cms:
	cat /opt/bitnami/apps/edx/var/log/cms/edx.log

alcore.course.delete:
	sudo chmod 755 ./scripts/cloud/remove-course.sh
	sh ./scripts/cloud/remove-course.sh

alcore.xblock.switch-user:
	sudo /opt/bitnami/use_edx
	source /opt/bitnami/apps/edx/venvs/edxapp/bin/activate

alcore.xblock.install:
	sudo chmod 755 ./scripts/cloud/install-xblock.sh
	sh ./scripts/cloud/install-xblock.sh
