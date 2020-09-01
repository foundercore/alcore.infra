docker cp ./configs/devstack/lms.env.json edx.devstack.lms:/edx/app/edxapp/lms.env.json
docker cp ./configs/devstack/lms.auth.json edx.devstack.lms:/edx/app/edxapp/lms.auth.json
docker cp ./configs/devstack/cms.auth.json edx.devstack.studio:/edx/app/edxapp/cms.auth.json
docker cp ./configs/devstack/cms.env.json edx.devstack.studio:/edx/app/edxapp/cms.env.json