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
cd && mc github_token
`

### Create file for vpn credentials
Obtain Surfshark token from the website and put in this file
`
cd && mkdir ovpn && mc ~/ovpn/credentials.txt
`
TODO:
- use hostname instead of "wolf"
- update to include multilib in pacman.conf
- fix openvpn. use a service instead
