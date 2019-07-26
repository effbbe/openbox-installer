## Updating repository
echo "Updating Repositories"
sudo apt-get update && apt-get upgrade
echo 'Update success'


## Installing openbox and supporting applications
echo "Installing openbox and supporting applications"
sudo apt-get install -y openbox obsession obconf menu obmenu xorg xserver-xorg lightdm \
lightdm-gtk-greeter lightdm-gtk-greeter-settings gnome-terminal lxappearance tint2 \
gmrun cifs-utils gvfs-backends policykit-1-gnome gnome-icon-theme-full volumeicon-alsa xscreensaver \
xscreensaver-gl xfce4-power-manager pulseaudio network-manager pavucontrol nitrogen \
network-manager-gnome
echo "Install success with no errors =)"

#Configuring openbox, autostart & menu 
echo "Create Openbox Directory"
mkdir -p /home/$USER/.config/openbox && cd /home/$USER/.config/openbox
echo "Copying autostart file"
https://raw.githubusercontent.com/legawa1701/openbox-installer/master/lib/autostart
echo "Copying rc.xml"
https://raw.githubusercontent.com/legawa1701/openbox-installer/master/lib/rc.xml
echo "Copying menu.xml"
https://raw.githubusercontent.com/legawa1701/openbox-installer/master/lib/menu.xml
echo "Copying file success"

