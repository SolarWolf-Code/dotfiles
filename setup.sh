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

# mask xdg-desktop-portal - otherwise browser takes forever to open
systemctl --user mask xdg-desktop-portal

# bluetooth
sudo systemctl enable bluetooth.service 
sudo systemctl start bluetooth.service

# r2modman: add --no-sandbox flag to work
sudo sed -i "s|^\(Exec=.*\)$|\1 --no-sandbox|" "/usr/share/applications/r2modman.desktop"

# setting up pretty greeter
sudo cp -r ~/dotfiles/lightdm-evo /usr/share/lightdm-webkit/themes/lightdm-evo
sudo cp ~/dotfiles/lightdm-webkit2-greeter.conf /etc/lightdm/lightdm-webkit2-greeter.conf
sudo cp ~/dotfiles/lightdm.conf /etc/lightdm/lightdm.conf

# changing user avatar
sudo cp ~/dotfiles/avatar.jpg /var/lib/AccountsService/icons/$USER
sudo chmod 644 /var/lib/AccountsService/icons/$USER
sudo cp ~/dotfiles/ASuser /var/lib/AccountsService/users/$USER

# rebooting to change everything
read -p "Would you like to reboot for changes to take effect? (Y/N): " answer

if [[ $answer =~ ^[Yy]$ ]] || [[ -z $answer ]]; then
  echo "Rebooting..."
  reboot
else
  echo "Skipping reboot..."
fi
