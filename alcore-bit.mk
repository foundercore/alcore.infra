alcore.apply.configuration:
	sudo cp ./configs/bit/lms.env.json /opt/bitnami/apps/edx/conf/lms.env.json
	sudo cp ./configs/bit/lms.auth.json /opt/bitnami/apps/edx/conf/lms.auth.json
	sudo cp ./configs/bit/cms.env.json /opt/bitnami/apps/edx/conf/cms.env.json
	sudo cp ./configs/bit/cms.auth.json /opt/bitnami/apps/edx/conf/cms.auth.json

alcore.setup.theme:
	sudo chmod 755 ./scripts/setup-themes.sh
	sh ./scripts/setup-themes.sh

alcore.setup.domain:


alcore.rebuild.static: alcore.setup.theme
	sudo /opt/bitnami/apps/edx/bin/edxapp-update-assets-lms
	sudo /opt/bitnami/apps/edx/bin/edxapp-update-assets-cms

alcore.restart: alcore.apply.configuration
	sudo /opt/bitnami/ctlscript.sh restart apache
	sudo /opt/bitnami/ctlscript.sh restart edx

alcore.update.theme: alcore.rebuild.static alcore.restart

alcore.init:
	sudo /opt/bitnami/bnhelper-tool

alcore.log.lms:
	cat /opt/bitnami/apps/edx/var/log/lms/edx.log

alcore.log.cms:
	cat /opt/bitnami/apps/edx/var/log/lms/edx.log
