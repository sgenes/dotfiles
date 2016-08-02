#!/usr/bin/zsh

# Create Backup dir, Swap dir and View dir
local CACHE='~/.cache'
if [[ -d $CACHE/vimbackup ]]; then
	echo 'Backup dir already exists'
else
	mkdir $CACHE/vimbackup
fi
if [[ -d $CACHE/vimview ]]; then
	echo 'View dir already exists'
else
	mkdir $CACHE/vimview
fi
if [[ -d $CACHE/vimswap ]]; then
	echo 'Swap dir already exists'
else
	mkdir $CACHE/vimswap
fi

# Create .vim directory in home directory
local VIMDIR='~/.vim'
if [[ -d $VIMDIR ]]; then
	rm -rf $VIMDIR
	ln -s vim $VIMDIR
else
	ln -s vim $VIMDIR
fi

# Create .vimrc
local VIMRC='~/.vimrc'
if [[ -e $VIMRC ]]; then
	rm $VIMRC
	ln -s vimrc $VIMRC
else
	ln -s vimrc $VIMRC
fi

# Create .zshrc
local ZSHRC='~/.zshrc'
if [[ -e $ZSHRC ]]; then
	rm $ZSHRC
	ln -s zshrc $ZSHRC
else
	ln -s zshrc $ZSHRC
fi

# Create .zsh
local ZSHDIR='~/.zsh'
if [[ -d $ZSHDIR ]]; then
	rm -rf $ZSHDIR
	ln -s zsh $ZSHDIR
else
	ln -s zsh $ZSHDIR
fi

# Create .antigen-hs
local ANTIGEN='~/.antigen-hs'
if [[ -d $ANTIGEN ]]; then
	rm -rf $ANTIGEN
	ln -s antigen-hs $ANTIGEN
else
	ln -s antigen-hs $ANTIGEN
fi
