# my neovim config powered by AstroNvim
## Install
### Windows
*I use scoop as package manager under windows. It easily installs all we need for AstroNvim also I use zig as a compiler for treesitter modules, because gcc + mingw as issues on windows.*
```shell
# backup your neovim config
mv $ENV:LOCALAPPDATA\nvim $ENV:LOCALAPPDATA\nvim.bck
# install dependencies and neovim
scoop install 7zip curl fd fzf gdu gzip lazygit less make mingw neovim nodejs ripgrep tree-sitter unzip wget zig python
# install pynvim via pip
pip install pynvim
# clone config
git clone https://github.com/cigh033/nvim-config $ENV:LOCALAPPDATA\nvim
# launch neovim
nvim
```
### Arch Linux / Manjaro

TBD

## Credits
* [mehalter / AstroNvim](https://github.com/AstroNvim/AstroNvim/)
* [scoop.sh](https://scoop.sh) (awesome package manager for windows)
