# my neovim config powered by AstroNvim
## Summary
Astronvim is a neovim distribution. My neovim config is 99.9% Astronvim with one exception. All other customizations were made in the `lua/user/` directory. I use neovim for working on ansible, bash and powershell scripts, and some light python development.
## Install
### Windows
*I use scoop as package manager under windows. It easily installs all we need for AstroNvim also I use zig as a compiler for treesitter modules, because gcc + mingw as issues on windows.*
```shell
# backup your neovim config
mv $ENV:LOCALAPPDATA\nvim $ENV:LOCALAPPDATA\nvim.bck
# backup your data directory optional but recommended
mv $ENV:LOCALAPPDATA\nvim-data $ENV:LOCALAPPDATA\nvim-data.bck
# install dependencies and neovim
scoop install 7zip curl fd fzf gdu gzip lazygit less make mingw neovim nodejs ripgrep tree-sitter unzip wget zig python
# install pynvim via pip
pip install pynvim
# clone config
git clone https://github.com/burgr033/nvim-config $ENV:LOCALAPPDATA\nvim
# launch neovim and let Lazy & Mason do their magic
nvim
```
### Arch Linux / Manjaro
```shell
# backup your neovim config
mv ~/.config/nvim ~/.config/nvim.bck
# backup your data directory optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bck
mv ~/.local/state/nvim ~/.local/state/nvim.bck
mv ~/.cache/nvim ~/.cache/nvim.bck
# install dependencies and neovim
sudo pacman -Sy --needed curl fd git neovim ripgrep fzf python python-setuptools python-pip python-pynvim python-virtualenvwrapper gdu lazygit bottom unzip base-devel wget
# clone config
git clone https://github.com/burgr033/nvim-config ~/.config/nvim
# launch neovim and let Lazy & Mason do their magic
nvim
```
## Credits
* [mehalter / AstroNvim](https://github.com/AstroNvim/AstroNvim/)
* [scoop.sh](https://scoop.sh) (awesome package manager for windows)
