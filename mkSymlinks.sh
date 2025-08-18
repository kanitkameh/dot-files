VIMRC=~/.vimrc 
IDEAVIMRC=~/.ideavimrc
BASHRC=~/.bashrc 
WARPDCONFIG=~/.config/warpd/config
KMONADKEYBOARD=~/Documents/kmonad-config
I3CONFIG=~/.config/i3/config

copyMacSpecific () {
    # Aerospace is a replacement for yabai
    # YABAIRC=~/.yabairc 
    AEROSPACE=~/.aerospace.toml
    SPACEBARRC=~/.config/spacebar/spacebarrc 
    SKHDRC=~/.skhdrc
    # ln -s $PWD/yabai/.yabairc $YABAIRC
    ln -s $PWD/aerospace/aerospace.toml $AEROSPACE
    ln -s $PWD/spacebar/spacebarrc $SPACEBARRC
    ln -s $PWD/skhd/.skhdrc $SKHDRC
    ln -s $PWD/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
}

copyCommon () {
    ln -s $PWD/vim/.vimrc $VIMRC
    ln -s $PWD/vim/.vim ~/.vim
    ln -s $PWD/bash/.bashrc $BASHRC
    ln -s $PWD/warpd/config $WARPDCONFIG

    ln -s $PWD/zsh/.p10k.zsh ~/.p10k.zsh 
    ln -s $PWD/zsh/.zshrc ~/.zshrc
    ln -s $PWD/kmonad $KMONADKEYBOARD
    ln -s $PWD/ideavimrc/.ideavimrc $IDEAVIMRC
    ln -s $PWD/jline/.inputrc ~/.inputrc 
    ln -s $PWD/nvim ~/.config/nvim
}

copyLinuxSpecific () {
    ln -s $PWD/i3/config $I3CONFIG
    ln -s $PWD/sway/config ~/.config/sway/config 
}

case $1 in 
    MacOS)
        copyCommon
        copyMacSpecific
        ;;
    Linux)
        copyCommon
        copyLinuxSpecific
        ;;
    *)
        echo "Please enter a valid OS(MacOS/Linux) as an argument"
        ;;
esac
