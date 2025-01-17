# scripts
## debian init script
- packages: zsh git curl vim bat
- adding zsh aliases
- installing plugins: zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode
- vimrc number and relnumber, F2 key to show formatting
- motd edit

### todo
- check if root, and if not, check if sys has sudo

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/tp-matmar/scripts/main/debian-init.sh)"
```

## Source
```
#!/bin/bash
### matmar shell install and config

read -p '[?] Run init script (zsh config and plugins, aliases and scripts) (Y/n) ' -n 1 -r; echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit
fi

#emacs vs vi
read -p '[?] emacs or vi (E/v) ' -n 1 -r; echo

apt update -y && apt upgrade -y
# install packages i use
apt install zsh git curl vim bat -y

# installing ohmyzsh	
#chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

## config zsh
all_themes=$(ls ~/.oh-my-zsh/themes | cut -d"." -f1)
new_random_theme=$(echo $all_themes | xargs shuf -n1 -e)
zsh_default_theme=$(/bin/cat ~/.zshrc | grep -oE "^ZSH_THEME=.*$" | cut -d'"' -f2) 
sed -i "s/$zsh_default_theme/$new_random_theme/g" ~/.zshrc

## add aliases
echo "alias zshrc='vim ~/.zshrc; source ~/.zshrc'" >> ~/.zshrc
echo "alias hosts='sudo vim /etc/hosts'" >> ~/.zshrc
echo "alias grep='grep --color=auto'" >> ~/.zshrc
echo "alias grep-ip='grep -oE '\''(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'\'" >> ~/.zshrc
echo "alias config=\"grep -v '#' | grep -v '^$'\"" >> ~/.zshrc
echo "alias cat='batcat --color=always --paging=never -p'" >> ~/.zshrc
echo "alias random_zsh_theme='base64 -d <<< c2VkIC1pICJzX2AvYmluL2NhdCB+Ly56c2hyYyB8IGdyZXAgLW9FICdeWlNIX1RIRU1FPS4qJCcgfCBjdXQgLWQnIicgLWYyYF8kKGVjaG8gYGxzIH4vLm9oLW15LXpzaC90aGVtZXMgfCBjdXQgLWQiLiIgLWYxYCB8IHhhcmdzIHNodWYgLW4xIC1lKV9nIiB+Ly56c2hyYwo= | zsh && source ~/.zshrc'"
#or use ZSH_THEME="random" to get new theme every source of zshrc


## scripts
echo -e '#!/bin/bash\ncurl -s cheat.sh/$1' > /usr/local/sbin/cheat && chmod +x /usr/local/sbin/cheat
echo -e '#!/bin/bash\nwhile [ : ]; do $@; sleep 1; clear;sleep 0.02; done' > /usr/local/sbin/loop && chmod +x /usr/local/sbin/loop

## plugins
zsh_plugins=$(/bin/cat ~/.zshrc | grep -oE "^plugins=.*$" | cut -d'(' -f2) 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install vi mode, or don't
if [[ $REPLY =~ ^[Vv]$ ]]
then
	#vi
	git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
	sed -i "s/$zsh_plugins/zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode)/g" ~/.zshrc
else
	#emacs
	sed -i "s/$zsh_plugins/zsh-autosuggestions zsh-syntax-highlighting)/g" ~/.zshrc
fi

# config vim
echo "set number relativenumber" > ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo "set listchars=eol:↓,tab:\ \ ┊,trail:●,extends:…,precedes:…,space:·" >> ~/.vimrc
echo "nmap <F2> :set invlist<CR>" >> ~/.vimrc
echo "imap <F2> <ESC>:set invlist<CR>" >> ~/.vimrc



# motd
rm /etc/update-motd.d/*
echo "welcome back" > /etc/motd
echo -e '#!/bin/bash\nlast -f /var/log/wtmp | head -n2' > /etc/update-motd.d/11-lastlogin && chmod +x /etc/update-motd.d/11-lastlogin 
# source configs
zsh && source ~/.zshrc
```
