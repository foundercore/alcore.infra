RELEASE=ironwood

cd ../$RELEASE/devstack/
docker-compose restart lms
docker-compose restart studio
