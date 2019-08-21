# Setup user as sudo user
adduser shiba
usermod -aG sudo shiba

# Install basic packages
apt update
apt install sudo git ruby

# Switch into shiba
su - shiba

# Setup projects dir and clone debian-joy repo
mkdir projects
cd projects
git clone https://github.com/fancycade/debian-joy.git

echo "Run ruby scripts/setup.rb"

