# Create SSH Key
ssh-keygen -t rsa -b 4096 -C "team@foundercore.org"

# Enable Agent
eval "$(ssh-agent -s)"

# Add Key to Agent
ssh-add ~/.ssh/id_rsa

# Display Key
cat ~/.ssh/id_rsa.pub
