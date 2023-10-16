VIMRC=~/.vimrc 
IDEAVIMRC=~/.ideavimrc
BASHRC=~/.bashrc 
WARPDCONFIG=~/.config/warpd/config
KMONADKEYBOARD=~/Documents/kmonad-config/

I3CONFIG=~/.config/i3/config
copyMacSpecific () {
    # Mac Specific
    YABAIRC=~/.yabairc 
    SPACEBARRC=~/.config/spacebar/spacebarrc 
    SKHDRC=~/.skhdrc
    cp yabai/.yabairc $YABAIRC
    cp spacebar/spacebarrc $SPACEBARRC
    cp skhd/.skhdrc $SKHDRC
    cp vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
}
copyCommon () {
    cp vim/.vimrc $VIMRC
    cp bash/.bashrc $BASHRC
    cp warpd/config $WARPDCONFIG

    cp zsh/.p10k.zsh ~/.p10k.zsh 
    cp zsh/.zshrc ~/.zshrc
    cp -r kmonad/. $KMONADKEYBOARD
    cp ideavimrc/.ideavimrc $IDEAVIMRC
    cp jline/.inputrc ~/.inputrc 
    cp -r nvim ~/.config/
}
copyLinuxSpecific () {
    cp i3/config $I3CONFIG
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
