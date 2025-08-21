# install essentials
sudo apt install -y git wget curl

sudo apt install -y zsh
# installing ohmyzsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# installing powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sudo apt install -y neovim
sudo apt install -y ripgrep 
sudo apt install -y ranger

sudo apt install -y bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
sudo apt install -y zoxide

sudo apt install -y sway i3blocks
sudo apt install -y network-manager
sudo apt install -y brightnessctl

# Audio management
sudo apt install pipewire wireplumber pavucontrol pamixer
systemctl --user enable --now pipewire.service pipewire-pulse.service wireplumber.service
