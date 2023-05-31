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
`
gh auth login
git config --global credential.helper store
`

### Create file for vpn credentials
Obtain Surfshark token from the website and put in this file
`
cd && mkdir ovpn && mc ~/ovpn/credentials.txt
`
### TODO:
- update to include multilib in pacman.conf
