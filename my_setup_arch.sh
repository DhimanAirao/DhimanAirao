#!/usr/bin/sh

sudo pacman -Syu
sudo pacman -S ttf-fira-code
sudo pacman -S micro
sudo pacman -S exa bat
sudo pacman -S snapd
sudo pacman -S bottom
sudo pacman -S guake
sudo pacman -S diff-so-fancy

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

sudo systemctl enable --now snapd.socket
sudo systemctl enable snapd.apparmor --now
sudo ln -s /var/lib/snapd/snap /snap

cp -v my_bottom.toml ~/.config/bottom/bottom.toml

cp -v my_alias ~/.my_alias
sed -i '$a if [[ -f ~/.my_alias ]]; then\n	 source ~/.my_alias\nfi' ~/.zshrc

mkdir ~/.config/micro/colorschemes
cp -v my_theme.micro ~/.config/micro/colorschemes/

sudo reboot
