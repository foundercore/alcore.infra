sudo -H -u edxapp bash

source /edx/app/edxapp/edxapp_env
cd /edx/app/edxapp/edx-platform

paver update_assets lms --settings=production
paver update_assets cms --settings=production