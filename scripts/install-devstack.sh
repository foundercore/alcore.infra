OPENEDX_RELEASE=juniper.master
ROOT_DIR=/home/$USER/alcore.dev/devstack

cd $ROOT_DIR

export OPENEDX_RELEASE=$OPENEDX_RELEASE

# Run devstack installer
conda activate alcore
make requirements

make dev.clone
make dev.pull
make dev.provision
make dev.up
