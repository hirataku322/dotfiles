ls .config | xargs -I{} ln -s $(pwd)/.config/{} ~/.config/{}
ln -s $(pwd)/.zshrc ~
