#!/bin/bash
VIMRC=~/.vimrc 
I3CONF=~/.config/i3/config
BASHRC=~/.bashrc 

YABAIRC=~/.yabairc 
SPACEBARRC=~/.config/spacebar/spacebarrc 
SKHDRC=~/.skhdrc
copyLinuxSpecific(){
    if test -f "$I3CONF"; then
        echo "$I3CONF found"
        cp ~/.config/i3/config i3/config
    fi
}
copyCommon () {
    if test -f "$VIMRC"; then
        echo "$VIMRC found"
        cp ~/.vimrc vim/.vimrc
    fi


    if test -f "$BASHRC"; then
        echo "$BASHRC found"
        cp ~/.bashrc bash/.bashrc
    fi
    cp ~/.p10k.zsh zsh
    cp ~/.zshrc zsh
}
copyMacSpecific () {
        if test -f "$YABAIRC"; then
            echo "$YABAIRC found"
            cp $YABAIRC yabai/.yabairc
        fi
        if test -f "$SPACEBARRC"; then
            echo "$SPACEBARRC found"
            cp $SPACEBARRC spacebar/spacebarrc
        fi
        if test -f "$SKHDRC"; then
            echo "$SKHDRC found"
            cp $SKHDRC skhd/.skhdrc
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
