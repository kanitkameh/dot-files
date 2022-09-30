#!/bin/bash
VIMRC=~/.vimrc 
I3CONFIG=~/.config/i3/config
BASHRC=~/.bashrc 
WARPDCONFIG=~/.config/warpd/config

YABAIRC=~/.yabairc 
SPACEBARRC=~/.config/spacebar/spacebarrc 
SKHDRC=~/.skhdrc
copyLinuxSpecific(){
    if test -f "$I3CONFIG"; then
        echo "$I3CONFIG found"
        cp ~/.config/i3/config i3/config
    fi
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
