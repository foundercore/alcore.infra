eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

sudo rm -rf /opt/bitnami/apps/edx/var/themes
sudo git clone https://github.com/foundercore/alcore.themes.git /opt/bitnami/apps/edx/var/themes
sudo chown -R daemon.daemon /opt/bitnami/apps/edx/var/themes
