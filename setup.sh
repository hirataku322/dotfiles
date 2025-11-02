SOURCE_DIR=$(git rev-parse --show-toplevel)
ln -Fs ${SOURCE_DIR}/.wezterm.lua ~/.wezterm.lua
ln -Fs ${SOURCE_DIR}/.zshrc ~/.zshrc
ln -Fs ${SOURCE_DIR}/.config/starship.toml ~/.config/starship.toml
ln -Fs ${SOURCE_DIR}/.config/nvim ~/.config/nvim
ln -Fs ${SOURCE_DIR}/.config/github-copilot ~/.config/github-copilot
