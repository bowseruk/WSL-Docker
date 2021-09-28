# Ensures that Ubuntu is installed
wsl --install -d Ubuntu
# This upgrades the ubuntu disto
wsl sudo apt update
wsl sudo apt upgrade
# Remove any unwanted installs
wsl sudo apt remove docker docker.io containerd runc
# Add official docker to repo
wsl source /etc/os-release
wsl curl -fsSL https://download.docker.com/linux/${ID}/gpg | wsl sudo apt-key add
wsl echo "deb [arch=amd64] https://download.docker.com/linux/${ID} ${VERSION_CODENAME} stable" | wsl sudo tee /etc/apt/sources.list.d/docker.list
wsl sudo apt update
# Install Docker
wsl sudo apt install docker-ce docker-ce-cli containerd.io
# Add user to the docker group
wsl sudo usermod -aG docker $USER
