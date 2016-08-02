#!/usr/bin/zsh

# Create Backup dir, Swap dir and View dir
local CACHE=~/.cache
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
local VIMDIR=~/.vim
if [[ -d $VIMDIR ]]; then
	rm -rf $VIMDIR
	ln -s $PWD/vim $VIMDIR
else
	ln -s $PWD/vim $VIMDIR
fi

# Create .vimrc
local VIMRC=~/.vimrc
if [[ -e $VIMRC ]]; then
	rm $VIMRC
	ln -s $PWD/vimrc $VIMRC
else
	ln -s $PWD/vimrc $VIMRC
fi

# Create .zshrc
local ZSHRC=~/.zshrc
if [[ -e $ZSHRC ]]; then
	rm $ZSHRC
	ln -s $PWD/zshrc $ZSHRC
else
	ln -s $PWD/zshrc $ZSHRC
fi

# Create .zsh
local ZSHDIR=~/.zsh
if [[ -d $ZSHDIR ]]; then
	rm -rf $ZSHDIR
	ln -s $PWD/zsh $ZSHDIR
else
	ln -s $PWD/zsh $ZSHDIR
fi

# Create .antigen-hs
local ANTIGEN=~/.antigen-hs
if [[ -d $ANTIGEN ]]; then
	rm -rf $ANTIGEN
	ln -s $PWD/antigen-hs $ANTIGEN
else
	ln -s $PWD/antigen-hs $ANTIGEN
fi

# Create .bin
local BINDIR=~/.bin
if [[ -d $BINDIR ]]; then
	rm -rf $BINDIR
	ln -s $PWD/bin $BINDIR
else
	ln -s $PWD/bin $BINDIR
fi
