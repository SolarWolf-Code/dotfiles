# dotfiles



## How to start
Start by clone this repo:
`git clone https://github.com/SolarWolf-Code/dotfiles`

Move files to ~/.config and run the setup script
```
mkdir -p ~/.config
rm -d -r ~/.config/i3
mv dotfiles/* ~/.config
chmod +x ~/.config/setup.sh
cd ~/.config
./setup.sh
```
