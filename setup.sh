# symlinking dotfiles
mkdir -p ~/.config
rm -rf ~/.config/i3
cd dotfiles
shopt -s dotglob
for file in *; do
  if [[ "$file" == ".git" || "$file" == "README.md" || "$file" == "setup.sh" || "$file" == ".gtkrc-2.0" ]]; then
    continue
  fi
  ln -s "$(pwd)/$file" ~/.config/"$file"
done

# adding ble.sh (autocomplete in bash)
cd 
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc

# update bashrc
cd
mv ~/.config/.bashrc ~/.bashrc

# moving openvpn file to correct folder
cd
sudo mv ~/.config/us-slc.prod.surfshark.com_udp.ovpn /etc/openvpn/

# install yay
cd
sudo pacman -S base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install packages from package list
cd
yay -S --noconfirm - < ~/.config/packages.txt

# update mlocate db
sudo updatedb

# symlink GTK theme to home dir
ln -s "~/dotfiles/.gtkrc-2.0" ~/

# refresh i3
i3-msg restart
