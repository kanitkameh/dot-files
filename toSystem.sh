copyMacSpecific () {
    # Mac Specific
    YABAIRC=~/.yabairc 
    SPACEBARRC=~/.config/spacebar/spacebarrc 
    SKHDRC=~/.skhdrc
    cp yabai/.yabairc $YABAIRC
    cp spacebar/spacebarrc $SPACEBARRC
    cp skhd/.skhdrc $SKHDRC
}
copyCommon () {
    cp vim/.vimrc ~/.vimrc 
    cp i3/config ~/.config/i3/config
    cp bash/.bashrc ~/.bashrc 

    cp zsh/.p10k.zsh ~/.p10k.zsh 
    cp zsh/.zshrc ~/.zshrc
}
copyLinuxSpecific () {
    # Not implemented yet
    :
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
