alcore.apply.configuration:
	sudo cp ./configs/bit/lms.env.json /opt/bitnami/apps/edx/conf/lms.env.json
	sudo cp ./configs/bit/lms.auth.json /opt/bitnami/apps/edx/conf/lms.auth.json
	sudo cp ./configs/bit/cms.env.json /opt/bitnami/apps/edx/conf/cms.env.json
	sudo cp ./configs/bit/cms.auth.json /opt/bitnami/apps/edx/conf/cms.auth.json

alcore.setup.theme:
	sudo rm -rf /opt/bitnami/apps/edx/var/themes; \
		cd /opt/bitnami/apps/edx/var/themes; \
			git clone git@github.com:foundercore/alcore.themes .

alcore.update.theme:
	cd /opt/bitnami/apps/edx/var/themes; git pull
	sudo /opt/bitnami/apps/edx/bin/edxapp-update-assets-lms
	sudo /opt/bitnami/apps/edx/bin/edxapp-update-assets-cms

alcore.refresh: alcore.apply.configuration
	sudo /opt/bitnami/ctlscript.sh restart apache
	sudo /opt/bitnami/ctlscript.sh restart edx
