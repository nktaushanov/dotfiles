install: install-vim \
	install-git \
	install-tmux \
	install-bash

install-vim: install-git
	ln -s `pwd`/.vim ~/.vim
	ln -s `pwd`/.vimrc ~/.vimrc
	mkdir ~/.vim/undodir
	mkdir ~/.vim/swapdir
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall

install-git:
	ln -s `pwd`/.gitconfig ~/.gitconfig
	ln -s `pwd`/.gitignore_global ~/.gitignore_global
	cp _gitconfig_user_template ~/.gitconfig_user
	vim ~/.gitconfig_user

install-tmux:
	ln -s `pwd`/.tmux.conf ~/.tmux.conf

install-bash:
	ln -s `pwd`/.bash_aliases ~/.bash_aliases
	ln -s `pwd`/.bash_profile ~/.bash_profile

