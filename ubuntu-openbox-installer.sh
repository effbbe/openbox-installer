## Updating repository
echo "Updating Repositories"
sudo apt-get update && apt-get upgrade
echo 'Update success'

clear

## Installing openbox
echo "Installing openbox and support openbox application"
sudo apt-get install -y openbox obsession obconf obmenu xorg xserver-xorg \
cifs-utils gvfs-backends policykit-1-gnome gmrun
echo "Install success with no errors =)"

## Installing openbox and supporting applications
##echo "Installing openbox and supporting applications"
##sudo apt-get install -y openbox obsession obconf obmenu xorg xserver-xorg lightdm \
##lightdm-gtk-greeter lightdm-gtk-greeter-settings gnome-terminal lxappearance tint2 \
##gmrun cifs-utils gvfs-backends policykit-1-gnome gnome-icon-theme-full volumeicon-alsa xscreensaver \
##xscreensaver-gl xfce4-power-manager pulseaudio network-manager pavucontrol nitrogen \
##network-manager-gnome
##echo "Install success with no errors =)"

# Installing display desktop manager
echo "Installing lightdm"
sudo apt-get -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
echo "Install success with no errors =)"

clear

# Installing display network manager
echo "Installing network manager"
sudo apt-get -y network-manager network-manager-gnome
echo "Install success with no errors =)"

clear

# Installing sound manager
echo "Installing sound manager"
sudo apt-get -y pulseaudio pulseaudio-equalizer pavucontrol
echo "Install success with no errors =)"

clear

# Installing power manager and screensaver
echo "Installing power manager and screensaver"
sudo apt-get -y xscreensaver xscreensaver-gl xfce4-power-manager xfce4-power-manager-plugins
echo "Install success with no errors =)"

clear

# Installing tint2
echo "Installing panel"
sudo apt-get -y tint2
echo "Install success with no errors =)"

clear

# Installing compositor
echo "Installing compton for compositor and transparancy"
sudo apt-get -y compton
echo "Install success with no errors =)"

clear

#Configuring openbox for current user
echo "Create Openbox Directory"
mkdir -p /home/$USER/.config/openbox
echo "Copying autostart file"
wget -P /home/$USER/.config/openbox https://raw.githubusercontent.com/legawa1701/openbox-installer/master/lib/autostart
echo "Copying rc.xml"
wget -P /home/$USER/.config/openbox https://raw.githubusercontent.com/legawa1701/openbox-installer/master/lib/rc.xml
echo "Copying menu.xml"
wget -P /home/$USER/.config/openbox https://raw.githubusercontent.com/legawa1701/openbox-installer/master/lib/menu.xml
echo "Copying file success"

clear

#Installing openbox menu generator
sudo apt-get install build-essential cpanminus git -y
git clone git://github.com/trizen/obmenu-generator
sudo cp obmenu-generator/obmenu-generator /usr/bin
mkdir ~/.config obemenu-generator 
wget -P ~/.config obemenu-generator https://raw.githubusercontent.com/legawa1701/openbox-installer/master/lib/schema.pl
sudo cpanm Linux::DesktopFiles
sudo cpanm Data::Dump
sudo chmod 777 /usr/bin/obmenu-generator
rm -rf obmenu-generator
obmenu-generator -p -i
echo "Installing success with no error =)"

