# dotfiles

## Fresh Install
Install git from pacman
`sudo pacman -S git`

Clone this repo:
`git clone https://github.com/SolarWolf-Code/dotfiles.git`

### Run the setup script
```
~/dotfiles/setup.sh
```

### Setting up Github token
Obtain GH token from the website and put in this file
`
cd && touch github_token
`
### GTK theme
Run lxappearance and choose Catppuccin-Mocha-Standard-Blue-Dark

### Create file for vpn credentials
Obtain Surfshark token from the website and put in this file
`
cd && mkdir ovpn && touch ~/ovpn/credentials.txt
`

### Starting systemctl services

Bluetooth
```
sudo systemctl enable bluetooth.service 
sudo systemctl start bluetooth.service
```
