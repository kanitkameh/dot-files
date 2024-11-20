VIMRC=~/.vimrc 
IDEAVIMRC=~/.ideavimrc
BASHRC=~/.bashrc 
WARPDCONFIG=~/.config/warpd/config
KMONADKEYBOARD=~/Documents/kmonad-config
I3CONFIG=~/.config/i3/config

deleteCommon() {
    rm -rf $VIMRC
    rm -rf $IDEAVIMRC
    rm -rf $BASHRC
    rm -rf $WARPDCONFIG
    rm -rf $KMONADKEYBOARD
    rm -rf ~/.vim
    rm -rf ~/.p10k.zsh
    rm -rf ~/.zshrc
    rm -rf ~/.inputrc
    rm -rf ~/.config/nvim
}

deleteMacSymlinks() {
    # Mac Specific
    YABAIRC=~/.yabairc 
    SPACEBARRC=~/.config/spacebar/spacebarrc 
    SKHDRC=~/.skhdrc
    rm -rf $YABAIRC
    rm -rf $SPACEBARRC
    rm -rf $SKHDRC
    rm -rf $HOME/Library/Application\ Support/Code/User/settings.json
}

deleteLinuxSymlinks() {
    rm -rf $I3CONFIG
    rm -rf ~/.config/sway/config 
}

case $1 in 
    MacOS)
        deleteCommon
        deleteMacSymlinks
        ;;
    Linux)
        deleteCommon
        deleteLinuxSymlinks
        ;;
    *)
        echo "Please enter a valid OS(MacOS/Linux) as an argument"
        ;;
esac
