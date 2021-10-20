VIMRC=~/.vimrc 
I3CONF=~/.config/i3/config
BASHRC=~/.bashrc 

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
cp ~/.p10k.zsh zsh
cp ~/.zshrc zsh
