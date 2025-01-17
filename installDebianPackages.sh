# install essentials
sudo apt install git wget

sudo apt install zsh
# installing ohmyzsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# installing powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sudo apt install neovim
sudo apt install ripgrep 
sudo apt install ranger

sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
sudo apt install zoxide

sudo apt install sway i3blocks
sudo apt install network-manager
