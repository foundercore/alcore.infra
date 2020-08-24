# create the admin account
alcore.create.admin:
	cd /edx/app/edxapp/edx-platform; \
		sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws createsuperuser

# Optional: add the ubuntu user to a couple of the Open edX Linux groups. This will greatly simplify working with Open edX system files.
alcore.add-user:
	sudo usermod -a -G www-data ubuntu
	sudo usermod -a -G edxapp ubuntu

alcore.config.update:
	cp ./configs/lms.env.json /edx/app/edxapp/lms.env.json
	cp ./configs/lms.auth.json /edx/app/edxapp/lms.auth.json
	cp ./configs/cms.env.json /edx/app/edxapp/cms.env.json
	cp ./configs/cms.auth.json /edx/app/edxapp/cms.auth.json

alcore.config.apply: alcore.config.update alcore.restart

alcore.restart.lms:
	/edx/bin/supervisorctl restart lms

alcore.restart.cms:
	/edx/bin/supervisorctl restart cms

alcore.restart.worker:
	/edx/bin/supervisorctl restart edxapp_worker

alcore.restart: alcore.restart.cms alcore.restart.lms
