PROJECT_ROOT=$(dirname $(realpath $0))
ls .config | xargs -I{} ln -sf $PROJECT_ROOT/.config/{} ~/.config/{}
ln -sf $PROJECT_ROOT/.zshrc ~
