# create the admin account
alcore.create.admin:
	cd /edx/app/edxapp/edx-platform; \
		sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws createsuperuser

# Optional: add the ubuntu user to a couple of the Open edX Linux groups. This will greatly simplify working with Open edX system files.
alcore.add-user:
	sudo usermod -a -G www-data ubuntu
	sudo usermod -a -G edxapp ubuntu

alcore.configure.update:
	sudo cp ./configs/lms.env.json /edx/app/edxapp/lms.env.json
	sudo cp ./configs/lms.auth.json /edx/app/edxapp/lms.auth.json
	sudo cp ./configs/cms.env.json /edx/app/edxapp/cms.env.json
	sudo cp ./configs/cms.auth.json /edx/app/edxapp/cms.auth.json

alcore.configure.update.bit:
	sudo cp ./configs/bit/lms.env.json /opt/bitnami/apps/edx/conf/lms.env.json
	sudo cp ./configs/bit/lms.auth.json /opt/bitnami/apps/edx/conf/lms.auth.json
	sudo cp ./configs/bit/cms.env.json /opt/bitnami/apps/edx/conf/cms.env.json
	sudo cp ./configs/bit/cms.auth.json /opt/bitnami/apps/edx/conf/cms.auth.json

alcore.static.compile:
	sudo chmod 755 ./scripts/compile-assets.sh
	sh ./scripts/compile-assets.sh

alcore.change-owner.themes:
	chown edxapp -R /home/ubuntu/alcore.themes
	chgrp edxapp -R /home/ubuntu/alcore.themes

alcore.configure.apply: alcore.configure.update alcore.static.compile alcore.restart

alcore.configure.ssl:
	sudo apt-get install certbot python-certbot-nginx -y
	sudo certbot --authenticator standalone --installer nginx --pre-hook "service nginx stop" --post-hook "service nginx start"

alcore.configure.nginx.lms:
	sudo vim /edx/app/nginx/sites-available/lms

alcore.configure.nginx.cms:
	sudo vim /edx/app/nginx/sites-available/cms

alcore.restart.lms:
	/edx/bin/supervisorctl restart lms

alcore.restart.cms:
	/edx/bin/supervisorctl restart cms

alcore.restart.worker:
	/edx/bin/supervisorctl restart edxapp_worker

alcore.restart.bit:
	sudo /opt/bitnami/ctlscript.sh restart apache
	sudo /opt/bitnami/ctlscript.sh restart edx

alcore.restart: alcore.restart.cms alcore.restart.lms
