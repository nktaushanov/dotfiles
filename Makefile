install: install-nvim \
	install-git \
	install-tmux \
	install-bash

install-nvim:
	ln -s `pwd`/nvim ~/.config/nvim
	mkdir ~/.config/nvim/undodir
	mkdir ~/.config/nvim/swapdir
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall +qall

# install-vim:
# 	ln -s `pwd`/.vim ~/.vim
# 	ln -s `pwd`/.vimrc ~/.vimrc
# 	mkdir ~/.vim/undodir
# 	mkdir ~/.vim/swapdir
# 	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# 	vim +BundleInstall +qall
# 	wget https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim -P ~/.vim/colors/

local-conf:
	mkdir -p ~/.local_conf

install-git: local-conf
	ln -s `pwd`/git/.gitconfig ~/.gitconfig
	mkdir -p ~/.config/git
	ln -s `pwd`/.gitignore_global ~/.config/git/gitignore_global
	ln -s `pwd`/git/draculatheme.gitconfig ~/.config/git/draculatheme.gitconfig
	cp _gitconfig_user_template ~/.local_conf/.gitconfig
	vim ~/.local_conf/.gitconfig

install-tmux:
	ln -s `pwd`/tmux ~/.config/tmux
	ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

install-bash: local-conf
	ln -s `pwd`/.bash_aliases ~/.bash_aliases
	ln -s `pwd`/.bash_profile ~/.bash_profile

install-zsh: install-bash
	ln -s `pwd`/.zshrc ~/.zshrc
	ln -s `pwd`/.zprofile ~/.zprofile
	ln -s `pwd`/.zshrc ~/.zshrc
	touch ~/.local_conf/.zprofile
	touch ~/.local_conf/.zshrc
