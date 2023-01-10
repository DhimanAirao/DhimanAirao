sudo apt update
sudo apt install fonts-firacode
sudo apt install micro
sudo apt install snapd
sduo snap install bottom
sudo apt install guake
sudo apt install zsh

cp -v my_bottom.toml ~/.config/bottom/bottom.toml

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

if[[ -f ~/.zshrc ]]; then
	sed -i -e '/ZSH_THEME/s,\".*,"powerlevel10k/powerlevel10k”,g' ~/.zshrc	
fi

cp -v my_alias ~/.my_alias
sed -i '$a if[[ -f ~/.my_alias ]]; then\n	source ~/.my_alias\nfi' ~/.zshrc

cp -v my_theme.micro ~/.config/micro/colorschemes/
