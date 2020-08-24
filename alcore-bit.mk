alcore.apply.configuration:
	sudo cp ./configs/bit/lms.env.json /opt/bitnami/apps/edx/conf/lms.env.json
	sudo cp ./configs/bit/lms.auth.json /opt/bitnami/apps/edx/conf/lms.auth.json
	sudo cp ./configs/bit/cms.env.json /opt/bitnami/apps/edx/conf/cms.env.json
	sudo cp ./configs/bit/cms.auth.json /opt/bitnami/apps/edx/conf/cms.auth.json

alcore.setup.theme:
	sudo chmod 755 ./scripts/setup-themes.sh
	sh ./scripts/setup-themes.sh

alcore.rebuild.static: alcore.setup.theme
	sudo /opt/bitnami/apps/edx/bin/edxapp-update-assets-lms
	sudo /opt/bitnami/apps/edx/bin/edxapp-update-assets-cms

alcore.refresh: alcore.apply.configuration
	sudo /opt/bitnami/ctlscript.sh restart apache
	sudo /opt/bitnami/ctlscript.sh restart edx
