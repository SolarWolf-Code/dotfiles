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

# install yay then the rest of the packages
cd

sudo pacman -S base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd
yay -S --noconfirm - < ~/.config/packages.txt
