# dotfiles



## How to start
Start by clone this repo:
`git clone https://github.com/SolarWolf-Code/dotfiles.git`

Move files to ~/.config and run the setup script
```
mkdir -p ~/.config
rm -rf ~/.config/i3
cd dotfiles
shopt -s dotglob
mv dotfiles/* ~/.config
chmod +x ~/.config/setup.sh
cd ~/.config
./setup.sh
```
