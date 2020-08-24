eval "$(ssh-agent -s)"

git clone git@github.com:foundercore/alcore.themes.git /home/ubuntu/alcore.themes

chown edxapp -R /home/ubuntu/alcore.themes
chgrp edxapp -R /home/ubuntu/alcore.themes
