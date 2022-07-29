#!/bin/bash
VIMRC=~/.vimrc 
I3CONF=~/.config/i3/config
BASHRC=~/.bashrc 

YABAIRC=~/.yabairc 
SPACEBARRC=~/.config/spacebar/spacebarrc 
SKHDRC=~/.skhdrc
case $1 in 
    MacOS)
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
        ;;
    Linux)
        if test -f "$VIMRC"; then
            echo "$VIMRC found"
            cp ~/.vimrc vim/.vimrc
        fi

        if test -f "$I3CONF"; then
            echo "$I3CONF found"
            cp ~/.config/i3/config i3/config
        fi

        if test -f "$BASHRC"; then
            echo "$BASHRC found"
            cp ~/.bashrc bash/.bashrc
        fi
        ;;
    *)
        echo "Please enter a valid OS(MacOS/Linux) as an argument"
        ;;
esac 
