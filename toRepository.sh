#!/bin/bash
VIMRC=~/.vimrc 
IDEAVIMRC=~/.ideavimrc
I3CONFIG=~/.config/i3/config
BASHRC=~/.bashrc 
WARPDCONFIG=~/.config/warpd/config

KMONADKEYBOARD=~/Documents/kmonad-config/

YABAIRC=~/.yabairc 
SPACEBARRC=~/.config/spacebar/spacebarrc 
SKHDRC=~/.skhdrc

copyLinuxSpecific(){
    if test -f "$I3CONFIG"; then
        echo "$I3CONFIG found"
        cp ~/.config/i3/config i3/config
    fi
	cp ~/.config/sway/config sway/config
}
copyCommon () {
    if test -f "$VIMRC"; then
        echo "$VIMRC found"
        cp $VIMRC vim/
    fi


    if test -f "$BASHRC"; then
        echo "$BASHRC found"
        cp $BASHRC bash/
    fi
    cp ~/.p10k.zsh zsh/
    cp ~/.zshrc zsh/
    cp $WARPDCONFIG warpd/
    cp -r $KMONADKEYBOARD. kmonad/
    cp $IDEAVIMRC ideavimrc/
    cp ~/.inputrc jline/.inputrc
    cp -r ~/.config/nvim .
}
copyMacSpecific () {
        if test -f "$YABAIRC"; then
            echo "$YABAIRC found"
            cp $YABAIRC yabai/
        fi
        if test -f "$SPACEBARRC"; then
            echo "$SPACEBARRC found"
            cp $SPACEBARRC spacebar/
        fi
        if test -f "$SKHDRC"; then
            echo "$SKHDRC found"
            cp $SKHDRC skhd/
        fi
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
