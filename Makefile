install: install-vim \
	install-git

install-vim: install-git
	ln -s `pwd`/.vim ~/.vim
	ln -s `pwd`/.vimrc ~/.vimrc
	mkdir ~/.vim/undodir
	mkdir ~/.vim/swapdir
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall

install-git:
	ln -s `pwd`/.gitconfig ~/.gitconfig
